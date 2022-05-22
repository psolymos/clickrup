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

spec_folders <- guess_spec(folders)

df_folders <- tibblify::tibblify(folders)
df_folders
df_folders %>% get_spec()

write_spec(spec_folders)
