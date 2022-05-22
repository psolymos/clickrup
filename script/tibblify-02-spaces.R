pkgload::load_all()
library(tibblify)
library(tidyverse)

df_teams <- cuf_get_teams()
spaces <- cu_get_spaces(df_teams$id[[1]])
spaces

spec_spaces <- guess_spec(spaces$spaces)

df_spaces <-
    spaces$spaces %>%
    tibblify()

df_spaces %>%
    get_spec()

write_spec(spec_spaces)
