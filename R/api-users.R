#' Users
#'
#' Working with users in ClickUp tasks (Enterprise only feture).

#' @param team_id Team (workspace) ID.
#' @param email Email.
#' @param admin Logical, admin account or not
#' @param user_id User ID.
#' @param username User name.
#' @param ... Named arguments to be passed to API request body,
#'   see the ClickUp API documentation (<https://clickup.com/api>).
#' @param cu_token ClickUp personal access token or an access token from the OAuth flow.
#'   The `CU_PAT` environment variable is used when `NULL`.
#'
#' @return
#'
#' A cu object.
#'
#' @seealso [cu-class] for the cu object class.
#'
#' @name api-users
NULL

#' @export
#' @rdname api-users
## Users / Invite User To Workspace
## POST https://api.clickup.com/api/v2/team/team_id/user
##
##     team_id
##     Example: 333.
##     Number
##
## Body
##
## {
##   "email": "user@example.com",
##   "admin": true
## }
cu_invite_user_to_workspace <- function(team_id, email, admin=FALSE, ..., cu_token = NULL) {
    .cu_post("team", team_id, "user",
        body=list(email=email, admin=tolower(admin), ...), cu_token = cu_token)
}


#' @export
#' @rdname api-users
## Users / Edit User On Workspace
## PUT https://api.clickup.com/api/v2/team/team_id/user/user_id
##
##     team_id
##     Example: 333.
##     Number
##
##     user_id
##     Example: 403.
##     Number
##
## Body
##
## {
##   "username": "User Name",
##   "admin": false
## }
cu_edit_user_on_workspace <- function(team_id, user_id,
    username, admin=FALSE, ..., cu_token = NULL) {
    .cu_put("team", team_id, "user", user_id,
        body=list(username=username, admin=tolower(admin), ...), cu_token = cu_token)
}


#' @export
#' @rdname api-users
## Users / Remove User From Workspace
## DELETE https://api.clickup.com/api/v2/team/team_id/user/user_id
##
##     team_id
##     Example: 333.
##     Number
##
##     user_id
##     Example: 403.
##     Number
cu_remove_user_from_workspace <- function(team_id, user_id, cu_token = NULL) {
    .cu_delete("team", team_id, "user", user_id, cu_token = cu_token)
}


#' @export
#' @rdname api-users
## Users / Get User
## GET https://api.clickup.com/api/v2/team/team_id/user/user_id
##
##     team_id
##     Example: 333.
##     Number
##
##     user_id
##     Example: 403.
##     Number
cu_get_user <- function(team_id, user_id, cu_token = NULL) {
    .cu_get("team", team_id, "user", user_id, cu_token = cu_token)
}
