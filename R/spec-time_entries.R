spec_time_entries <- lcols(
    id = lcol_chr("id"),
    wid = lcol_chr("wid"),
    user = lcol_df(
        "user",
        id = lcol_chr("id", .parser = as.character),
        username = lcol_chr("username"),
        email = lcol_chr("email"),
        color = lcol_chr("color"),
        initials = lcol_chr("initials"),
        profilePicture = lcol_chr("profilePicture")
    ),
    billable = lcol_lgl("billable"),
    start = lcol_dtt("start", .parser = cu_date_from),
    description = lcol_chr("description"),
    tags = lcol_guess("tags", .default = NULL),
    source = lcol_chr("source"),
    at = lcol_chr("at"),
    task = lcol_df(
        "task",
        id = lcol_chr("id", .default = NA_character_),
        name = lcol_chr("name", .default = NA_character_),
        status = lcol_df(
            "status",
            status = lcol_chr("status", .default = NA_character_),
            color = lcol_chr("color", .default = NA_character_),
            type = lcol_chr("type", .default = NA_character_),
            orderindex = lcol_int("orderindex", .default = NA_integer_),
            .default = NULL
        ),
        custom_type = lcol_guess("custom_type", .default = NULL),
        .default = NULL
    ),
    end = lcol_dtt("end", .parser = cu_date_from, .default = dttr2::NA_POSIXct_),
    duration = lcol_vec("duration", hms::new_hms(), .default = dttr2::NA_hms_, .parser = ~ hms::as_hms(as.numeric(.x) / 1000))
)
