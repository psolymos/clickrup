pkgload::load_all()
library(tibblify)
library(tidyverse)

teams <- cu_get_teams()
teams

# Needs https://github.com/mgirlich/tibblify/pull/50
spec_teams <- tibblify::guess_tspec(teams$teams)
write_spec(spec_teams)
rm(spec_teams)

pkgload::load_all()

df_teams <- tibblify(teams$teams, spec = spec_teams, unspecified = "inform")
df_teams

df_teams
df_teams$members
