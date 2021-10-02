#' Time tracking 2.0
#'
#' Working with time tracking in ClickUp tasks.
#' Note: A time entry that has a negative duration means
#' that timer is currently ongoing for that user.

#' @param team_id Team ID.
#' @param timer_id Timer ID.
#' @param start_date POSIX start time in milliseconds.
#' @param end_date POSIX end time in milliseconds.
#' @param assignee User ids to filter by separated by commas.
#'   Note: Only Workspace Owners/Admins have access to do this.
#' @param ... Named arguments to be passed to API request body,
#'   see the ClickUp API documentation (<https://clickup.com/api>).
#'
#' @return
#'
#' A cu object.
#'
#' @seealso [api-timetracking-legacy] for Time tracking legacy API,
#'   [cu-class] for the cu object class,
#'   [cu_date_from()] and [cu_date_to()] to deal with POSIX times.
#'
#' @name api-timetracking-2
NULL

#' @export
#' @rdname api-timetracking-2
## Time Tracking 2.0 / Get time entries within a date range
## GET https://api.clickup.com/api/v2/team/team_id/time_entries?start_date=&end_date=&assignee=
##
##    team_id
##    Example: 512.
##    Number
##
##    start_date
##    Posix Time in Milliseconds
##    Number
##
##    end_date
##    Posix Time in Milliseconds
##    Number
##
##    assignee
##    User ids to filter by separated by commas.
##        Note: Only Workspace Owners/Admins have access to do this.
##    Number
cuf_get_time_entries_within_date_range <- function(team_id,
start_date, end_date, assignee) {
    .cu_get("team", team_id, "time_entries",
        query = list(
            "start_date"=start_date,
            "end_date"=end_date,
            "assignee"=assignee))
}


#' @export
#' @rdname api-timetracking-2
## Time Tracking 2.0 / Get singular time entry
## GET https://api.clickup.com/api/v2/team/team_id/time_entries/timer_id
##
##    team_id
##    Example: 512.
##    Number
##
##    timer_id
##    Example: 1963465985517105840.
##    String
cuf_get_singular_time_entry <- function(team_id, timer_id) {
    .cu_get("team", team_id, "time_entries", timer_id)
}


#' @export
#' @rdname api-timetracking-2
## Time Tracking 2.0 / Get time entry history
## GET https://api.clickup.com/api/v2/team/team_id/time_entries/timer_id/history
##
##    team_id
##    Example: 512.
##    Number
##
##    timer_id
##    Example: 1963465985517105840.
##    String
cuf_get_time_entry_history <- function(team_id, timer_id) {
    .cu_get("team", team_id, "time_entries", timer_id, "history")
}


#' @export
#' @rdname api-timetracking-2
## Time Tracking 2.0 / Get running time entry
## GET https://api.clickup.com/api/v2/team/team_id/time_entries/current
##
##    team_id
##    Example: 512.
##    Number
cuf_get_running_time_entry <- function(team_id, timer_id) {
    .cu_get("team", team_id, "time_entries", "current")
}


#' @export
#' @rdname api-timetracking-2
## Time Tracking 2.0 / Create a time entry
## POST https://api.clickup.com/api/v2/team/team_id/time_entries
##
##    team_id
##    Example: 512.
##    Number
##
## {
##   "description": "from api",
##   "tags": [
##     {
##       "name": "name of tag",
##       "tag_bg": "#BF55EC",
##       "tag_fg": "#BF55EC"
##     }
##   ],
##   "start": 1595282645000,
##   "billable": true,
##   "duration": 50000,
##   "assignee": 1
## }
cuf_create_time_entry <- function(team_id, ...) {
    .cu_post("team", team_id, "time_entries",
        body=list(...))
}


#' @export
#' @rdname api-timetracking-2
## Time Tracking 2.0 / Remove tags from time entries
## DELETE https://api.clickup.com/api/v2/team/team_id/time_entries/tags
##
##     team_id
##     Example: 512.
##     Number
##
## {
##   "time_entry_ids": [
##     "timer_id"
##   ],
##   "tags": [
##     "name of tag"
##   ]
## }
cuf_remove_tags_from_time_entries <- function(team_id, ...) {
    .cu_delete("team", team_id, "time_entries", "tags",
        body=list(...))
}


#' @export
#' @rdname api-timetracking-2
## Time Tracking 2.0 / Get all tags from time entries
## GET https://api.clickup.com/api/v2/team/team_id/time_entries/tags
##
##     team_id
##     Example: 512.
##     Number
cuf_get_all_tags_from_time_entries <- function(team_id) {
    .cu_get("team", team_id, "time_entries", "tags")
}


#' @export
#' @rdname api-timetracking-2
## Time Tracking 2.0 / Add tags from time entries
## POST https://api.clickup.com/api/v2/team/team_id/time_entries/tags
##
##     team_id
##     Example: 512.
##     Number
##
## {
##   "time_entry_ids": [
##     "timer_id"
##   ],
##   "tags": [
##     "name of tags"
##   ]
## }
cuf_add_tags_from_time_entries <- function(team_id, ...) {
    .cu_post("team", team_id, "time_entries", "tags",
        body=list(...))
}


#' @export
#' @rdname api-timetracking-2
## Time Tracking 2.0 / Change tag names from time entries
## PUT https://api.clickup.com/api/v2/team/team_id/time_entries/tags
##
##    team_id
##    Example: 512.
##    Number
##
## {
##   "name": "old tag name",
##   "new_name": "new tag name",
##   "tag_bg": "#000000",
##   "tag_fg": "#000000"
## }
cuf_change_tag_names_from_time_entries <- function(team_id, ...) {
    .cu_put("team", team_id, "time_entries", "tags",
        body=list(...))
}


#' @export
#' @rdname api-timetracking-2
## Time Tracking 2.0 / Start a time Entry
## POST https://api.clickup.com/api/v2/team/team_id/time_entries/start/timer_id
##
##     team_id
##     Example: 512.
##     Number
##
##     timer_id
##     Example: 2004673344540003570.
##     Number
##
## {
##   "description": "from api",
##   "tags": [
##     "tag1"
##   ],
##   "tid": "task_id",
##   "billable": false
## }
cuf_start_time_entry <- function(team_id, timer_id, ...) {
    .cu_post("team", team_id, "time_entries", "start", timer_id,
        body=list(...))
}


#' @export
#' @rdname api-timetracking-2
## Time Tracking 2.0 / Stop a time Entry
## POST https://api.clickup.com/api/v2/team/team_id/time_entries/stop
##
##    team_id
##    Example: 512.
##    Number
cuf_stop_time_entry <- function(team_id) {
    .cu_post("team", team_id, "time_entries", "stop")
}


#' @export
#' @rdname api-timetracking-2
## Time Tracking 2.0 / Delete a time Entry
## DELETE https://api.clickup.com/api/v2/team/team_id/time_entries/timer_id
##
##     team_id
##     Example: 512.
##     Number
##
##     timer_id
##     List of timer ids to delete separated by commas
##     Number
cuf_delete_time_entry <- function(team_id, timer_id) {
    .cu_delete("team", team_id, "time_entries", timer_id)
}


#' @export
#' @rdname api-timetracking-2
## Time Tracking 2.0 / Update a time Entry
## PUT https://api.clickup.com/api/v2/team/team_id/time_entries/timer_id
##
##     team_id
##     Example: 512.
##     Number
##
##     timer_id
##     Example: 2004673344540003570.
##     Number
##
## Accessible tag actions are ["replace", "add", "remove"]
## {
##   "description": "",
##   "tags": [
##     "name of tags"
##   ],
##   "tag_action": "add",
##   "start": 1595289395842,
##   "end": 1595289495842,
##   "tid": "task_id",
##   "billable": true,
##   "duration": 100000
## }
cuf_update_time_entry <- function(team_id, timer_id, ...) {
    .cu_put("team", team_id, "time_entries", timer_id,
        body=list(...))
}
