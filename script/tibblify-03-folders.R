pkgload::load_all()
library(tibblify)
library(tidyverse)

df_teams <- cuf_get_teams()
df_spaces <- cuf_get_spaces(df_teams$id[[1]])

folders <- cu_get_folders(df_spaces$id[[1]])
folders

df_folders <- tibblify::tibblify(folders$folders)
df_folders
df_folders %>% get_spec()

write_spec(df_folders)
