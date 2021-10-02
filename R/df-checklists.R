#' Checklists
#'
#' Working with checklists in ClickUp tasks.

#' @param task_id Task ID.
#' @param name Checklist or checlist item name.
#' @param checklist_id Checklist ID.
#' @param position Position is the zero-based index of the order you want
#'   the checklist to exist on the task. If you want the checklist to be
#'   in the first position, pass 0.
#' @param checklist_item_id Checklist item ID.
#' @param ... Named arguments to be passed to API request body,
#'   see the ClickUp API documentation (<https://clickup.com/api>).
#'
#' @examples
#' \dontrun{
#' ## create new checklist
#' cl <- cu_create_checklist("8ach57", "New checklist")
#'
#' ## change position of checklist
#' cu_edit_checklist(cl$checklist$id, position = 0)
#'
#' ## create checklist items
#' cli <- cu_create_checklist_item(cl$checklist$id, name="New item 1")
#' cli <- cu_create_checklist_item(cl$checklist$id, name="New item 2",
#'     assignee = 4471793)
#' cli <- cu_create_checklist_item(cl$checklist$id, name="New item 3",
#'      assignee = NA, resolved = TRUE, parent = NA)
#'
#' ## delete checklist items
#' cu_delete_checklist_item(cli$checklist$id,
#'      cli$checklist$items[[1]]$id)
#'
#' ## delete checklist
#' cu_delete_checklist(cli$checklist$id)
#' }
#'
#' @return
#'
#' A cu object.
#'
#' @seealso [cu-class] for the cu object class.
#'
#' @name api-checklists
NULL

#' @export
#' @rdname api-checklists
## Checklists / Create Checklist
## POST https://api.clickup.com/api/v2/task/task_id/checklist
##    task_id    Example: 9hz.    String
cuf_create_checklist <- function(task_id, name) {
    task_id <- cu_task_id(task_id)
    .cu_post("task", task_id, "checklist",
        body=list(name = name))
}
#cu_create_checklist("8ach57", "New checklist")


#' @export
#' @rdname api-checklists
## Checklists / Edit Checklist
## PUT https://api.clickup.com/api/v2/checklist/checklist_id
##    checklist_id
##    b8a8-48d8-a0c6-b4200788a683 (uuid)
##    Example: b955c4dc.
##    String
## position is the zero-based index of the order you want the checklist
## to exist on the task. If you want the checklist to be in the first
## position, pass '{ "position": 0 }'
cuf_edit_checklist <- function(checklist_id, position) {
    .cu_put("checklist", checklist_id,
        body=list(position = position))
}
#cu_edit_checklist("4bc57892-a1a6-44f4-894d-d98de71f4054", 0)


#' @export
#' @rdname api-checklists
## Checklists / Delete Checklist
## DELETE https://api.clickup.com/api/v2/checklist/checklist_id
## checklist_id
##    b8a8-48d8-a0c6-b4200788a683 (uuid)
##    Example: b955c4dc. String
cuf_delete_checklist <- function(checklist_id) {
    .cu_delete("checklist", checklist_id)
}
#cu_delete_checklist("4bc57892-a1a6-44f4-894d-d98de71f4054")


#' @export
#' @rdname api-checklists
## Checklists / Create Checklist Item
## POST https://api.clickup.com/api/v2/checklist/checklist_id/checklist_item
##    checklist_id
##    b8a8-48d8-a0c6-b4200788a683 (uuid)
##    Example: b955c4dc.
##    String
##
## Body:
## {
##   "name": "Updated Checklist Item",
##   "assignee": null,
##   "resolved": true,
##   "parent": null
## }
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
## Checklists / Edit Checklist Item
## PUT https://api.clickup.com/api/v2/checklist/checklist_id/checklist_item/checklist_item_id
## checklist_id
##    b8a8-48d8-a0c6-b4200788a683 (uuid)
##    Example: b955c4dc.
##    String
##
## checklist_item_id
##    e491-47f5-9fd8-d1dc4cedcc6f (uuid)
##    Example: 21e08dc8.
##    String
##
## parent is another checklist item that you want to nest the
## target checklist item underneath.
cuf_edit_checklist_item <- function(checklist_id, checklist_item_id, ...) {
    .cu_put("checklist", checklist_id, "checklist_item", checklist_item_id,
        body=list(...))
}
#cu_put_edit_checklist_item("40146d1e-efe5-4140-a0ba-ad39c9dec18c",
#    "8849fcba-9db4-4400-a78e-cfced2ae6ce0",
#    name="Renamed to that", resolved=TRUE)


#' @export
#' @rdname api-checklists
## Checklists / Delete Checklist Item
## DELETE https://api.clickup.com/api/v2/checklist/checklist_id/checklist_item/checklist_item_id
## checklist_id
##    b8a8-48d8-a0c6-b4200788a683 (uuid)
##    Example: b955c4dc.
##    String
##
## checklist_item_id
##    e491-47f5-9fd8-d1dc4cedcc6f (uuid)
##    Example: 21e08dc8.
##    String
cuf_delete_checklist_item <- function(checklist_id, checklist_item_id) {
    .cu_delete("checklist", checklist_id, "checklist_item", checklist_item_id)
}
#cu_delete_checklist_item("40146d1e-efe5-4140-a0ba-ad39c9dec18c",
#    "8849fcba-9db4-4400-a78e-cfced2ae6ce0")

