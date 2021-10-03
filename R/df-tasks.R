
#' @rdname api-tasks
NULL

#' @export
#' @rdname api-tasks
cuf_create_task <- function(list_id, ...) {
    out <- cu_create_task(list_id, ...)
    tibblify(list(out), spec_tasks)
}


#' @export
#' @rdname api-tasks
cuf_update_task <- function(task_id, ...) {
    out <- cu_update_task(task_id, ...)
    tibblify(list(out), spec_tasks)
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
    out <- cu_get_tasks(list_id, archived, ...)
    tibblify(out$tasks, spec_tasks)
}


#' @export
#' @rdname api-tasks
cuf_get_task <- function(task_id) {
    out <- cu_get_task(task_id)
    tibblify(list(out), spec_tasks)
}


#' @export
#' @rdname api-tasks
cuf_get_filtered_team_tasks <- function(team_id, ...) {
    out <- cu_get_filtered_team_tasks(team_id, ...)
    tibblify(out$tasks, spec_tasks)
}

