
#' @rdname api-guests
NULL

#' @export
#' @rdname api-guests
cuf_invite_guest_to_workspace <- function(team_id) {
    .cu_post("team", team_id, "guest")
}


#' @export
#' @rdname api-guests
cuf_edit_guest_on_workspace <- function(team_id, guest_id, ...) {
    .cu_put("team", team_id, "guest", guest_id,
        body=list(...))
}


#' @export
#' @rdname api-guests
cuf_remove_guest_from_workspace <- function(team_id, guest_id) {
    .cu_delete("team", team_id, "guest", guest_id)
}


#' @export
#' @rdname api-guests
cuf_get_guest <- function(team_id, guest_id) {
    .cu_get("team", team_id, "guest", guest_id)
}


#' @export
#' @rdname api-guests
cuf_add_guest_to_task <- function(task_id, guest_id, permission_level="read") {
    task_id <- cu_task_id(task_id)
    permission_level <- match.arg(permission_level,
        c("read", "comment", "edit", "create"))
    .cu_post("task", task_id, "guest", guest_id,
        body=list(permission_level=permission_level))
}


#' @export
#' @rdname api-guests
cuf_remove_guest_from_task <- function(task_id, guest_id) {
    task_id <- cu_task_id(task_id)
    .cu_delete("task", task_id, "guest", guest_id)
}


#' @export
#' @rdname api-guests
cuf_add_guest_to_list <- function(list_id, guest_id, permission_level="read") {
    permission_level <- match.arg(permission_level,
        c("read", "comment", "edit", "create"))
    .cu_post("list", list_id, "guest", guest_id,
        body=list(permission_level=permission_level))
}


#' @export
#' @rdname api-guests
cuf_remove_guest_from_list <- function(list_id, guest_id) {
    .cu_delete("list", list_id, "guest", guest_id)
}


#' @export
#' @rdname api-guests
cuf_add_guest_to_folder <- function(folder_id, guest_id,
                                   permission_level="read") {
    permission_level <- match.arg(permission_level,
        c("read", "comment", "edit", "create"))
    .cu_post("folder", folder_id, "guest", guest_id,
        body=list(permission_level=permission_level))
}


#' @export
#' @rdname api-guests
cuf_remove_guest_from_folder <- function(folder_id, guest_id) {
    .cu_delete("folder", folder_id, "guest", guest_id)
}
