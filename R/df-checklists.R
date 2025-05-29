
#' @rdname api-checklists
NULL

#' @export
#' @rdname api-checklists
cuf_create_checklist <- function(task_id, name) {
    task_id <- cu_task_id(task_id)
    .cu_post("task", task_id, "checklist",
        body=list(name = name))
}
#cu_create_checklist("8ach57", "New checklist")


#' @export
#' @rdname api-checklists
cuf_edit_checklist <- function(checklist_id, position) {
    .cu_put("checklist", checklist_id,
        body=list(position = position))
}
#cu_edit_checklist("4bc57892-a1a6-44f4-894d-d98de71f4054", 0)


#' @export
#' @rdname api-checklists
cuf_delete_checklist <- function(checklist_id) {
    .cu_delete("checklist", checklist_id)
}
#cu_delete_checklist("4bc57892-a1a6-44f4-894d-d98de71f4054")


#' @export
#' @rdname api-checklists
cuf_create_checklist_item <- function(checklist_id, name, ...) {
    .cu_post("checklist", checklist_id, "checklist_item",
        body=list(name = name, ...))
}
#cu_create_checklist_item("40146d1e-efe5-4140-a0ba-ad39c9dec18c",
#                              name="New item 1")
#cu_create_checklist_item("40146d1e-efe5-4140-a0ba-ad39c9dec18c",
#                              name="New item 2",  assignee=4471793)
#cu_create_checklist_item("40146d1e-efe5-4140-a0ba-ad39c9dec18c",
#                              name="New item 3",
#                              assignee=NA, resolved=TRUE, parent=NA)


#' @export
#' @rdname api-checklists
cuf_edit_checklist_item <- function(checklist_id, checklist_item_id, ...) {
    .cu_put("checklist", checklist_id, "checklist_item", checklist_item_id,
        body=list(...))
}
#cu_put_edit_checklist_item("40146d1e-efe5-4140-a0ba-ad39c9dec18c",
#    "8849fcba-9db4-4400-a78e-cfced2ae6ce0",
#    name="Renamed to that", resolved=TRUE)


#' @export
#' @rdname api-checklists
cuf_delete_checklist_item <- function(checklist_id, checklist_item_id) {
    .cu_delete("checklist", checklist_id, "checklist_item", checklist_item_id)
}
#cu_delete_checklist_item("40146d1e-efe5-4140-a0ba-ad39c9dec18c",
#    "8849fcba-9db4-4400-a78e-cfced2ae6ce0")

