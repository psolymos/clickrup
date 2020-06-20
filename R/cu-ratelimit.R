#' ClickUp API rate limit.
#'
#' The ClickUp API is rate limited per OAuth/PAT token.
#' You will receive a 429 HTTP status code if you exceed the rate limit.
#' According to the API description (<https://clickup.com/api>),
#' the rate limit is 100 requests per minute per token and is subject to change.
#' At the time of writing, the limit is 900/min/token.

#' @param x A cu object returned by an API call.
#'
#' @examples
#' \dontrun{
#' task <- cu_get_task("8ach57")
#' cu_ratelimit(task)
#' }
#'
#' @return
#'
#' Returns a list with the following elements:
#'
#' * `limit`: rate limit (per minute),
#' * `remaining`: remaining requests.
#'
#' @seealso [cu-class] for the cu object class.
#'
#' @export
#' @name cu-ratelimit
cu_ratelimit <- function(x) {
    if (!inherits(x, "cu"))
        stop("x must be a cu object")
    h <- httr::headers(cu_response(x))
    list(limit=as.integer(h[["x-ratelimit-limit"]]),
        remaining=as.integer(h[["x-ratelimit-remaining"]]))
}
