spec_teams <- spec_df(
    id = tib_chr("id"),
    name = tib_chr("name"),
    color = tib_chr("color"),
    avatar = tib_chr("avatar"),
    members = tib_df(
        "members",
        user = tib_row(
            "user",
            id = tib_chr("id", transform = as.character),
            username = tib_chr("username"),
            email = tib_chr("email"),
            color = tib_chr("color"),
            profilePicture = tib_chr("profilePicture"),
            initials = tib_chr("initials"),
            role = tib_int("role"),
            custom_role = tib_unspecified("custom_role"),
            last_active = tib_vector("last_active", ptype = vctrs::new_datetime(), transform = cu_date_from),
            date_joined = tib_vector("date_joined", ptype = vctrs::new_datetime(), transform = cu_date_from),
            date_invited = tib_vector("date_invited", ptype = vctrs::new_datetime(), transform = cu_date_from)
        ),
        invited_by = tib_row(
            "invited_by",
            .required = FALSE,
            id = tib_int("id", required = FALSE),
            username = tib_chr("username", required = FALSE),
            color = tib_chr("color", required = FALSE),
            email = tib_chr("email", required = FALSE),
            initials = tib_chr("initials", required = FALSE),
            profilePicture = tib_chr("profilePicture", required = FALSE)
        ),
        can_see_time_spent = tib_lgl("can_see_time_spent", required = FALSE),
        can_see_time_estimated = tib_lgl("can_see_time_estimated", required = FALSE),
        can_see_points_estimated = tib_lgl("can_see_points_estimated", required = FALSE),
        can_edit_tags = tib_lgl("can_edit_tags", required = FALSE),
        can_create_views = tib_lgl("can_create_views", required = FALSE)
    )
)
