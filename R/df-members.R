
#' @rdname api-members
NULL

#' @export
#' @rdname api-members
cuf_get_task_members <- function(task_id, cu_token = NULL) {
    out <- cu_get_task_members(task_id, cu_token = cu_token)
    tibblify(out$members, spec_members)
}


#' @export
#' @rdname api-members
cuf_get_list_members <- function(list_id, cu_token = NULL) {
    out <- cu_get_list_members(list_id, cu_token = cu_token)
    tibblify(out$members, spec_members)
}
