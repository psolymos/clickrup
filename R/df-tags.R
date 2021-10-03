
#' @rdname api-tags
NULL

#' @export
#' @rdname api-tags
cuf_get_space_tags <- function(space_id) {
    .cu_get("space", space_id, "tag")
}


#' @export
#' @rdname api-tags
cuf_create_space_tag <- function(space_id, name, ...) {
    .cu_post("space", space_id, "tag",
        body=list(
            tag=list(name=name, ...)))
}


#' @export
#' @rdname api-tags
cuf_edit_space_tag <- function(space_id, tag_name) {
    .cu_put("space", space_id, "tag", tag_name)
}


#' @export
#' @rdname api-tags
cuf_delete_space_tag <- function(space_id) {
    .cu_delete("space", space_id, "tag", tag_name)
}


#' @export
#' @rdname api-tags
cuf_add_tag_to_task <- function(task_id, tag_name) {
    task_id <- cu_task_id(task_id)
    .cu_post("task", task_id, "tag", tag_name)
}


#' @export
#' @rdname api-tags
cuf_delete_space_tag <- function(task_id, tag_name) {
    task_id <- cu_task_id(task_id)
    .cu_delete("task", task_id, "tag", tag_name)
}

