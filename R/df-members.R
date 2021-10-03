
#' @rdname api-members
NULL

#' @export
#' @rdname api-members
cuf_get_task_members <- function(task_id) {
    task_id <- cu_task_id(task_id)
    .cu_get("task", task_id, "member")
}


#' @export
#' @rdname api-members
cuf_get_list_members <- function(list_id) {
    .cu_get("list", list_id, "member")
}
