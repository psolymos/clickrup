test_that("output", {
    expect_snapshot({
        cu_get_spaces("1234")
    })
    # UPSTREAM: No new data here, suggest to add?
    expect_snapshot({
        cu_get_spaces("1234", archived = TRUE)
    })
})

test_that("data frame output", {
    expect_snapshot({
        df_spaces <- cuf_get_spaces("1234")
        df_spaces
        df_spaces$statuses
        df_spaces$features
        df_spaces$features$due_dates
        df_spaces$features$time_tracking
        df_spaces$features$tags
        df_spaces$features$time_estimates
        df_spaces$features$checklists
        df_spaces$features$custom_fields
        df_spaces$features$remap_dependencies
        df_spaces$features$dependency_warning
        df_spaces$features$portfolios
    })
    expect_snapshot({
        cuf_get_spaces("1234", archived = TRUE)
    })
})
