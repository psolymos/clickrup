pkgload::load_all()
library(tibblify)
library(tidyverse)

teams <- cu_get_teams()
teams

df_teams <- tibblify(teams$teams)
df_teams
df_teams %>% get_spec()

df_teams
df_teams$members

write_spec(df_teams)
