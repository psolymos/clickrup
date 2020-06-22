#' Extracts the response attribute
#'
#' The function extracts the response attribute from a cu object
#' after an ClickUp API call.
#'
#' @param x An object of class cu.
#'
#' @examples
#' \dontrun{
#' task <- cu_get_task("8ach57")
#' cu_response(task)
#' }
#'
#' @return
#'
#' A response object as returned by [httr::response()].
#' Only calls to existing API endpoints return a response attribute.
#' Wrapper functions that make multiple calls to endpoints
#' (e.g. due to paging etc.) do not store the responses
#' and return `NULL`.
#'
#' @seealso [httr::response()] for the response object,
#'   and [cu-class] for the cu object class.
#'
#' @export
#' @name cu-response

cu_response <- function(x) {
    if (!inherits(x, "cu"))
        stop("x must be a cu object")
    attr(x, "response")
}
