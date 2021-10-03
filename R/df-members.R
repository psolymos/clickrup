
#' @rdname api-members
NULL

#' @export
#' @rdname api-members
cuf_get_task_members <- function(task_id) {
    out <- cu_get_task_members(task_id)
    tibblify(out$members, spec_members)
}


#' @export
#' @rdname api-members
cuf_get_list_members <- function(list_id) {
    out <- cu_get_list_members(list_id)
    tibblify(out$members, spec_members)
}
