pkgload::load_all()
library(tibblify)
library(tidyverse)

df_teams <- cuf_get_teams()

user_ids <- bind_rows(df_teams$members)$user$id

start_date <- format(as.numeric(cu_date_to(as.POSIXct("2021-04-01 00:00:00 UTC"))), scientific = FALSE)
end_date <- format(as.numeric(cu_date_to(Sys.time() + 86400)), scientific = FALSE)

time <- cu_get_time_entries_within_date_range(
    df_teams$id[[1]],
    start_date = start_date,
    end_date = end_date,
    assignee = paste(user_ids, collapse = ",")
)

good <-
    time$data %>%
    map("task") %>%
    map_lgl(is.list)

# contains garbage sometimes
for (i in which(!good)) {
    time$data[[i]]$task <- list()
}

spec_time_entries <- spec_guess(time$data)

df_time_entries <- tibblify::tibblify(time$data, spec_time_entries)
df_time_entries

write_spec(spec_time_entries)

# Reload after updating spec
pkgload::load_all()

cuf_get_time_entries_within_date_range(
    df_teams$id[[1]],
    start_date = start_date,
    end_date = end_date,
    assignee = paste(user_ids, collapse = ",")
)

df_time_entries$id
cuf_get_singular_time_entry(df_teams$id[[1]], df_time_entries$id[[1]])
cuf_get_time_entry_history(df_teams$id[[1]], df_time_entries$id[[253]])
