## Internal (not exported) functions

## this builds paths from arguments
.cu_path <- function(...) {
    path <- paste(..., sep="/", collapse="/")
    path <- paste0("/api/", getOption("cu_options")$version, "/", path)
    gsub("//", "/", path)
}

## convenience function to handle responses
.cu_process <- function(resp) {
    cont_text <- httr::content(resp, "text", encoding = "utf-8")
    if (httr::http_error(resp)) {
        if (httr::http_type(resp) == "application/json") {
            cont <- jsonlite::fromJSON(cont_text, simplifyVector = FALSE)
            stop(
                sprintf("ClickUp API request failed [%s]\n%s - %s",
                        httr::status_code(resp), cont$err, cont$ECODE),
                call. = FALSE
            )
        } else {
            stop(
                sprintf("ClickUp API request failed [%s]\n%s",
                        httr::status_code(resp), cont_text),
                call. = FALSE
            )
        }
    }
    if (httr::http_type(resp) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    cont <- jsonlite::fromJSON(cont_text, simplifyVector = FALSE)
    attr(cont, "response") <- resp
    class(cont) <- "cu"
    cont
}

## convenience function for GET requests with support for paging
.cu_get <- function(..., query=list(), paging=TRUE) {
    chunk <- .cu_get_page(..., query = query)
    out <- chunk
    page <- 0
    repeat {
        if (length(chunk) == 1) {
            if (length(chunk[[1]]) < 100) {
                break
            }
        } else if (length(chunk) == 2) {
            if (names(chunk)[[2]] != "last_page") {
                break
            }
            # Clear output
            out[["last_page"]] <- NULL
            if (chunk[["last_page"]]) {
                break
            }
        } else {
            break
        }

        page <- page + 1
        query$page <- page
        chunk <- .cu_get_page(..., query = query)
        stopifnot(length(chunk) %in% 1:2)
        out[[1]] <- c(out[[1]], chunk[[1]])
    }

    class(out) <- c(class(out), "cu_get")
    out
}

## convenience function for GET requests
.cu_get_page <- function(..., query=list()) {
    resp <- .rate_insist(httr::GET(
            httr::modify_url(getOption("cu_options")$baseurl,
                       path = .cu_path(...),
                       query = query),
            httr::add_headers(Authorization = cu_get_pat()),
            httr::content_type_json(),
            httr::accept_json(),
            httr::user_agent(getOption("cu_options")$useragent))
    )
    .cu_process(resp)
}

## convenience function for POST requests
.cu_post <- function(..., body=NULL, query=list()) {
    resp <- .rate_insist(httr::POST(
            httr::modify_url(getOption("cu_options")$baseurl,
                       path = .cu_path(...),
                       query = query),
            httr::add_headers(Authorization = cu_get_pat()),
            httr::content_type_json(),
            httr::accept_json(),
            body=jsonlite::toJSON(body, auto_unbox=TRUE),
            encode="json",
            httr::user_agent(getOption("cu_options")$useragent))
    )
    cont <- .cu_process(resp)
    class(cont) <- c(class(cont), "cu_post")
    cont
}

## convenience function for PUT requests
.cu_put <- function(..., body=NULL, query=list()) {
    resp <- .rate_insist(httr::PUT(
            httr::modify_url(getOption("cu_options")$baseurl,
                       path = .cu_path(...),
                       query = query),
            httr::add_headers(Authorization = cu_get_pat()),
            httr::content_type_json(),
            httr::accept_json(),
            body=jsonlite::toJSON(body, auto_unbox=TRUE),
            encode="json",
            httr::user_agent(getOption("cu_options")$useragent))
    )
    cont <- .cu_process(resp)
    class(cont) <- c(class(cont), "cu_put")
    cont
}

## convenience function for DELETE requests
.cu_delete <- function(..., body=NULL, query=list()) {
    resp <- .rate_insist(httr::DELETE(
            httr::modify_url(getOption("cu_options")$baseurl,
                       path = .cu_path(...),
                       query = query),
            httr::add_headers(Authorization = cu_get_pat()),
            httr::content_type_json(),
            httr::accept_json(),
            body=jsonlite::toJSON(body, auto_unbox=TRUE),
            encode="json",
            httr::user_agent(getOption("cu_options")$useragent))
    )
    cont <- .cu_process(resp)
    class(cont) <- c(class(cont), "cu_delete")
    cont
}

.rate_insist <- function(code) {
    quo <- rlang::enquo(code)

    resp <- rlang::eval_tidy(quo)
    if (httr::status_code(resp) != 429) {
        return(resp)
    }

    reset <- resp$headers[["x-ratelimit-reset"]]
    if (!is.null(reset)) {
        # sleep as indicated, and then retry at most twice
        sleeps <- c(ceiling(as.numeric(reset) - as.numeric(Sys.time())), 1, 1)
        message("ClickUp API: Rate limit reached, sleeping for ", sleeps[[1]], " seconds", appendLF = FALSE)
    } else {
        sleeps <- c(1, 2, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4)
        # sum(sleeps) >= 60
        message("ClickUp API: Rate limit reached, sleeping for up to ", sum(sleeps), "seconds", appendLF = FALSE)
    }

    for (sleep in sleeps) {
        Sys.sleep(sleep)
        message(".", appendLF = FALSE)
        resp <- rlang::eval_tidy(quo)
        if (httr::status_code(resp) != 429) {
            message()
            return(resp)
        }
    }

    message()
    resp
}
