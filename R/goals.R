## Goals -----------------------------------

cu_get_goals <- function(team_id) {
    .cu_get("team", team_id, "goal")
}

cu_get_goal <- function(goal_id) {
    .cu_get("goal", goal_id)
}
