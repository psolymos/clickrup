#' Lists
#'
#' Working with lists in ClickUp tasks.

#' @param folder_id Folder ID.
#' @param space_id SPace ID.
#' @param list_id List ID.
#' @param archived Logical, to returne archived (`TRUE`) lists.
#' @param ... Named arguments to be passed to API request body,
#'   see the ClickUp API documentation (<https://clickup.com/api>).
#'
#' @return
#'
#' A cu object.
#'
#' @seealso [cu-class] for the cu object class.
#'
#' @name api-lists
NULL

#' @export
#' @rdname api-lists
## Lists / Create List
## POST https://api.clickup.com/api/v2/folder/folder_id/list
##
##     folder_id
##     Example: 456.
##     Number
##
## assignee is a userid of the assignee to be added to this task.
## priority is an integer mapping as 1 : Urgent, 2 : High, 3 : Normal, 4 : Low.
##
## Body
##
## {
##   "name": "New List Name",
##   "content": "New List Content",
##   "due_date": 1567780450202,
##   "due_date_time": false,
##   "priority": 1,
##   "assignee": 183,
##   "status": "red"
## }
cu_create_list <- function(folder_id, ...) {
    .cu_post("folder", folder_id, "list",
        body=list(...))
}


#' @export
#' @rdname api-lists
## Lists / Create Folderless List
## POST https://api.clickup.com/api/v2/space/space_id/list
##
##    space_id
##    Example: 789.
##    Number
##
## assignee is a userid of the assignee to be added to this task.
## priority is an integer mapping as 1 : Urgent, 2 : High, 3 : Normal, 4 : Low.
##
## Body
##
## {
##   "name": "New List Name",
##   "content": "New List Content",
##   "due_date": 1567780450202,
##   "due_date_time": false,
##   "priority": 1,
##   "assignee": 183,
##   "status": "red"
## }
cu_create_folderless_list <- function(space_id, ...) {
    .cu_post("space", space_id, "list",
        body=list(...))
}


#' @export
#' @rdname api-lists
## Lists / Update List
## PUT https://api.clickup.com/api/v2/list/list_id
##
##     list_id
##     Example: 124.
##     String
##
## Only pass the properties you want to update.
## It is unnessary to pass the entire list object.
## assignee is a userid of the assignee to be added to this task.
## priority is an integer mapping as 1 : Urgent, 2 : High, 3 : Normal, 4 : Low.
##
## Body
##
## {
##   "name": "Updated List Name",
##   "content": "Updated List Content",
##   "due_date": 1567780450202,
##   "due_date_time": true,
##   "priority": 2,
##   "assignee": "none",
##   "unset_status": true
## }
cu_update_list <- function(list_id, ...) {
    .cu_put("list", list_id,
        body=list(...))
}


#' @export
#' @rdname api-lists
## Lists / Delete List
## DELET Ehttps://api.clickup.com/api/v2/list/list_id
##
##     list_id
##     Example: 124.
##     Number
cu_delete_list <- function(list_id, ...) {
    .cu_delete("list", list_id)
}


#' @export
#' @rdname api-lists
## Lists / Get Lists
## GET https://api.clickup.com/api/v2/folder/folder_id/list?archived=false
##
##     folder_id
##     Example: 456.
##     Number
##
##     archived
##     Example: false.
##     Boolean
cu_get_lists <- function(folder_id, archived=FALSE) {
    .cu_get("folder", folder_id, "list",
            query = list("archived" = tolower(archived)))
}


#' @export
#' @rdname api-lists
## Lists / Get Folderless Lists
## GET https://api.clickup.com/api/v2/space/space_id/list?archived=false
##
##     space_id
##     Example: 789.
##     Number
##
##     archived
##     Example: false.
##     Boolean
cu_get_lists_folderless <- function(space_id, archived=FALSE) {
    .cu_get("space", space_id, "list",
            query = list("archived" = tolower(archived)))
}


#' @export
#' @rdname api-lists
## Lists / Get List
## GET https://api.clickup.com/api/v2/list/list_id
##
##     list_id
##     Example: 124.
##     Number
cu_get_list <- function(list_id) {
    .cu_get("list", list_id)
}
