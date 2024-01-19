pkgload::load_all()
library(tibblify)
library(tidyverse)

df_teams <- cuf_get_teams()
df_spaces <- cuf_get_spaces(df_teams$id[[1]])

folders <-
    df_spaces$id %>%
    map(cu_get_folders) %>%
    map("folders") %>%
    unlist(recursive = FALSE)
folders

spec_folders <- guess_tspec(folders)
write_spec(spec_folders)
rm(spec_folders)

pkgload::load_all()

df_folders <- cuf_get_folders(df_spaces$id[[1]])
df_folders
df_folders$lists[[1]]
