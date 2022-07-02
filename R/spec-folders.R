spec_folders <- spec_df(
    tib_chr("id"),
    tib_chr("name"),
    tib_int("orderindex"),
    tib_lgl("override_statuses"),
    tib_lgl("hidden"),
    tib_row(
        "space",
        tib_chr("id"),
        tib_chr("name")
    ),
    tib_chr("task_count"),
    tib_lgl("archived"),
    tib_df(
        "statuses",
        tib_chr("id"),
        tib_chr("status"),
        tib_chr("type"),
        tib_int("orderindex"),
        tib_chr("color")
    ),
    tib_df(
        "lists",
        tib_chr("id"),
        tib_chr("name"),
        tib_int("orderindex"),
        tib_chr("content", required = FALSE),
        tib_row(
            "status",
            tib_chr("status", required = FALSE),
            tib_chr("color", required = FALSE)
        ),
        tib_unspecified("priority"),
        tib_row(
            "assignee",
            tib_chr("color", required = FALSE),
            tib_chr("username", required = FALSE),
            tib_chr("initials", required = FALSE),
            tib_chr("profilePicture", required = FALSE)
        ),
        tib_int("task_count"),
        tib_scalar("due_date", ptype = vctrs::new_datetime(), transform = cu_date_from),
        tib_scalar("start_date", ptype = vctrs::new_datetime(), transform = cu_date_from),
        tib_row(
            "space",
            tib_chr("id"),
            tib_chr("name"),
            tib_lgl("access")
        ),
        tib_lgl("archived"),
        tib_lgl("override_statuses"),
        tib_df(
            "statuses",
            tib_chr("id"),
            tib_chr("status"),
            tib_int("orderindex"),
            tib_chr("color"),
            tib_chr("type")
        ),
        tib_chr("permission_level")
    ),
    tib_chr("permission_level")
)
