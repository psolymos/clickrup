#' Time tracking legacy
#'
#' Working with time tracking in ClickUp tasks.
#' Note: This is the legacy API for time tracking.
#' Please use the new Time tracking API.
#' You won't be able to update timer entries that uses our
#' Time Tracking 2.0 features that uses labels, descriptions,
#' and making time entries billable.

#' @param task_id Task ID.
#' @param interval_id Interval ID.
#' @param ... Named arguments to be passed to API request body,
#'   see the ClickUp API documentation (<https://clickup.com/api>).
#'   Edit the `start`, `end`, or total `time` of a time tracked entry.
#'
#' @return
#'
#' A cu object.
#' Note: the legacy API comes with a deprecation warning.
#'
#' @seealso [api-timetracking-2] for Time Tracking 2.0,
#'   [cu-class] for the cu object class,
#'   [cu_date_from()] and [cu_date_to()] to deal with POSIX times.
#'
#' @name api-timetracking-legacy
NULL

#' @export
#' @rdname api-timetracking-legacy
## Time Tracking / Track time
## POST https://api.clickup.com/api/v2/task/task_id/time
##
##     task_id
##     Example: 9hv.
##     String
##
## Include the total time or the start and end.
## The time is in milliseconds and the start and end are posix dates.
##
## {
##   "start": 1567780450202,
##   "end": 1508369194377,
##   "time": 8640000
## }
##
## use cu_time to turn POSIXct into unix time for start/end
## note: unix time is also in milliseconds (sec x 1000)
cuf_track_time <- function(task_id, ...) {
    .Deprecated("cu_create_time_entry")
    task_id <- cu_task_id(task_id)
    .cu_post("task", task_id, "time",
        body=list(...))
}


#' @export
#' @rdname api-timetracking-legacy
## Time Tracking / Get tracked time
## GET https://api.clickup.com/api/v2/task/task_id/time
##
##     task_id
##     Example: 9hv.
##     String
##
## Get time tracked for a task.
cuf_get_tracked_time <- function(task_id) {
    .Deprecated("cu_get_time_entries_within_date_range")
    task_id <- cu_task_id(task_id)
    .cu_get("task", task_id, "time")
}


#' @export
#' @rdname api-timetracking-legacy
## Time Tracking / Edit time tracked
## PUT https://api.clickup.com/api/v2/task/task_id/time/interval_id
##
##     task_id
##     Example: 9hv.
##     String
##
##     interval_id
##     Example: 123.
##     String
##
## Edit the start, end, or total time of a time tracked entry.
##
## {
##   "start": 1567780450202,
##   "end": 1508369194377,
##   "time": 8640000
## }
##
## use cu_time to turn POSIXct into unix time for start/end
## note: unix time is also in milliseconds (sec x 1000)
cuf_edit_time_tracked <- function(task_id, interval_id, ...) {
    .Deprecated("cu_update_time_entry")
    task_id <- cu_task_id(task_id)
    .cu_put("task", task_id, "time", interval_id,
        body=list(...))
}


#' @export
#' @rdname api-timetracking-legacy
## Time Tracking / Delete time tracked
## DELETE https://api.clickup.com/api/v2/task/task_id/time/interval_id
##
##     task_id
##     Example: 9hv.
##     String
##
##     interval_id
##     Example: 123.
##     String
##
## Delete a time tracked entry
cuf_delete_time_tracked <- function(task_id, interval_id) {
    .Deprecated("cu_delete_time_entry")
    task_id <- cu_task_id(task_id)
    .cu_delete("task", task_id, "time", interval_id)
}
