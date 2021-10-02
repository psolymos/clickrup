
#' @rdname api-members
NULL

#' @export
#' @rdname api-members
## Members / Get Task Members
## GET https://api.clickup.com/api/v2/task/task_id/member
##
##    task_id
##    Example: 9hz.
##    String
cuf_get_task_members <- function(task_id) {
    task_id <- cu_task_id(task_id)
    .cu_get("task", task_id, "member")
}


#' @export
#' @rdname api-members
## Members / Get List Members
## GET https://api.clickup.com/api/v2/list/list_id/member
##
##    list_id
##    Example: 123.
##    Number
cuf_get_list_members <- function(list_id) {
    .cu_get("list", list_id, "member")
}
