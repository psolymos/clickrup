
#' @rdname api-goals
NULL

#' @export
#' @rdname api-goals
cuf_create_goal <- function(team_id, ...) {
    .cu_post("team", team_id, "goal",
        body=list(...))
}


#' @export
#' @rdname api-goals
cuf_update_goal <- function(goal_id, ...) {
    .cu_put("goal", goal_id,
        body=list(...))
}


#' @export
#' @rdname api-goals
cuf_delete_goal <- function(goal_id) {
    .cu_delete("goal", goal_id)
}


#' @export
#' @rdname api-goals
cuf_get_goals <- function(team_id) {
    .cu_get("team", team_id, "goal")
}


#' @export
#' @rdname api-goals
cuf_get_goal <- function(goal_id) {
    .cu_get("goal", goal_id)
}


#' @export
#' @rdname api-goals
cuf_create_key_result <- function(goal_id, ...) {
    .cu_post("goal", goal_id, "key_result",
        body=list(...))
}


#' @export
#' @rdname api-goals
cuf_edit_key_result <- function(key_result_id, ...) {
    .cu_put("key_result", key_result_id,
        body=list(...))
}


#' @export
#' @rdname api-goals
cuf_delete_key_result <- function(key_result_id) {
    .cu_delete("key_result", key_result_id)
}


