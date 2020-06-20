#' Methods for cu objects.
#'
#' Calls to the ClickUp API return objects of class cu.
#' The obejct is a list based on the parsed JSON response
#' from the call. The response is stored as an attribute.
#' Methods are defined for better printing and coercion.

#' @param x An object of class cu.
#' @param object An object of class cu.
#' @param ... Other optional arguments passed to methods.
#'
#' @seealso [cu_response()] for retrieving the response attribute from a cu object.
#'
#' @name cu-class
#'
NULL

#' @export
#' @rdname cu-class
## turns cu object into a list
as.list.cu <- function(x, ...) {
    attr(x, "response") <- NULL
    unclass(x)
}

#' @export
#' @rdname cu-class
## print without response attribute
print.cu <- function(x, ...) {
    print(as.list(x), ...)
    invisible(x)
}

#' @export
#' @rdname cu-class
## str without the response attribute
str.cu <- function(object, ...) {
    utils::str(as.list(object), ...)
    invisible(object)
}
