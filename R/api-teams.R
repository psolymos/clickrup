#' Teams (workspaces)
#'
#' Working with teams (workspaces) in ClickUp tasks (<https://clickup.com/api>).
#' Teams is the legacy term for what are now called workspaces in ClickUp.
#' For compatablitly, the term team is still used in the API v2.
#' This is NOT the new 'Teams' feature which represents a group of users.

#' @examples
#' \dontrun{
#' cu_get_teams()
#' }
#'
#' @return
#'
#' A cu object.
#'
#' @seealso [cu-class] for the cu object class.
#'
#' @export
#' @name api-teams
## Teams / Get Teams
## GET https://api.clickup.com/api/v2/team
##
## Teams is the legacy term for what are now called Workspaces in ClickUp.
## For compatablitly, the term team is still used in this API.
## This is NOT the new "Teams" feature which represents a group of users.
cu_get_teams <- function() {
    .cu_get("team")
}
#cu_get_workspaces <- cu_get_teams
