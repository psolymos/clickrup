
#' @rdname api-timetracking-legacy
NULL

#' @export
#' @rdname api-timetracking-legacy
cuf_track_time <- function(task_id, ...) {
    .Deprecated("cu_create_time_entry")
    task_id <- cu_task_id(task_id)
    .cu_post("task", task_id, "time",
        body=list(...))
}


#' @export
#' @rdname api-timetracking-legacy
cuf_get_tracked_time <- function(task_id) {
    .Deprecated("cu_get_time_entries_within_date_range")
    task_id <- cu_task_id(task_id)
    .cu_get("task", task_id, "time")
}


#' @export
#' @rdname api-timetracking-legacy
cuf_edit_time_tracked <- function(task_id, interval_id, ...) {
    .Deprecated("cu_update_time_entry")
    task_id <- cu_task_id(task_id)
    .cu_put("task", task_id, "time", interval_id,
        body=list(...))
}


#' @export
#' @rdname api-timetracking-legacy
cuf_delete_time_tracked <- function(task_id, interval_id) {
    .Deprecated("cu_delete_time_entry")
    task_id <- cu_task_id(task_id)
    .cu_delete("task", task_id, "time", interval_id)
}
