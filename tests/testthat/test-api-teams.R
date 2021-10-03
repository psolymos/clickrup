test_that("output", {
    expect_snapshot({
        cu_get_teams()
    })
})

test_that("data frame output", {
    expect_snapshot({
        df_teams <- cuf_get_teams()
        df_teams
        df_teams$members
    })
})
