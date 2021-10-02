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


#' cuf_create_space()
#'
#' `cuf_create_space()` returns the same data as `cu_create_space()` as a tibble.
#'
#' @export
#' @rdname api-spaces
cuf_create_space <- function(team_id, name, ...) {
    out <- cu_create_space(team_id, name, ...)
    tibblify(list(out), spaces_spec)
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


#' cuf_get_spaces()
#'
#' `cuf_get_spaces()` returns the same data as `cu_get_spaces()` as a tibble.
#'
#' @export
#' @rdname api-spaces
cuf_get_spaces <- function(team_id, archived=FALSE) {
    out <- cu_get_spaces(team_id, archived)$spaces
    tibblify(out, spaces_spec)
}

spaces_spec <- lcols(
    id = lcol_chr("id"),
    name = lcol_chr("name"),
    private = lcol_lgl("private"),
    statuses = lcol_df_lst(
        "statuses",
        status = lcol_chr("status"),
        type = lcol_chr("type"),
        orderindex = lcol_int("orderindex"),
        color = lcol_chr("color")
    ),
    multiple_assignees = lcol_lgl("multiple_assignees"),
    features = lcol_df(
        "features",
        due_dates = lcol_df(
            "due_dates",
            enabled = lcol_lgl("enabled"),
            start_date = lcol_lgl("start_date"),
            remap_due_dates = lcol_lgl("remap_due_dates"),
            remap_closed_due_date = lcol_lgl("remap_closed_due_date")
        ),
        time_tracking = lcol_df(
            "time_tracking",
            enabled = lcol_lgl("enabled"),
            .default = tibble(enabled = NA)
        ),
        tags = lcol_df(
            "tags",
            enabled = lcol_lgl("enabled"),
            .default = tibble(enabled = NA)
        ),
        time_estimates = lcol_df(
            "time_estimates",
            enabled = lcol_lgl("enabled"),
            .default = tibble(enabled = NA)
        ),
        checklists = lcol_df(
            "checklists",
            enabled = lcol_lgl("enabled"),
            .default = tibble(enabled = NA)
        ),
        custom_fields = lcol_df(
            "custom_fields",
            enabled = lcol_lgl("enabled", .default = NA),
            .default = tibble(enabled = NA)
        ),
        remap_dependencies = lcol_df(
            "remap_dependencies",
            enabled = lcol_lgl("enabled", .default = NA),
            .default = tibble(enabled = NA)
        ),
        dependency_warning = lcol_df(
            "dependency_warning",
            enabled = lcol_lgl("enabled", .default = NA),
            .default = tibble(enabled = NA)
        ),
        portfolios = lcol_df(
            "portfolios",
            enabled = lcol_lgl("enabled", .default = NA),
            .default = tibble(enabled = NA)
        )
    )
)

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
