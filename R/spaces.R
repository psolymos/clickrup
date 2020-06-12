## Spaces -----------------------------------

cu_get_spaces <- function(team_id, archived=FALSE) {
    .cu_get("team", team_id, "space",
            query = list("archived" = tolower(archived)))
}

cu_get_space <- function(space_id) {
    .cu_get("space", space_id)
}
