pkgload::load_all()
library(tidyverse)

# team_id <- cuf_get_teams()$id[[1]]
team_id <- "24312410"

spaces <- cuf_get_spaces(team_id)

walk(spaces$id, cu_delete_space)

space_1 <- cuf_create_space(team_id, "Test space 1")
space_1

space_2 <- cuf_create_space(team_id, "Test space 2")
space_2

folder_1 <- cu_create_folder(space_1$id, "Folder in space 1")
folder_1
