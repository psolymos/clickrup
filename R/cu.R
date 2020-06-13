## common stuff ------------------------------------------------

# need to `export CU_PAT="TOKEY"` but RStudio won't see it on Mac
# follow this: http://btibert3.github.io/2015/12/08/Environment-Variables-in-Rstudio-on-Mac.html
cu_pat <- function() {
    pat <- Sys.getenv("CU_PAT")
    if (identical(pat, ""))
        stop("Set CU_PAT env var as your ClickUp personal access token",
            call. = FALSE)
    pat
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

## convenience function for GET requests
.cu_get <- function(..., query=list()) {
    resp <- httr::GET(
            httr::modify_url(getOption("cu_options")$baseurl,
                       path = .cu_path(...),
                       query = query),
            httr::add_headers(Authorization = cu_pat()),
            user_agent("http://github.com/psolymos/clickrup"))
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

## function to transform unix dates to POSIXct
cu_date <- function(x, tz = NULL, ...) {
    if (is.null(tz))
        tz <- getOption("cu_options")$tz
    as.POSIXct(as.numeric(x)/1000, tz = tz, origin="1970-01-01", ...)
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
