spec_folders <- spec_df(
    id = tib_chr("id"),
    name = tib_chr("name"),
    orderindex = tib_int("orderindex"),
    override_statuses = tib_lgl("override_statuses"),
    hidden = tib_lgl("hidden"),
    space = tib_row(
        "space",
        id = tib_chr("id"),
        name = tib_chr("name")
    ),
    task_count = tib_chr("task_count"),
    archived = tib_lgl("archived"),
    statuses = tib_df(
        "statuses",
        id = tib_chr("id"),
        status = tib_chr("status"),
        type = tib_chr("type"),
        orderindex = tib_int("orderindex"),
        color = tib_chr("color")
    ),
    lists = tib_df(
        "lists",
        id = tib_chr("id"),
        name = tib_chr("name"),
        orderindex = tib_int("orderindex"),
        content = tib_chr("content", required = FALSE),
        status = tib_row(
            "status",
            status = tib_chr("status", required = FALSE),
            color = tib_chr("color", required = FALSE)
        ),
        priority = tib_unspecified("priority"),
        assignee = tib_row(
            "assignee",
            color = tib_chr("color", required = FALSE),
            username = tib_chr("username", required = FALSE),
            initials = tib_chr("initials", required = FALSE),
            profilePicture = tib_chr("profilePicture", required = FALSE)
        ),
        task_count = tib_int("task_count"),
        due_date = tib_vector("due_date", ptype = vctrs::new_datetime(), transform = cu_date_from),
        start_date = tib_vector("start_date", ptype = vctrs::new_datetime(), transform = cu_date_from),
        space = tib_row(
            "space",
            id = tib_chr("id"),
            name = tib_chr("name"),
            access = tib_lgl("access")
        ),
        archived = tib_lgl("archived"),
        override_statuses = tib_lgl("override_statuses"),
        statuses = tib_df(
            "statuses",
            id = tib_chr("id"),
            status = tib_chr("status"),
            orderindex = tib_int("orderindex"),
            color = tib_chr("color"),
            type = tib_chr("type")
        ),
        permission_level = tib_chr("permission_level")
    ),
    permission_level = tib_chr("permission_level")
)
