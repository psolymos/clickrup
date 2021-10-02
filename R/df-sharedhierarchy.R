#' Shared hierarchy
#'
#' Working with shared hierarchy in ClickUp tasks (<https://clickup.com/api>).
#' Returns all resources you have access to where you don't have
#' access to its parent. For example, if you have access to a
#' shared task, but don't have access to its parent list, it will
#' come back in this request.

#' @param team_id Team ID.
#'
#' @return
#'
#' A cu object.
#'
#' @seealso [cu-class] for the cu object class.
#'
#' @export
#' @name api-sharedhierarchy
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
cuf_get_shared <- function(team_id) {
    .cu_get("team", team_id, "shared")
}
