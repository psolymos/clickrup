#' Spaces
#'
#' Working with spaces in ClickUp tasks.

#' @param team_id Team ID.
#' @param name Name of the space.
#' @param space_id Space ID.
#' @param archived Logical, to returne archived (`TRUE`) spaces.
#' @param ... Named arguments to be passed to API request body,
#'   see the ClickUp API documentation (<https://clickup.com/api>).
#'
#' @return
#'
#' A cu object.
#'
#' @seealso [cu-class] for the cu object class.
#'
#' @name api-spaces
NULL

#' @export
#' @rdname api-spaces
## Spaces / Create Space
## POST https://api.clickup.com/api/v2/team/team_id/space
##
##    team_id
##    Example: 512.
##    Number
##
## Body
##
## {
##   "name": "New Space Name",
##   "multiple_assignees": true,
##   "features": {
##     "due_dates": {
##       "enabled": true,
##       "start_date": false,
##       "remap_due_dates": true,
##       "remap_closed_due_date": false
##     },
##     "time_tracking": {
##       "enabled": false
##     },
##     "tags": {
##       "enabled": true
##     },
##     "time_estimates": {
##       "enabled": true
##     },
##     "checklists": {
##       "enabled": true
##     },
##     "custom_fields": {
##       "enabled": true
##     },
##     "remap_dependencies": {
##       "enabled": true
##     },
##     "dependency_warning": {
##       "enabled": true
##     },
##     "portfolios": {
##       "enabled": true
##     }
##   }
## }
cu_create_space <- function(team_id, name, ...) {
    .cu_post("team", team_id, "space",
        body=list(name=name, ...))
}


#' @export
#' @rdname api-spaces
## Spaces / Update Space
## PUT https://api.clickup.com/api/v2/space/space_id
##
##    space_id
##    Example: 790.
##    Number
##
## Same body as for cu_create_space
cu_update_space <- function(space_id, ...) {
    .cu_put("space", space_id,
        body=list(...))
}


#' @export
#' @rdname api-spaces
## Spaces / Delete Space
## DELETE https://api.clickup.com/api/v2/space/space_id
##
##    space_id
##    Example: 790.
##    Number
cu_delete_space <- function(space_id) {
    .cu_delete("space", space_id)
}


#' @export
#' @rdname api-spaces
## Spaces / Get Spaces
##GET https://api.clickup.com/api/v2/team/team_id/space?archived=false
##
##    team_id
##    Example: 512.
##    Number
##
##    archived
##    Example: false.
##    Boolean
cu_get_spaces <- function(team_id, archived=FALSE) {
    .cu_get("team", team_id, "space",
        query = list("archived" = tolower(archived)))
}


#' @export
#' @rdname api-spaces
## Spaces / Get Space
## GET https://api.clickup.com/api/v2/space/space_id
##
##    space_id
##    Example: 790.
##    Number
cu_get_space <- function(space_id) {
    .cu_get("space", space_id)
}
