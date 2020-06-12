## Views --------------------------

cu_get_team_views <- function(team_id) {
    .cu_get("team", team_id, "view")
}

cu_get_space_views <- function(space_id) {
    .cu_get("space", space_id, "view")
}

cu_get_folder_views <- function(folder_id) {
    .cu_get("folder", folder_id, "view")
}

cu_get_list_views <- function(list_id) {
    .cu_get("list", list_id, "view")
}

cu_get_view <- function(view_id) {
    .cu_get("view", view_id)
}

cu_get_view_tasks <- function(view_id, page) {
    .cu_get("view", view_id, "task",
            query = list(page = page))
}
