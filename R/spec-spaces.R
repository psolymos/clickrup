spec_spaces <- lcols(
    id = lcol_chr("id"),
    name = lcol_chr("name"),
    private = lcol_lgl("private"),
    statuses = lcol_df_lst(
        "statuses",
        id = lcol_chr("id"),
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
        sprints = lcol_df(
            "sprints",
            enabled = lcol_lgl("enabled")
        ),
        time_tracking = lcol_df(
            "time_tracking",
            enabled = lcol_lgl("enabled"),
            harvest = lcol_lgl("harvest"),
            rollup = lcol_lgl("rollup")
        ),
        points = lcol_df(
            "points",
            enabled = lcol_lgl("enabled")
        ),
        custom_items = lcol_df(
            "custom_items",
            enabled = lcol_lgl("enabled")
        ),
        priorities = lcol_df(
            "priorities",
            enabled = lcol_lgl("enabled"),
            priorities = lcol_df_lst(
                "priorities",
                id = lcol_chr("id"),
                priority = lcol_chr("priority"),
                color = lcol_chr("color"),
                orderindex = lcol_chr("orderindex")
            )
        ),
        tags = lcol_df(
            "tags",
            enabled = lcol_lgl("enabled")
        ),
        wip_limits = lcol_df(
            "wip_limits",
            enabled = lcol_lgl("enabled", .default = NA),
            .default = NULL
        ),
        time_estimates = lcol_df(
            "time_estimates",
            enabled = lcol_lgl("enabled", .default = NA),
            rollup = lcol_lgl("rollup", .default = NA),
            per_assignee = lcol_lgl("per_assignee", .default = NA),
            .default = NULL
        ),
        check_unresolved = lcol_df(
            "check_unresolved",
            enabled = lcol_lgl("enabled"),
            subtasks = lcol_lgl("subtasks", .default = NA),
            checklists = lcol_guess("checklists", .default = NULL),
            comments = lcol_guess("comments", .default = NULL)
        ),
        zoom = lcol_df(
            "zoom",
            enabled = lcol_lgl("enabled")
        ),
        milestones = lcol_df(
            "milestones",
            enabled = lcol_lgl("enabled")
        ),
        custom_fields = lcol_df(
            "custom_fields",
            enabled = lcol_lgl("enabled")
        ),
        remap_dependencies = lcol_df(
            "remap_dependencies",
            enabled = lcol_lgl("enabled", .default = NA),
            .default = NULL
        ),
        dependency_warning = lcol_df(
            "dependency_warning",
            enabled = lcol_lgl("enabled")
        ),
        multiple_assignees = lcol_df(
            "multiple_assignees",
            enabled = lcol_lgl("enabled", .default = NA),
            .default = NULL
        ),
        emails = lcol_df(
            "emails",
            enabled = lcol_lgl("enabled")
        )
    ),
    archived = lcol_lgl("archived"),
    members = lcol_df_lst(
        "members",
        user = lcol_df(
            "user",
            id = lcol_chr("id", .parser = as.character),
            username = lcol_chr("username"),
            color = lcol_chr("color"),
            profilePicture = lcol_chr("profilePicture"),
            initials = lcol_chr("initials")
        ),
        .default = NULL
    )
)
