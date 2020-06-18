## Helper functions

# need to `export CU_PAT="TOKEY"` but RStudio won't see it on Mac
# follow this: http://btibert3.github.io/2015/12/08/Environment-Variables-in-Rstudio-on-Mac.html
cu_get_pat <- function() {
    pat <- Sys.getenv("CU_PAT")
    if (identical(pat, ""))
        stop("Set CU_PAT env var as your ClickUp personal access token",
            call. = FALSE)
    invisible(pat)
}

## set PAT
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

## extracts the response attribute
cu_response <- function(x, ...) {
    if (!inherits(x, "cu"))
        stop("x must be a cu object")
    attr(x, "response")
}

## turning priority scores to labels
cu_priority <- function(score) {
    p <- factor(as.character(score), c("1", "2", "3", "4"))
    levels(p) <- c("Urgent", "High", "Normal", "Low")
    as.character(p)
}
