
#' @rdname api-tasktemplates
NULL

#' @export
#' @rdname api-tasktemplates
cuf_get_task_templates <- function(team_id, page) {
    .cu_get("team", team_id, "taskTemplate",
            query = list(page = page))
}


#' @export
#' @rdname api-tasktemplates
cuf_create_task_from_template <- function(list_id, template_id, name, ...) {
    .cu_post("list", list_id, "taskTemplate", template_id,
        body=list(name=name, ...))
}
