pkgload::load_all()
library(tibblify)
library(tidyverse)

df_teams <- cuf_get_teams()
df_spaces <- cuf_get_spaces(df_teams$id[[1]])

df_folders <- cuf_get_folders(df_spaces$id[[1]])
df_folders

df_lists <- cuf_get_lists(df_folders$id[[1]])
df_lists

members <- cu_get_list_members(df_lists$id[[1]])

spec_members <- guess_tspec(members$members)

write_spec(spec_members)
rm(spec_members)

# Reload
pkgload::load_all()

df_tasks <- cuf_get_tasks(df_lists$id[[2]])
df_tasks$assignees[[1]]

df_task_members <- cuf_get_task_members(df_tasks$id[[1]])
df_task_members
