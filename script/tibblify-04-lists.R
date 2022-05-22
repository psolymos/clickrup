pkgload::load_all()
library(tibblify)
library(tidyverse)

df_teams <- cuf_get_teams()
df_spaces <- cuf_get_spaces(df_teams$id[[1]])

df_folders <- map_dfr(df_spaces$id, cuf_get_folders)
df_folders

lists <-
    df_folders$id %>%
    map(cu_get_lists) %>%
    map("lists") %>%
    unlist(recursive = FALSE)

spec_lists <- guess_spec(lists)

df_lists <- tibblify::tibblify(lists)
df_lists
df_lists %>% get_spec()

write_spec(spec_lists)
