spec_spaces <- lcols(
    id = lcol_chr("id"),
    name = lcol_chr("name"),
    private = lcol_lgl("private"),
    statuses = lcol_df_lst(
        "statuses",
        status = lcol_chr("status"),
        type = lcol_chr("type"),
        orderindex = lcol_int("orderindex"),
        color = lcol_chr("color")
    ),
    multiple_assignees = lcol_lgl("multiple_assignees"),
    features = lcol_df(
        "features",
        due_dates = lcol_df(
            "due_dates",
            enabled = lcol_lgl("enabled"),
            start_date = lcol_lgl("start_date"),
            remap_due_dates = lcol_lgl("remap_due_dates"),
            remap_closed_due_date = lcol_lgl("remap_closed_due_date")
        ),
        time_tracking = lcol_df(
            "time_tracking",
            enabled = lcol_lgl("enabled"),
            .default = tibble(enabled = NA)
        ),
        tags = lcol_df(
            "tags",
            enabled = lcol_lgl("enabled"),
            .default = tibble(enabled = NA)
        ),
        time_estimates = lcol_df(
            "time_estimates",
            enabled = lcol_lgl("enabled"),
            .default = tibble(enabled = NA)
        ),
        checklists = lcol_df(
            "checklists",
            enabled = lcol_lgl("enabled"),
            .default = tibble(enabled = NA)
        ),
        custom_fields = lcol_df(
            "custom_fields",
            enabled = lcol_lgl("enabled", .default = NA),
            .default = tibble(enabled = NA)
        ),
        remap_dependencies = lcol_df(
            "remap_dependencies",
            enabled = lcol_lgl("enabled", .default = NA),
            .default = tibble(enabled = NA)
        ),
        dependency_warning = lcol_df(
            "dependency_warning",
            enabled = lcol_lgl("enabled", .default = NA),
            .default = tibble(enabled = NA)
        ),
        portfolios = lcol_df(
            "portfolios",
            enabled = lcol_lgl("enabled", .default = NA),
            .default = tibble(enabled = NA)
        )
    )
)
