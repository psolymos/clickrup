
#' @export
#' @rdname api-teams
## Teams / Get Teams
## GET https://api.clickup.com/api/v2/team
##
## Teams is the legacy term for what are now called Workspaces in ClickUp.
## For compatablitly, the term team is still used in this API.
## This is NOT the new "Teams" feature which represents a group of users.
cuf_get_teams <- function() {
    .cu_get("team")
}
#cuf_get_workspaces <- cu_get_teams

#' @rdname api-teams
#' @export
cuf_get_teams <- function() {
    out <- cu_get_teams()$teams
    tibblify(out, teams_spec)
}

teams_spec <- lcols(
    id = lcol_chr("id"),
    name = lcol_chr("name"),
    color = lcol_chr("color"),
    avatar = lcol_chr("avatar"),
    members = lcol_df_lst(
        "members",
        user = lcol_df(
            "user",
            id = lcol_chr("id", .parser = as.character),
            username = lcol_chr("username"),
            email = lcol_chr("email"),
            color = lcol_chr("color", .default = NA_character_),
            profilePicture = lcol_chr("profilePicture", .default = NA_character_),
            initials = lcol_chr("initials"),
            role = lcol_int("role"),
            custom_role = lcol_guess("custom_role", .default = NULL),
            last_active = lcol_chr("last_active"),
            date_joined = lcol_chr("date_joined"),
            date_invited = lcol_chr("date_invited")
        ),
        invited_by = lcol_df(
            "invited_by",
            id = lcol_chr("id", .parser = as.character, .default = NA_character_),
            username = lcol_chr("username", .default = NA_character_),
            color = lcol_chr("color", .default = NA_character_),
            email = lcol_chr("email", .default = NA_character_),
            initials = lcol_chr("initials", .default = NA_character_),
            profilePicture = lcol_chr("profilePicture", .default = NA_character_),
            .default = NULL
        ),
        can_see_time_spent = lcol_lgl("can_see_time_spent", .default = NA),
        can_see_time_estimated = lcol_lgl("can_see_time_estimated", .default = NA),
        can_see_points_estimated = lcol_lgl("can_see_points_estimated", .default = NA),
        can_edit_tags = lcol_lgl("can_edit_tags", .default = NA)
    )
)
