pkgload::load_all()
library(tibblify)

clip_spec <- function(x) {
    name <- deparse(substitute(x))

    out <-
        x %>%
        get_spec() %>%
        format() %>%
        fansi::strip_sgr()

    base_name <- gsub("^df_", "", name)

    out <- paste0(base_name, "spec_", name, " <- ", out)
    out <- gsub("  ", "    ", out)

    writeLines(out, file.path("R", paste0("spec-", base_name, ".R")))
}

teams <- cu_get_teams()
teams

df_teams <- tibblify(teams$teams)
df_teams
df_teams %>% get_spec()

clip_spec(df_teams)

df_teams
df_teams$members

spaces <- cu_get_spaces(df_teams$id[[1]])
spaces

df_spaces <- cuf_get_spaces(df_teams$id[[1]])

clip_spec(df_spaces)

df_spaces
df_spaces$statuses
df_spaces$features
df_spaces$features$due_dates
df_spaces$features$time_tracking
df_spaces$features$tags
df_spaces$features$time_estimates
df_spaces$features$checklists
df_spaces$features$custom_fields
df_spaces$features$remap_dependencies
df_spaces$features$dependency_warning
df_spaces$features$portfolios

folders <- cu_get_folders(df_spaces$id[[1]])
folders

df_folders <- tibblify::tibblify(folders$folders)
df_folders
df_folders %>% get_spec()

clip_spec(df_folders)

folder <- cu_get_folder(df_folders$id[[1]])
folder

df_folder <- tibblify::tibblify(list(unclass(folder)))
df_folder %>% get_spec()
