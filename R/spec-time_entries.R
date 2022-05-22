spec_time_entries <- spec_df(
    id = tib_chr("id"),
    wid = tib_chr("wid"),
    user = tib_row(
        "user",
        id = tib_int("id"),
        username = tib_chr("username"),
        email = tib_chr("email"),
        color = tib_chr("color"),
        initials = tib_chr("initials"),
        profilePicture = tib_chr("profilePicture")
    ),
    billable = tib_lgl("billable"),
    start = tib_chr("start"),
    description = tib_chr("description"),
    tags = tib_df(
        "tags",
        name = tib_chr("name"),
        tag_bg = tib_chr("tag_bg"),
        tag_fg = tib_chr("tag_fg"),
        creator = tib_int("creator")
    ),
    source = tib_chr("source"),
    at = tib_chr("at"),
    task_location = tib_row(
        "task_location",
        .required = FALSE,
        list_id = tib_chr("list_id", required = FALSE),
        folder_id = tib_chr("folder_id", required = FALSE),
        space_id = tib_chr("space_id", required = FALSE)
    ),
    task_url = tib_chr("task_url", required = FALSE),
    task = tib_row(
        "task",
        id = tib_chr("id", required = FALSE),
        name = tib_chr("name", required = FALSE),
        status = tib_row(
            "status",
            .required = FALSE,
            status = tib_chr("status"),
            color = tib_chr("color"),
            type = tib_chr("type"),
            orderindex = tib_int("orderindex")
        ),
        custom_type = tib_int("custom_type", required = FALSE)
    ),
    end = tib_chr("end", required = FALSE),
    duration = tib_chr("duration", required = FALSE)
)
