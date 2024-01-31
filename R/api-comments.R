#' Comments
#'
#' Working with comments in ClickUp tasks.

#' @param task_id Task ID.
#' @param view_id View ID.
#' @param list_id List ID.
#' @param comment_id Comment ID.
#' @param ... Named arguments to be passed to API request body,
#'   see the ClickUp API documentation (<https://clickup.com/api>).
#' @param cu_token ClickUp personal access token or an access token from the OAuth flow.
#'   The `CU_PAT` environment variable is used when `NULL`.
#'
#' @return
#'
#' A cu object.
#'
#' @seealso [cu-class] for the cu object class.
#'
#' @name api-comments
NULL

#' @export
#' @rdname api-comments
## Comments / Post Task Comment
## POST https://api.clickup.com/api/v2/task/task_id/comment
##    task_id
##    Example: 9hz.
##    String
##
## If notify_all is true, creation notifications will be sent to
## everyone including the creator of the comment.
##
## Body
## {
##   "comment_text": "Task comment content",
##   "assignee": 183,
##   "notify_all": true
## }
cu_post_task_comment <- function(task_id, ..., cu_token = NULL) {
    task_id <- cu_task_id(task_id)
    .cu_post("task", task_id, "comment",
        body=list(...),
        cu_token = cu_token)
}


#' @export
#' @rdname api-comments
## Comments / Post View Comment
## POST https://api.clickup.com/api/v2/view/view_id/comment
##    view_id
##    105 (string)
##    Example: 3c.
##    String
##
## If notify_all is true, creation notifications will be sent to
## everyone including the creator of the comment.
##
## Body
##
## {
##   "comment_text": "View comment content",
##   "notify_all": true
## }
cu_post_view_comment <- function(view_id, ..., cu_token = NULL) {
    .cu_post("view", view_id, "comment",
        body=list(...),
        cu_token = cu_token)
}


#' @export
#' @rdname api-comments
## Comments / Post List Comment
## POST https://api.clickup.com/api/v2/list/list_id/comment
##    list_id
##    Example: 124.
##    Number
##
## If notify_all is true, creation notifications will be sent to
## everyone including the creator of the comment.
##
## Body
##
## {
##   "comment_text": "List comment content",
##   "assignee": 183,
##   "notify_all": true
## }
cu_post_list_comment <- function(list_id, ..., cu_token = NULL) {
    .cu_post("list", list_id, "comment",
        body=list(...),
        cu_token = cu_token)
}


#' @export
#' @rdname api-comments
## Comments / Get Task Comments
## GET https://api.clickup.com/api/v2/task/task_id/comment
##    task_id
##    Example: 9hz.
##    String
cu_get_task_comments <- function(task_id, cu_token = NULL) {
    task_id <- cu_task_id(task_id)
    .cu_get("task", task_id, "comment", cu_token = cu_token)
}


#' @export
#' @rdname api-comments
## Comments / Get View Comments
## GET https://api.clickup.com/api/v2/view/view_id/comment
##    view_id
##    105 (string)
##    Example: 3c.
##    String
cu_get_view_comments <- function(view_id, cu_token = NULL) {
    .cu_get("view", view_id, "comment", cu_token = cu_token)
}


#' @export
#' @rdname api-comments
## Comments / Get List Comments
## GET https://api.clickup.com/api/v2/list/list_id/comment
##     list_id
##     Example: 124.
##     Number
cu_get_list_comments <- function(list_id, cu_token = NULL) {
    .cu_get("list", list_id, "comment", cu_token = cu_token)
}


#' @export
#' @rdname api-comments
## Comments / Update Comment
## PUT https://api.clickup.com/api/v2/comment/comment_id
##     comment_id
##     Example: 456.
##     Number
##
## Body
##
## {
##    "comment_text": "Updated comment text"
##    "assignee": 183,
##    "resolved": true
## }
cu_put_update_comment <- function(comment_id, ..., cu_token = NULL) {
    .cu_put("comment", comment_id,
        body=list(...),
        cu_token = cu_token)
}


#' @export
#' @rdname api-comments
## Comments / Delete Comment
## DELET Ehttps://api.clickup.com/api/v2/comment/comment_id
##     comment_id
##     Example: 456.
##     Number
cu_delete_comment <- function(comment_id, cu_token = NULL) {
    .cu_delete("comment", comment_id, cu_token = cu_token)
}
