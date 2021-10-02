pkgload::load_all()

team_id <- cuf_get_teams()$id[[1]]

cuf_create_space(team_id, "Test space 1")
space_df_2 <- cuf_create_space(team_id, "Test space 2")
space_df_2
