pkgload::load_all()
library(tibblify)
library(tidyverse)

df_teams <- cuf_get_teams()
df_spaces <- cuf_get_spaces(df_teams$id[[1]])

df_folders <- cuf_get_folders(df_spaces$id[[1]])
df_folders

df_lists <- cuf_get_lists(df_folders$id[[1]])
df_lists

tasks <- cu_get_tasks(df_lists$id[[1]])

df_tasks <- tibblify::tibblify(tasks$tasks)
df_tasks
df_tasks %>% get_spec()

write_spec(df_tasks)
