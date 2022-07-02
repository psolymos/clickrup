#' Handling ClickUp date/time values.
#'
#' `cu_date_from` turns ClickUp date/time format (Unix time
#' in milliseconds) to [POSIXct()].
#' `cu_date_to` turns a POSIXct coercible date/time value
#' back to Unix time.

#' @param ms ClickUp date/time format, Unix time in milliseconds.
#' @param tz time zone, when `NULL` it defaults to `cu_options()$tz`.
#' @param dt POSIXct coercible date/time value.
#' @param ... Other optional arguments passed to [as.POSIXct()].
#'
#' @examples
#' \dontrun{
#' task_id <- "8ach57"
#' due_date <- as.POSIXct("2020-12-24 21:15:49 MDT")
#'
#' task <- cu_get_task(task_id)
#' task$due_date
#'
#' cu_date_to(due_date)
#' task_up <- cu_update_task("8ach57", due_date=cu_date_to(due_date))
#'
#' cu_date_from(task_up$due_date)
#' identical(cu_date_from(task_up$due_date), due_date)
#' }
#'
#' @return
#'
#' `cu_date_from` returns [POSIXct()].
#'
#' `cu_date_to` returns Unix time as character .
#'
#' @seealso [cu_options()] to set `tz` globally.
#'
#' @name cu-date
#'
#'
NULL

#' @export
#' @rdname cu-date
## unix times in CU are milliseconds (sec x1000)
## function to transform unix dates to POSIXct
cu_date_from <- function(ms, tz = NULL, ...) {
    if (is.null(tz))
        tz <- getOption("cu_options")$tz
    as.POSIXct(as.numeric(ms)/1000, tz = tz, origin="1970-01-01", ...)
}

#' @export
#' @rdname cu-date
## turning POSIXct to unix time
cu_date_to <- function(dt, tz = NULL) {
    if (is.null(tz))
        tz <- getOption("cu_options")$tz

    as.character(round(unclass(as.POSIXct(dt))*1000))
}
