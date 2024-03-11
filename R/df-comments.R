
#' @rdname api-comments
NULL

#' @export
#' @rdname api-comments
cuf_post_task_comment <- function(task_id, ...) {
    task_id <- cu_task_id(task_id)
    .cu_post("task", task_id, "comment",
        body=list(...))
}


#' @export
#' @rdname api-comments
cuf_post_view_comment <- function(view_id, ...) {
    .cu_post("view", view_id, "comment",
        body=list(...))
}


#' @export
#' @rdname api-comments
cuf_post_list_comment <- function(list_id, ...) {
    .cu_post("list", list_id, "comment",
        body=list(...))
}


#' @export
#' @rdname api-comments
cuf_get_task_comments <- function(task_id) {
    task_id <- cu_task_id(task_id)
    .cu_get("task", task_id, "comment")
}


#' @export
#' @rdname api-comments
cuf_get_view_comments <- function(view_id) {
    .cu_get("view", view_id, "comment")
}


#' @export
#' @rdname api-comments
cuf_get_list_comments <- function(list_id) {
    .cu_get("list", list_id, "comment")
}


#' @export
#' @rdname api-comments
cuf_put_update_comment <- function(comment_id, ...) {
    .cu_put("comment", comment_id,
        body=list(...))
}


#' @export
#' @rdname api-comments
cuf_delete_comment <- function(comment_id) {
    .cu_delete("comment", comment_id)
}
