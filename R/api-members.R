#' Members
#'
#' Working with members in ClickUp tasks (<https://clickup.com/api>).

#' @param task_id Task ID.
#' @param list_id List ID.
#'
#' @return
#'
#' A cu object.
#'
#' @seealso [cu-class] for the cu object class.
#'
#' @name api-members
NULL

#' @export
#' @rdname api-members
## Members / Get Task Members
## GET https://api.clickup.com/api/v2/task/task_id/member
##
##    task_id
##    Example: 9hz.
##    String
cu_get_task_members <- function(task_id) {
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
cu_get_list_members <- function(list_id) {
    .cu_get("list", list_id, "member")
}
