spec_time_entries <- lcols(
    id = lcol_chr("id"),
    task = lcol_lst("task", .default = NULL),
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
    end = lcol_dtt("end", .parser = cu_date_from),
    duration = lcol_chr("duration"),
    description = lcol_chr("description"),
    tags = lcol_guess("tags", .default = NULL),
    source = lcol_chr("source"),
    at = lcol_chr("at")
)
