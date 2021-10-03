spec_tasks <- lcols(
    id = lcol_chr("id"),
    custom_id = lcol_guess("custom_id", .default = NULL),
    name = lcol_chr("name"),
    text_content = lcol_chr("text_content", .default = NA_character_),
    description = lcol_chr("description", .default = NA_character_),
    status = lcol_df(
        "status",
        status = lcol_chr("status"),
        color = lcol_chr("color"),
        type = lcol_chr("type"),
        orderindex = lcol_int("orderindex")
    ),
    orderindex = lcol_int("orderindex", .parser = as.integer),
    date_created = lcol_chr("date_created"),
    date_updated = lcol_chr("date_updated"),
    date_closed = lcol_guess("date_closed", .default = NULL),
    archived = lcol_lgl("archived"),
    creator = lcol_df(
        "creator",
        id = lcol_chr("id", .parser = as.character),
        username = lcol_chr("username"),
        color = lcol_chr("color"),
        email = lcol_chr("email"),
        profilePicture = lcol_chr("profilePicture")
    ),
    assignees = lcol_df_lst(
        "assignees",
        id = lcol_chr("id", .parser = as.character),
        username = lcol_chr("username"),
        color = lcol_chr("color"),
        initials = lcol_chr("initials"),
        email = lcol_chr("email"),
        profilePicture = lcol_chr("profilePicture"),
        .default = NULL
    ),
    watchers = lcol_guess("watchers", .default = NULL),
    checklists = lcol_guess("checklists", .default = NULL),
    tags = lcol_df_lst(
        "tags",
        name = lcol_chr("name"),
        tag_fg = lcol_chr("tag_fg"),
        tag_bg = lcol_chr("tag_bg"),
        creator = lcol_int("creator"),
        .default = NULL
    ),
    parent = lcol_guess("parent", .default = NULL),
    priority = lcol_guess("priority", .default = NULL),
    due_date = lcol_chr("due_date", .default = NA_character_),
    start_date = lcol_guess("start_date", .default = NULL),
    points = lcol_guess("points", .default = NULL),
    time_estimate = lcol_int("time_estimate", .default = NA_integer_),
    time_spent = lcol_int("time_spent", .default = NA_integer_),
    custom_fields = lcol_df_lst(
        "custom_fields",
        id = lcol_chr("id"),
        name = lcol_chr("name"),
        type = lcol_chr("type"),
        type_config = lcol_df(
            "type_config",
            simple = lcol_lgl("simple", .default = NA),
            formula = lcol_chr("formula", .default = NA_character_),
            include_guests = lcol_lgl("include_guests", .default = NA),
            include_team_members = lcol_lgl("include_team_members", .default = NA),
            single_user = lcol_lgl("single_user", .default = NA),
            default = lcol_int("default", .default = NA_integer_),
            placeholder = lcol_guess("placeholder", .default = NULL),
            new_drop_down = lcol_lgl("new_drop_down", .default = NA),
            options = lcol_df_lst(
                "options",
                id = lcol_chr("id"),
                name = lcol_chr("name", .default = NA_character_),
                color = lcol_chr("color", .default = NA_character_),
                orderindex = lcol_int("orderindex", .default = NA_integer_),
                label = lcol_chr("label", .default = NA_character_),
                .default = NULL
            ),
            tracking = lcol_df(
                "tracking",
                subtasks = lcol_lgl("subtasks", .default = NA),
                checklists = lcol_lgl("checklists", .default = NA),
                assigned_comments = lcol_lgl("assigned_comments", .default = NA),
                .default = NULL
            ),
            complete_on = lcol_int("complete_on", .default = NA_integer_),
            subtask_rollup = lcol_lgl("subtask_rollup", .default = NA),
            end = lcol_int("end", .default = NA_integer_),
            start = lcol_int("start", .default = NA_integer_),
            .default = NULL
        ),
        date_created = lcol_chr("date_created"),
        hide_from_guests = lcol_lgl("hide_from_guests"),
        required = lcol_lgl("required"),
        value = lcol_lst("value", .default = NULL)
    ),
    dependencies = lcol_df_lst(
        "dependencies",
        task_id = lcol_chr("task_id"),
        depends_on = lcol_chr("depends_on"),
        type = lcol_int("type"),
        date_created = lcol_chr("date_created"),
        userid = lcol_chr("userid"),
        .default = NULL
    ),
    linked_tasks = lcol_guess("linked_tasks", .default = NULL),
    team_id = lcol_chr("team_id"),
    url = lcol_chr("url"),
    permission_level = lcol_chr("permission_level"),
    list = lcol_df(
        "list",
        id = lcol_chr("id"),
        name = lcol_chr("name"),
        access = lcol_lgl("access")
    ),
    project = lcol_df(
        "project",
        id = lcol_chr("id"),
        name = lcol_chr("name"),
        hidden = lcol_lgl("hidden"),
        access = lcol_lgl("access")
    ),
    folder = lcol_df(
        "folder",
        id = lcol_chr("id"),
        name = lcol_chr("name"),
        hidden = lcol_lgl("hidden"),
        access = lcol_lgl("access")
    ),
    space = lcol_df(
        "space",
        id = lcol_chr("id")
    )
)
