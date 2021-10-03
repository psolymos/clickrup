pkgload::load_all()
library(tibblify)
library(tidyverse)

df_teams <- cuf_get_teams()

user_ids <- bind_rows(df_teams$members)$user$id

time <- cu_get_time_entries_within_date_range(
    df_teams$id[[1]],
    start_date = cu_date_to("2021-06-01"),
    end_date = cu_date_to("2021-08-01"),
    assignee = paste(user_ids, collapse = ",")
)

df_time_entries <- tibblify::tibblify(time$data)
df_time_entries
df_time_entries %>% get_spec()

write_spec(df_time_entries)

# Reload after updating spec
pkgload::load_all()

df_time_entries$id
cuf_get_singular_time_entry(df_teams$id[[1]], df_time_entries$id[[1]])
cuf_get_time_entry_history(df_teams$id[[1]], df_time_entries$id[[253]])
