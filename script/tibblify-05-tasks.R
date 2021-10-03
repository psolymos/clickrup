pkgload::load_all()
library(tibblify)
library(tidyverse)

df_teams <- cuf_get_teams()
df_spaces <- cuf_get_spaces(df_teams$id[[1]])

df_folders <- map_dfr(df_spaces$id, cuf_get_folders)
df_folders

df_lists <- map_dfr(df_folders$id, cuf_get_lists)
df_lists

tasks_list <- map(df_lists$id, cu_get_tasks, subtasks = TRUE, include_closed = TRUE)
tasks_list_archived <- map(df_lists$id, cu_get_tasks, archived = TRUE, subtasks = TRUE, include_closed = TRUE)

tasks <-
    c(tasks_list, tasks_list_archived) %>%
    map("tasks") %>%
    unlist(recursive = FALSE)

tasks_team <- cu_get_filtered_team_tasks(df_teams$id[[1]])

df_tasks <- tibblify::tibblify(c(tasks, tasks_team$tasks))
df_tasks
df_tasks %>% get_spec()

write_spec(df_tasks)
