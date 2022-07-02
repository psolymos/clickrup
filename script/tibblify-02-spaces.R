pkgload::load_all()
library(tibblify)
library(tidyverse)

df_teams <- cuf_get_teams()
spaces <- cu_get_spaces(df_teams$id[[1]])
spaces

spec_spaces <- spec_guess(spaces$spaces)

spaces$spaces %>%
    tibblify(spec = spec_spaces)

write_spec(spec_spaces)
