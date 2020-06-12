## Comments ------------------------------------------------

cu_get_task_comments <- function(task_id) {
  .cu_get("task", task_id, "comment")
}

cu_get_view_comments <- function(view_id) {
    .cu_get("view", view_id, "comment")
}

cu_get_list_comments <- function(list_id) {
    .cu_get("list", list_id, "comment")
}
