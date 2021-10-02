pkgload::load_all()
library(tidyverse)

# team_id <- cuf_get_teams()$id[[1]]
team_id <- "24312410"

spaces <- cuf_get_spaces(team_id)

walk(spaces, cu_delete_space)

asdf

cuf_create_space(team_id, "Test space 1")
cuf_create_space(team_id, "Test space 2")
space_df_2
