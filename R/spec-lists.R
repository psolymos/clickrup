spec_lists <- spec_df(
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
    due_date = tib_scalar("due_date", ptype = vctrs::new_datetime(), transform = cu_date_from),
    start_date = tib_scalar("start_date", ptype = vctrs::new_datetime(), transform = cu_date_from),
    folder = tib_row(
        "folder",
        id = tib_chr("id"),
        name = tib_chr("name"),
        hidden = tib_lgl("hidden"),
        access = tib_lgl("access")
    ),
    space = tib_row(
        "space",
        id = tib_chr("id"),
        name = tib_chr("name"),
        access = tib_lgl("access")
    ),
    archived = tib_lgl("archived"),
    override_statuses = tib_lgl("override_statuses"),
    permission_level = tib_chr("permission_level")
)
