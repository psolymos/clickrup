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
cu_invite_user_to_workspace <- function(team_id, email, admin=FALSE, ...) {
    .cu_post("team", team_id, "user",
        body=list(email=email, admin=tolower(admin)))
}


## Users / Edit User On Workspace
## PUThttps://api.clickup.com/api/v2/team/team_id/user/user_id
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
    username, admin=FALSE, ...) {
    .cu_put("team", team_id, "user", user_id,
        body=list(username=username, admin=tolower(admin)))
}


## Users / Remove User From Workspace
## DELETEhttps://api.clickup.com/api/v2/team/team_id/user/user_id
##
##     team_id
##     Example: 333.
##     Number
##
##     user_id
##     Example: 403.
##     Number
cu_remove_user_from_workspace <- function(team_id, user_id) {
    .cu_delete("team", team_id, "user", user_id)
}


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
cu_get_user <- function(team_id, user_id) {
    .cu_get("team", team_id, "user", user_id)
}
