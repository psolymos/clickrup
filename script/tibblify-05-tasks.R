pkgload::load_all()
library(tibblify)
library(tidyverse)

df_teams <- cuf_get_teams()
tasks_team <- cu_get_filtered_team_tasks(df_teams$id[[1]], include_closed = TRUE, subtasks = TRUE)

spec_tasks <- guess_tspec(tasks_team$tasks)
write_spec(spec_tasks)
rm(spec_tasks)

pkgload::load_all()

df_spaces <- cuf_get_spaces(df_teams$id[[1]])

df_folder <- cuf_get_folders(df_spaces$id[[1]])
df_folder

df_list <- cuf_get_lists(df_folder$id[[1]])
df_list

df_tasks <- cuf_get_tasks(df_list$id[[1]])
df_tasks
df_tasks$priority
df_tasks$custom_fields[[1]]
df_tasks$dependencies[[1]]
df_tasks$sharing
df_tasks$sharing$public_fields[[1]]

df_all_tasks <- cuf_get_filtered_team_tasks(df_teams$id[[1]], include_closed = TRUE, subtasks = TRUE)
df_all_tasks
