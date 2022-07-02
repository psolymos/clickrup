spec_tasks <- spec_df(
    id = tib_chr("id"),
    custom_id = tib_unspecified("custom_id"),
    name = tib_chr("name"),
    text_content = tib_chr("text_content"),
    description = tib_chr("description"),
    status = tib_row(
        "status",
        status = tib_chr("status"),
        color = tib_chr("color"),
        type = tib_chr("type"),
        orderindex = tib_int("orderindex")
    ),
    orderindex = tib_int("orderindex", transform = as.integer),
    date_created = tib_scalar("date_created", ptype = vctrs::new_datetime(), transform = cu_date_from),
    date_updated = tib_scalar("date_updated", ptype = vctrs::new_datetime(), transform = cu_date_from),
    date_closed = tib_scalar("date_closed", ptype = vctrs::new_datetime(), transform = cu_date_from),
    archived = tib_lgl("archived"),
    creator = tib_row(
        "creator",
        id = tib_chr("id", transform = as.character),
        username = tib_chr("username"),
        color = tib_chr("color"),
        email = tib_chr("email"),
        profilePicture = tib_chr("profilePicture")
    ),
    assignees = tib_df(
        "assignees",
        id = tib_chr("id", transform = as.character),
        username = tib_chr("username"),
        color = tib_chr("color"),
        initials = tib_chr("initials"),
        email = tib_chr("email"),
        profilePicture = tib_chr("profilePicture")
    ),
    watchers = tib_unspecified("watchers"),
    checklists = tib_df(
        "checklists",
        id = tib_chr("id"),
        task_id = tib_chr("task_id"),
        name = tib_chr("name"),
        date_created = tib_scalar("date_created", ptype = vctrs::new_datetime(), transform = cu_date_from),
        orderindex = tib_int("orderindex"),
        creator = tib_int("creator"),
        resolved = tib_int("resolved"),
        unresolved = tib_int("unresolved"),
        items = tib_df(
            "items",
            id = tib_chr("id"),
            name = tib_chr("name"),
            orderindex = tib_dbl("orderindex"),
            assignee = tib_row(
                "assignee",
                id = tib_int("id", required = FALSE),
                username = tib_chr("username", required = FALSE),
                email = tib_chr("email", required = FALSE),
                color = tib_chr("color", required = FALSE),
                initials = tib_chr("initials", required = FALSE),
                profilePicture = tib_chr("profilePicture", required = FALSE)
            ),
            group_assignee = tib_unspecified("group_assignee"),
            resolved = tib_lgl("resolved"),
            parent = tib_unspecified("parent"),
            date_created = tib_scalar("date_created", ptype = vctrs::new_datetime(), transform = cu_date_from),
            children = tib_unspecified("children")
        )
    ),
    tags = tib_df(
        "tags",
        name = tib_chr("name"),
        tag_fg = tib_chr("tag_fg"),
        tag_bg = tib_chr("tag_bg"),
        creator = tib_int("creator")
    ),
    parent = tib_chr("parent"),
    priority = tib_row(
        "priority",
        id = tib_chr("id", required = FALSE),
        priority = tib_chr("priority", required = FALSE),
        color = tib_chr("color", required = FALSE),
        orderindex = tib_chr("orderindex", required = FALSE)
    ),
    due_date = tib_scalar("due_date", ptype = vctrs::new_datetime(), transform = cu_date_from),
    start_date = tib_scalar("start_date", ptype = vctrs::new_datetime(), transform = cu_date_from),
    points = tib_int("points"),
    time_estimate = tib_int("time_estimate"),
    custom_fields = tib_df(
        "custom_fields",
        id = tib_chr("id"),
        name = tib_chr("name"),
        type = tib_chr("type"),
        type_config = tib_variant("type_config"),
        date_created = tib_scalar("date_created", ptype = vctrs::new_datetime(), transform = cu_date_from),
        hide_from_guests = tib_lgl("hide_from_guests"),
        required = tib_lgl("required"),
        value = tib_variant("value", required = FALSE)
    ),
    dependencies = tib_df(
        "dependencies",
        task_id = tib_chr("task_id"),
        depends_on = tib_chr("depends_on"),
        type = tib_int("type"),
        date_created = tib_scalar("date_created", ptype = vctrs::new_datetime(), transform = cu_date_from),
        userid = tib_chr("userid")
    ),
    linked_tasks = tib_unspecified("linked_tasks"),
    team_id = tib_chr("team_id"),
    url = tib_chr("url"),
    permission_level = tib_chr("permission_level"),
    list = tib_row(
        "list",
        id = tib_chr("id"),
        name = tib_chr("name"),
        access = tib_lgl("access")
    ),
    project = tib_row(
        "project",
        id = tib_chr("id"),
        name = tib_chr("name"),
        hidden = tib_lgl("hidden"),
        access = tib_lgl("access")
    ),
    folder = tib_row(
        "folder",
        id = tib_chr("id"),
        name = tib_chr("name"),
        hidden = tib_lgl("hidden"),
        access = tib_lgl("access")
    ),
    space = tib_row(
        "space",
        id = tib_chr("id")
    ),
    time_spent = tib_int("time_spent", required = FALSE)
)
