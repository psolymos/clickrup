spec_spaces <- spec_df(
    id = tib_chr("id"),
    name = tib_chr("name"),
    color = tib_chr("color"),
    private = tib_lgl("private"),
    avatar = tib_chr("avatar"),
    admin_can_manage = tib_unspecified("admin_can_manage"),
    statuses = tib_df(
        "statuses",
        id = tib_chr("id"),
        status = tib_chr("status"),
        type = tib_chr("type"),
        orderindex = tib_int("orderindex"),
        color = tib_chr("color")
    ),
    multiple_assignees = tib_lgl("multiple_assignees"),
    features = tib_df(
        "features",
        .names_to = ".names",
        enabled = tib_lgl("enabled"),
        start_date = tib_lgl("start_date", required = FALSE),
        remap_due_dates = tib_lgl("remap_due_dates", required = FALSE),
        remap_closed_due_date = tib_lgl("remap_closed_due_date", required = FALSE),
        harvest = tib_lgl("harvest", required = FALSE),
        rollup = tib_lgl("rollup", required = FALSE),
        priorities = tib_df(
            "priorities",
            .required = FALSE,
            id = tib_chr("id"),
            priority = tib_chr("priority"),
            color = tib_chr("color"),
            orderindex = tib_int("orderindex", transform = as.integer)
        ),
        per_assignee = tib_lgl("per_assignee", required = FALSE),
        subtasks = tib_lgl("subtasks", required = FALSE),
        checklists = tib_unspecified("checklists", required = FALSE),
        comments = tib_unspecified("comments", required = FALSE)
    ),
    archived = tib_lgl("archived"),
    members = tib_df(
        "members",
        .required = FALSE,
        user = tib_row(
            "user",
            id = tib_chr("id", transform = as.character),
            username = tib_chr("username"),
            color = tib_chr("color"),
            profilePicture = tib_chr("profilePicture"),
            initials = tib_chr("initials")
        )
    )
)
