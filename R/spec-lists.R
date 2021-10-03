spec_lists <- lcols(
    id = lcol_chr("id"),
    name = lcol_chr("name"),
    orderindex = lcol_int("orderindex"),
    content = lcol_chr("content", .default = NA_character_),
    status = lcol_guess("status", .default = NULL),
    priority = lcol_guess("priority", .default = NULL),
    assignee = lcol_guess("assignee", .default = NULL),
    task_count = lcol_int("task_count"),
    due_date = lcol_guess("due_date", .default = NULL),
    start_date = lcol_guess("start_date", .default = NULL),
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
