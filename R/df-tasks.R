
#' @rdname api-tasks
NULL

#' @export
#' @rdname api-tasks
cuf_create_task <- function(list_id, ...) {
    .cu_post("list", list_id, "task",
        body=list(...))
}


#' @export
#' @rdname api-tasks
cuf_update_task <- function(task_id, ...) {
    task_id <- cu_task_id(task_id)
    .cu_put("task", task_id,
        body=list(...))
}


#' @export
#' @rdname api-tasks
cuf_delete_task <- function(task_id) {
    task_id <- cu_task_id(task_id)
    .cu_delete("task", task_id)
}


#' @export
#' @rdname api-tasks
# ... takes parameters, most importantly page (starting at 0)
cuf_get_tasks <- function(list_id, archived=FALSE, ...) {
    .cu_get("list", list_id, "task",
            query = list("archived" = tolower(archived), ...))
}


#' @export
#' @rdname api-tasks
cuf_get_task <- function(task_id) {
    task_id <- cu_task_id(task_id)
    .cu_get("task", task_id)
}


#' @export
#' @rdname api-tasks
cuf_get_filtered_team_tasks <- function(team_id, ...) {
    .cu_get("team", team_id, "task",
            query = list(...))
}

