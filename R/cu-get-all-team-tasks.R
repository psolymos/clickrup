#' Wrapper function to get all tasks from a workspace
#'
#' The wrapper function uses [cu_get_filtered_team_tasks()]
#' but takes care of paging.
#' No longer needed because paging is now handled automatically for all functions,
#' including [cu_get_filtered_team_tasks()].
#'
#' @param team_id Team ID of tasks.
#' @param ... All query parameters for [cu_get_filtered_team_tasks()]
#'   except for `page` (paging is taken care of), e.g. `include_closed`
#'   to include closed tasks.
#'
#' @return
#'
#' A list parsed from the JSON response.
#' The return object does not have a response attribute.
#'
#' @seealso [cu-class] for the cu object class.
#'
#' @export
#' @name cu-get-all-team-tasks

## include_closed = FALSE by default
cu_get_all_team_tasks <- function(team_id, ...) {
    .Deprecated("cu_get_filtered_team_tasks")

    p <- 0
    done <- FALSE
    out <- list(tasks=NULL)
    while (!done) {
        batch <- cu_get_filtered_team_tasks(team_id, page=p, ...)
        if (length(batch$tasks)) {
            out$tasks <- c(out$tasks, batch$tasks)
            p <- p + 1
        } else {
            done <- TRUE
        }
    }
    class(out) <- c(class(batch), "cu_wrapper")
    out
}
