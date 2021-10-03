spec_lists <- lcols(
    id = lcol_chr("id"),
    name = lcol_chr("name"),
    orderindex = lcol_int("orderindex"),
    content = lcol_chr("content", .default = NA_character_),
    status = lcol_df(
        "status",
        status = lcol_chr("status", .default = NA_character_),
        color = lcol_chr("color", .default = NA_character_),
        .default = NULL
    ),
    priority = lcol_guess("priority", .default = NULL),
    assignee = lcol_df(
        "assignee",
        color = lcol_chr("color", .default = NA_character_),
        username = lcol_chr("username", .default = NA_character_),
        initials = lcol_chr("initials", .default = NA_character_),
        profilePicture = lcol_chr("profilePicture", .default = NA_character_),
        .default = NULL
    ),
    task_count = lcol_int("task_count"),
    due_date = lcol_dtt("due_date", .parser = cu_date_from, .default = dttr2::NA_POSIXct_),
    start_date = lcol_dtt("start_date", .parser = cu_date_from, .default = dttr2::NA_POSIXct_),
    folder = lcol_df(
        "folder",
        id = lcol_chr("id"),
        name = lcol_chr("name"),
        hidden = lcol_lgl("hidden"),
        access = lcol_lgl("access")
    ),
    space = lcol_df(
        "space",
        id = lcol_chr("id"),
        name = lcol_chr("name"),
        access = lcol_lgl("access")
    ),
    archived = lcol_lgl("archived"),
    override_statuses = lcol_lgl("override_statuses", .default = NA),
    permission_level = lcol_chr("permission_level")
)
