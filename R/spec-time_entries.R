spec_time_entries <- spec_df(
    tib_chr("id"),
    tib_chr("wid"),
    tib_row(
        "user",
        tib_chr("id", transform = as.character),
        tib_chr("username"),
        tib_chr("email"),
        tib_chr("color"),
        tib_chr("initials"),
        tib_chr("profilePicture")
    ),
    tib_lgl("billable"),
    tib_scalar("start", ptype = vctrs::new_datetime(), transform = cu_date_from),
    tib_chr("description"),
    tib_df(
        "tags",
        tib_chr("name"),
        tib_chr("tag_bg"),
        tib_chr("tag_fg"),
        tib_int("creator")
    ),
    tib_chr("source"),
    tib_scalar("at", ptype = vctrs::new_datetime(), transform = cu_date_from),
    tib_row(
        "task_location",
        .required = FALSE,
        tib_chr("list_id", required = FALSE),
        tib_chr("folder_id", required = FALSE),
        tib_chr("space_id", required = FALSE)
    ),
    tib_chr("task_url", required = FALSE),
    tib_row(
        "task",
        .required = FALSE,
        tib_chr("id", required = FALSE),
        tib_chr("name", required = FALSE),
        tib_row(
            "status",
            .required = FALSE,
            tib_chr("status"),
            tib_chr("color"),
            tib_chr("type"),
            tib_int("orderindex")
        ),
        tib_int("custom_type", required = FALSE)
    ),
    tib_scalar("end", ptype = vctrs::new_datetime(), transform = cu_date_from, required = FALSE),
    tib_scalar("duration", hms::new_hms(), required = FALSE, transform = ~ hms::as_hms(as.numeric(.x) / 1000)),
)
