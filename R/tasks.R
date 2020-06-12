## Tasks ---------------------------------

# ... takes parameters, most importantly page (starting at 0)
# https://clickup20.docs.apiary.io/#reference/0/tasks/get-tasks
# The maximum number of tasks returned in this response is 100.
# When you are paging this request, you should check list limit
# against the length of each response to determine if you are
# on the last page.
cu_get_tasks <- function(list_id, archived=FALSE, ...) {
    .cu_get("list", list_id, "task",
            query = list("archived" = tolower(archived), ...))
}

cu_get_task <- function(task_id) {
    .cu_get("task", task_id)
}

# By default this does not include closed tasks.
# To page tasks, pass the page number you wish to fetch.
# https://clickup20.docs.apiary.io/#reference/0/tasks/get-filtered-team-tasks
cu_get_tasks_filtered <- function(team_id, ...) {
    .cu_get("team", team_id, "task",
            query = list(...))
}

# include_closed = FALSE by default
cu_get_tasks_all <- function(team_id, ...) {
    p <- 0
    done <- FALSE
    out <- list(tasks=NULL)
    while (!done) {
        batch <- cu_get_tasks_filtered(team_id, page=p)
        if (length(batch$tasks)) {
            out$tasks <- c(out$tasks, batch$tasks)
            p <- p + 1
        } else {
            done <- TRUE
        }
    }
    out
}
