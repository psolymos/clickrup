
#' @rdname api-users
NULL

#' @export
#' @rdname api-users
cuf_invite_user_to_workspace <- function(team_id, email, admin=FALSE, ...) {
    .cu_post("team", team_id, "user",
        body=list(email=email, admin=tolower(admin), ...))
}


#' @export
#' @rdname api-users
cuf_edit_user_on_workspace <- function(team_id, user_id,
    username, admin=FALSE, ...) {
    .cu_put("team", team_id, "user", user_id,
        body=list(username=username, admin=tolower(admin), ...))
}


#' @export
#' @rdname api-users
cuf_remove_user_from_workspace <- function(team_id, user_id) {
    .cu_delete("team", team_id, "user", user_id)
}


#' @export
#' @rdname api-users
cuf_get_user <- function(team_id, user_id) {
    .cu_get("team", team_id, "user", user_id)
}
