## Shared Hierarchy / Shared Hierarchy
## GET https://api.clickup.com/api/v2/team/team_id/shared
##
##    team_id
##    Example: 333.
##    Number
##
## Returns all resources you have access to where you don't have
## access to its parent. For example, if you have a access to a
## shared task, but don't have access to its parent list, it will
## come back in this request.
cu_get_shared <- function(team_id) {
    .cu_get("team", team_id, "shared")
}
