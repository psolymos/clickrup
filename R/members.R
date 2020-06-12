## Members --------------------------------

cu_get_list_members <- function(list_id) {
    .cu_get("list", list_id, "member")
}
cu_get_task_members <- function(task_id) {
    .cu_get("task", task_id, "member")
}
