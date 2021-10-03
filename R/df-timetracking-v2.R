
#' @rdname api-timetracking-2
NULL

#' @export
#' @rdname api-timetracking-2
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
cuf_get_singular_time_entry <- function(team_id, timer_id) {
    .cu_get("team", team_id, "time_entries", timer_id)
}


#' @export
#' @rdname api-timetracking-2
cuf_get_time_entry_history <- function(team_id, timer_id) {
    .cu_get("team", team_id, "time_entries", timer_id, "history")
}


#' @export
#' @rdname api-timetracking-2
cuf_get_running_time_entry <- function(team_id, timer_id) {
    .cu_get("team", team_id, "time_entries", "current")
}


#' @export
#' @rdname api-timetracking-2
cuf_create_time_entry <- function(team_id, ...) {
    .cu_post("team", team_id, "time_entries",
        body=list(...))
}


#' @export
#' @rdname api-timetracking-2
cuf_remove_tags_from_time_entries <- function(team_id, ...) {
    .cu_delete("team", team_id, "time_entries", "tags",
        body=list(...))
}


#' @export
#' @rdname api-timetracking-2
cuf_get_all_tags_from_time_entries <- function(team_id) {
    .cu_get("team", team_id, "time_entries", "tags")
}


#' @export
#' @rdname api-timetracking-2
cuf_add_tags_from_time_entries <- function(team_id, ...) {
    .cu_post("team", team_id, "time_entries", "tags",
        body=list(...))
}


#' @export
#' @rdname api-timetracking-2
cuf_change_tag_names_from_time_entries <- function(team_id, ...) {
    .cu_put("team", team_id, "time_entries", "tags",
        body=list(...))
}


#' @export
#' @rdname api-timetracking-2
cuf_start_time_entry <- function(team_id, timer_id, ...) {
    .cu_post("team", team_id, "time_entries", "start", timer_id,
        body=list(...))
}


#' @export
#' @rdname api-timetracking-2
cuf_stop_time_entry <- function(team_id) {
    .cu_post("team", team_id, "time_entries", "stop")
}


#' @export
#' @rdname api-timetracking-2
cuf_delete_time_entry <- function(team_id, timer_id) {
    .cu_delete("team", team_id, "time_entries", timer_id)
}


#' @export
#' @rdname api-timetracking-2
cuf_update_time_entry <- function(team_id, timer_id, ...) {
    .cu_put("team", team_id, "time_entries", timer_id,
        body=list(...))
}
