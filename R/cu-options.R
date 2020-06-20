#' Global options for the clickrup package.
#'
#' Options store and allow to set global values for the ClickUp API
#' and for clickrup functions.

#' @details
#'
#' Options are mostly for internal use and to allow API version changes
#' in the future.
#'
#' The `tz` (time zone) option can be set globally for [cu_date_from()].
#' The default value `""` means current time zone, see [strptime()].
#'
#' @param ... Options to set.
#'
#' @examples
#' str(cu_options())
#'
#' op <- cu_options(tz = "GMT") # save old values and set tz
#' cu_options()$tz              # new tz value
#' cu_options(op)               # reset
#' cu_options()$tz              # default tz value
#'
#' @return
#'
#' When parameters are set by `cu_options`, their former values are
#' returned in an invisible named list. Such a list can be passed as an
#' argument to `cu_options` to restore the parameter values.
#' Tags are the following:
#'
#' * `baseurl`: ClickUp API base URL.
#' * `version`: ClickUp API version.
#' * `tz`: time zone.
#' * `useragent`: user agent.
#'
#' @export
#' @name cu-options

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
