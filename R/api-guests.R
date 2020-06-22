#' Guests
#'
#' Working with guests in ClickUp tasks (Enterprise only feature).

#' @param team_id Team ID.
#' @param guest_id Guest ID.
#' @param permission_level Permisson level can be
#'   `"read"`, `"comment"`, `"edit"`, or `"create"`.
#' @param folder_id Folder ID.
#' @param list_id List ID.
#' @param task_id Task ID.
#' @param ... Named arguments to be passed to API request body,
#'   see the ClickUp API documentation (<https://clickup.com/api>).
#'
#' @return
#'
#' A cu object.
#'
#' @seealso [cu-class] for the cu object class.
#'
#' @name api-guests
NULL

#' @export
#' @rdname api-guests
## Guests / Invite Guest To Workspace
## POST https://api.clickup.com/api/v2/team/team_id/guest
##
##     team_id
##     Example: 333.
##     Number
##
## Note: not sure how this is supposed to work without email
## e.g. cu_invite_user_to_workspace(team_id, email)
##
cu_invite_guest_to_workspace <- function(team_id) {
    .cu_post("team", team_id, "guest")
}


#' @export
#' @rdname api-guests
## Guests / Edit Guest On Workspace
## PUT https://api.clickup.com/api/v2/team/team_id/guest/guest_id
##
##     team_id
##     Example: 333.
##     Number
##
##     guest_id
##     Example: 403.
##     Number
##
## Body
##
## {
##   "username": "Guest User",
##   "can_edit_tags": true,
##   "can_see_time_spent": true,
##   "can_see_time_estimated": true
## }
cu_edit_guest_on_workspace <- function(team_id, guest_id, ...) {
    .cu_put("team", team_id, "guest", guest_id,
        body=list(...))
}


#' @export
#' @rdname api-guests
## Guests / Remove Guest From Workspace
## DELETE https://api.clickup.com/api/v2/team/team_id/guest/guest_id
##
##     team_id
##     Example: 333.
##     Number
##     guest_id
##     Example: 403.
##     Number
cu_remove_guest_from_workspace <- function(team_id, guest_id) {
    .cu_delete("team", team_id, "guest", guest_id)
}


#' @export
#' @rdname api-guests
## Guests / Get Guest
## GET https://api.clickup.com/api/v2/team/team_id/guest/guest_id
##
##     team_id
##     Example: 333.
##     Number
##
##     guest_id
##     Example: 403.
##     Number
cu_get_guest <- function(team_id, guest_id) {
    .cu_get("team", team_id, "guest", guest_id)
}


#' @export
#' @rdname api-guests
## Guests / Add Guest To Task
## POST https://api.clickup.com/api/v2/task/task_id/guest/guest_id
##
##     task_id
##     Example: c04.
##     String
##
##     guest_id
##     Example: 403.
##     Number
##
## permisson_level can be read, comment, edit, or create
##
## Body
##
## {
##   "permission_level": "read"
## }
cu_add_guest_to_task <- function(task_id, guest_id, permission_level="read") {
    task_id <- cu_task_id(task_id)
    permission_level <- match.arg(permission_level,
        c("read", "comment", "edit", "create"))
    .cu_post("task", task_id, "guest", guest_id,
        body=list(permission_level=permission_level))
}


#' @export
#' @rdname api-guests
## Guests / Remove Guest From Task
## DELETE https://api.clickup.com/api/v2/task/task_id/guest/guest_id
##
##     task_id
##     Example: c04.
##     String
##
##     guest_id
##     Example: 403.
##     Number
cu_remove_guest_from_task <- function(task_id, guest_id) {
    task_id <- cu_task_id(task_id)
    .cu_delete("task", task_id, "guest", guest_id)
}


#' @export
#' @rdname api-guests
## Guests / Add Guest To List
## POST https://api.clickup.com/api/v2/list/list_id/guest/guest_id
##
##     list_id
##     Example: 1427.
##     Number
##
##     guest_id
##     Example: 403.
##     Number
##
## permisson_level can be read, comment, edit, or create
##
## Body
##
## {
##   "permission_level": "read"
## }
cu_add_guest_to_list <- function(list_id, guest_id, permission_level="read") {
    permission_level <- match.arg(permission_level,
        c("read", "comment", "edit", "create"))
    .cu_post("list", list_id, "guest", guest_id,
        body=list(permission_level=permission_level))
}


#' @export
#' @rdname api-guests
## Guests / Remove Guest From List
## DELETE https://api.clickup.com/api/v2/list/list_id/guest/guest_id
##
##     list_id
##     Example: 1427.
##     Number
##
##     guest_id
##     Example: 403.
##     Number
cu_remove_guest_from_list <- function(list_id, guest_id) {
    .cu_delete("list", list_id, "guest", guest_id)
}


#' @export
#' @rdname api-guests
## Guests / Add Guest To Folder
## POST https://api.clickup.com/api/v2/folder/folder_id/guest/guest_id
##
##     folder_id
##     Example: 1057.
##     Number
##
##     guest_id
##     Example: 403.
##     Number
##
## permisson_level can be read, comment, edit, or create
##
## Body
##
## {
##   "permission_level": "read"
## }
cu_add_guest_to_folder <- function(folder_id, guest_id,
                                   permission_level="read") {
    permission_level <- match.arg(permission_level,
        c("read", "comment", "edit", "create"))
    .cu_post("folder", folder_id, "guest", guest_id,
        body=list(permission_level=permission_level))
}


#' @export
#' @rdname api-guests
## Guests / Remove Guest From Folder
## DELETE https://api.clickup.com/api/v2/folder/folder_id/guest/guest_id
##
##     folder_id
##     Example: 1057.
##     Number
##
##     guest_id
##     Example: 403.
##     Number
##
##
cu_remove_guest_from_folder <- function(folder_id, guest_id) {
    .cu_delete("folder", folder_id, "guest", guest_id)
}
