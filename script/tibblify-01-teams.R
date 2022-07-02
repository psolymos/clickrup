pkgload::load_all()
library(tibblify)
library(tidyverse)

teams <- cu_get_teams()
teams

# Needs https://github.com/mgirlich/tibblify/pull/50
spec_teams <- spec_guess(teams$teams)

df_teams <- tibblify(teams$teams, spec = spec_teams)
df_teams

df_teams
df_teams$members

write_spec(spec_teams)
