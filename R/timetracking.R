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
cu_track_time <- function(task_id, ...) {
    .cu_post("task", task_id, "time",
        body=list(...))
}



## Time Tracking / Get tracked time
## GET https://api.clickup.com/api/v2/task/task_id/time
##
##     task_id
##     Example: 9hv.
##     String
##
## Get time tracked for a task.
cu_get_tracked_time <- function(task_id) {
    .cu_get("task", task_id, "time")
}


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
cu_edit_time_tracked <- function(task_id, interval_id, ...) {
    .cu_put("task", task_id, "time", interval_id,
        body=list(...))
}


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
cu_delete_time_tracked <- function(task_id, interval_id) {
    .cu_delete("task", task_id, "time", interval_id)
}
