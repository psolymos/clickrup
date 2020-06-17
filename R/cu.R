## common stuff ------------------------------------------------

# need to `export CU_PAT="TOKEY"` but RStudio won't see it on Mac
# follow this: http://btibert3.github.io/2015/12/08/Environment-Variables-in-Rstudio-on-Mac.html
cu_get_pat <- function() {
    pat <- Sys.getenv("CU_PAT")
    if (identical(pat, ""))
        stop("Set CU_PAT env var as your ClickUp personal access token",
            call. = FALSE)
    pat
}

cu_set_pat <- function(token) {
    Sys.setenv(CU_PAT=token)
}

## this allows manipulating cu options conveniently
cu_options <- function(...) {
    opar <- getOption("cu_options")
    args <- list(...)
    if (length(args)) {
        if (length(args) == 1L && is.list(args[[1L]])) {
            npar <- args[[1L]]
        } else {
            npar <- opar
            npar[match(names(args), names(npar))] <- args
        }
        options("cu_options" = npar)
    }
    invisible(opar)
}

## this builds paths from arguments
.cu_path <- function(...) {
    path <- paste(..., sep="/", collapse="/")
    path <- paste0("/api/", getOption("cu_options")$version, "/", path)
    gsub("//", "/", path)
}

## convenience function to handle responses
.cu_process <- function(resp) {
    if (http_type(resp) != "application/json") {
        stop("API did not return json", call. = FALSE)
    }
    cont <- jsonlite::fromJSON(
        httr::content(resp, "text"),
        simplifyVector = FALSE)
    if (httr::http_error(resp)) {
        stop(
            sprintf("ClickUp API request failed [%s]\n%s - %s",
                status_code(resp), cont$err, cont$ECODE),
          call. = FALSE)
    }
    attr(cont, "response") <- resp
    class(cont) <- "cu"
    cont
}

## convenience function for GET requests
.cu_get <- function(..., query=list()) {
    resp <- httr::GET(
            httr::modify_url(getOption("cu_options")$baseurl,
                       path = .cu_path(...),
                       query = query),
            httr::add_headers(Authorization = cu_get_pat()),
            httr::content_type_json(),
            accept_json(),
            user_agent(getOption("cu_options")$useragent))
    cont <- .cu_process(resp)
    class(cont) <- c(class(cont), "cu_get")
    cont
}

## convenience function for POST requests
.cu_post <- function(..., body=NULL, query=list()) {
    resp <- httr::POST(
            httr::modify_url(getOption("cu_options")$baseurl,
                       path = .cu_path(...),
                       query = query),
            httr::add_headers(Authorization = cu_get_pat()),
            httr::content_type_json(),
            accept_json(),
            body=jsonlite::toJSON(body, auto_unbox=TRUE),
            encode="json",
            user_agent(getOption("cu_options")$useragent))
    cont <- .cu_process(resp)
    class(cont) <- c(class(cont), "cu_post")
    cont
}
## convenience function for PUT requests
.cu_put <- function(..., body=NULL, query=list()) {
    resp <- httr::PUT(
            httr::modify_url(getOption("cu_options")$baseurl,
                       path = .cu_path(...),
                       query = query),
            httr::add_headers(Authorization = cu_get_pat()),
            httr::content_type_json(),
            accept_json(),
            body=jsonlite::toJSON(body, auto_unbox=TRUE),
            encode="json",
            user_agent(getOption("cu_options")$useragent))
    cont <- .cu_process(resp)
    class(cont) <- c(class(cont), "cu_put")
    cont
}
## convenience function for DELETE requests
.cu_delete <- function(..., body=NULL, query=list()) {
    resp <- httr::DELETE(
            httr::modify_url(getOption("cu_options")$baseurl,
                       path = .cu_path(...),
                       query = query),
            httr::add_headers(Authorization = cu_get_pat()),
            httr::content_type_json(),
            accept_json(),
            body=jsonlite::toJSON(body, auto_unbox=TRUE),
            encode="json",
            user_agent(getOption("cu_options")$useragent))
    cont <- .cu_process(resp)
    class(cont) <- c(class(cont), "cu_delete")
    cont
}

## unix times in CU are milliseconds (sec x1000)
## function to transform unix dates to POSIXct
cu_date <- function(x, tz = NULL, ...) {
    if (is.null(tz))
        tz <- getOption("cu_options")$tz
    as.POSIXct(as.numeric(x)/1000, tz = tz, origin="1970-01-01", ...)
}
## turning POSIXct to unix time
cu_time <- function(x) {
    as.numeric(unclass(as.POSIXct(x))*1000)
}


## The API is rate limited per OAuth token.
## You will receive a 429 HTTP status code if you exceed the rate limit.
## The rate limit is 100 requests per minute per token and is subject to change.
## Actually it looks like limit is 900/min
cu_ratelimit <- function(x) {
    if (!inherits(x, "cu"))
        stop("x must be a cu object")
    h <- httr::headers(attr(x, "response"))
    list(limit=as.integer(h[["x-ratelimit-limit"]]),
        remaining=as.integer(h[["x-ratelimit-remaining"]]))
}

## turns cu object into a list
as.list.cu <- function(x, ...) {
    attr(x, "response") <- NULL
    unclass(x)
}

## print without response attribute
print.cu <- function(x, ...) {
    print(as.list(x), ...)
    invisible(x)
}

## str without the response attribute
str.cu <- function(x, ...) {
    str(as.list(x), ...)
    invisible(x)
}

## extracts the response attribute
cu_response <- function(x, ...) {
    if (!inherits(x, "cu"))
        stop("x must be a cu object")
    attr(x, "response")
}

cu_priority <- function(score) {
    p <- factor(as.character(score), c("1", "2", "3", "4"))
    levels(p) <- c("Urgent", "High", "Normal", "Low")
    as.character(p)
}



## WRAPPERS

# include_closed = FALSE by default
cu_get_tasks_all <- function(team_id, ...) {
    p <- 0
    done <- FALSE
    out <- list(tasks=NULL)
    while (!done) {
        batch <- cu_get_tasks_filtered(team_id, page=p, ...)
        if (length(batch$tasks)) {
            out$tasks <- c(out$tasks, batch$tasks)
            p <- p + 1
        } else {
            done <- TRUE
        }
    }
    out
}
