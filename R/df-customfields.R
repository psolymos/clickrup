
#' @rdname api-customfields
NULL

#' @export
#' @rdname api-customfields
cuf_get_accessible_custom_fields <- function(list_id) {
    .cu_get("list", list_id, "field")
}


#' @export
#' @rdname api-customfields
#cu_set_custom_field_value
cuf_set_custom_field_value <- function(task_id, field_id, ...) {
    task_id <- cu_task_id(task_id)
    .cu_post("task", task_id, "field", field_id,
        body=list(...))
}


#' @export
#' @rdname api-customfields
cuf_remove_field_value <- function(task_id, field_id) {
    task_id <- cu_task_id(task_id)
    .cu_delete("task", task_id, "field", field_id)
}
