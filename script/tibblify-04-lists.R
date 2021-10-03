pkgload::load_all()
library(tibblify)
library(tidyverse)

df_teams <- cuf_get_teams()
df_spaces <- cuf_get_spaces(df_teams$id[[1]])

df_folders <- cuf_get_folders(df_spaces$id[[1]])
df_folders

lists <- cu_get_lists(df_folders$id[[1]])

df_lists <- tibblify::tibblify(lists$lists)
df_lists
df_lists %>% get_spec()

write_spec(df_lists)
