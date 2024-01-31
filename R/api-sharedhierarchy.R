#' Shared hierarchy
#'
#' Working with shared hierarchy in ClickUp tasks (<https://clickup.com/api>).
#' Returns all resources you have access to where you don't have
#' access to its parent. For example, if you have access to a
#' shared task, but don't have access to its parent list, it will
#' come back in this request.

#' @param team_id Team ID.
#' @param cu_token ClickUp personal access token or an access token from the OAuth flow.
#'   The `CU_PAT` environment variable is used when `NULL`.
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
cu_get_shared <- function(team_id, cu_token = NULL) {
    .cu_get("team", team_id, "shared", cu_token = cu_token)
}
