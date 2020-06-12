## Task Templates ------------------------

cu_get_task_templates <- function(team_id, page) {
    .cu_get("team", team_id, "taskTemplate",
            query = list(page = page))
}
