pkgload::load_all()
library(tibblify)
library(tidyverse)

df_teams <- cuf_get_teams()
spaces <- cu_get_spaces(df_teams$id[[1]])
spaces

spec_spaces <- guess_tspec(spaces$spaces)
write_spec(spec_spaces)
rm(spec_spaces)

pkgload::load_all()

spaces$spaces %>%
    tibblify(spec = spec_spaces, unspecified = "inform")

