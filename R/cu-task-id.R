#' Handling task IDs
#'
#' Task IDs are prepended with a hash when copied from the ClickUp GUI.
#' The function checks and removes the leading hash.

#' @param task_id Task ID with or without a leading hash.
#'
#' @examples
#'
#' cu_task_id("#7ygh8h")
#' cu_task_id("7ygh8h")
#'
#' @return
#'
#' Returns task ID as character without leading hash to be used in the API.
#'
#' @export
#' @name cu-task-id

## this allows manipulating cu options conveniently
cu_task_id <- function(task_id) {
    gsub("#", "", as.character(task_id))
}
