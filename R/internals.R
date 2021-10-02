## Internal (not exported) functions

## this builds paths from arguments
.cu_path <- function(...) {
    path <- paste(..., sep="/", collapse="/")
    path <- paste0("/api/", getOption("cu_options")$version, "/", path)
    gsub("//", "/", path)
}

## convenience function to handle responses
.cu_process <- function(resp) {
    if (httr::http_error(resp)) {
        stop(
            sprintf("ClickUp API request failed [%s]\n%s - %s",
                httr::status_code(resp), cont$err, cont$ECODE),
          call. = FALSE)
    }
    if (httr::http_type(resp) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    cont <- jsonlite::fromJSON(
        httr::content(resp, "text"),
        simplifyVector = FALSE)
    attr(cont, "response") <- resp
    class(cont) <- "cu"
    cont
}

## convenience function for GET requests
.cu_get <- function(..., query=list()) {
    resp <- .rate_insist(httr::GET(
            httr::modify_url(getOption("cu_options")$baseurl,
                       path = .cu_path(...),
                       query = query),
            httr::add_headers(Authorization = cu_get_pat()),
            httr::content_type_json(),
            httr::accept_json(),
            httr::user_agent(getOption("cu_options")$useragent))
    )
    cont <- .cu_process(resp)
    class(cont) <- c(class(cont), "cu_get")
    cont
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

    message("ClickUp API: Rate limit reached", appendLF = FALSE)

    # sum(sleeps) >= 60
    sleeps <- c(1, 2, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4)
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
