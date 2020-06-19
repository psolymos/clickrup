## Wrapper functions

# include_closed = FALSE by default
cu_get_all_team_tasks <- function(team_id, ...) {
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
    out
}
