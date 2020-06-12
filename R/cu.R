## common stuff ------------------------------------------------

# need to `export CU_PAT="TOKEY"` but RStudio won't see it on Mac
# follow this: http://btibert3.github.io/2015/12/08/Environment-Variables-in-Rstudio-on-Mac.html
cu_pat <- function() {
    pat <- Sys.getenv("CU_PAT", unset=NA)
    if (is.na(pat))
        stop("You need to set CU_PAT environment variable: see ?Sys.setenv")
    pat
}

cu_options <- function(...) {
    opar <- getOption("cu_options")
    args <- list(...)
    if (length(args)) {
        if (length(args) == 1L && is.list(args[[1L]])) {
            npar <- args[[1L]]
        } else {
            npar <- opar
            npar[match(names(args), names(npar))] <- args
        }
        options("cu_options" = npar)
    }
    invisible(opar)
}

cu_path <- function(...) {
    path <- paste(..., sep="/", collapse="/")
    path <- paste0("/api/", getOption("cu_options")$version, "/", path)
    gsub("//", "/", path)
}

.cu_get <- function(..., query=list(), content_only=TRUE) {
    out <- httr::GET(
            modify_url(getOption("cu_options")$baseurl,
                       path = cu_path(...),
                       query = query),
            httr::add_headers(Authorization = cu_pat()))
    if (content_only)
        out <- httr::content(out)
    out
}

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

## Custom Fields ----------------------------------------

# Custom Fields / Get Accessible Custom Fields
cu_get_list_fields <- function(list_id) {
    .cu_get("list", list_id, "field")
}

## Folders ------------------------------------

cu_get_folders <- function(space_id, archived=FALSE) {
    .cu_get("space", space_id, "folder",
            query = list("archived" = tolower(archived)))
}

cu_get_folder <- function(folder_id) {
    .cu_get("folder", folder_id)
}

## Goals -----------------------------------

cu_get_goals <- function(team_id) {
    .cu_get("team", team_id, "goal")
}

cu_get_goal <- function(goal_id) {
    .cu_get("goal", goal_id)
}

## Lists -----------------------------------

cu_get_lists <- function(folder_id, archived=FALSE) {
    .cu_get("folder", folder_id, "list",
            query = list("archived" = tolower(archived)))
}

cu_get_lists_folderless <- function(space_id, archived=FALSE) {
    .cu_get("space", space_id, "list",
            query = list("archived" = tolower(archived)))
}

cu_get_list <- function(list_id) {
    .cu_get("list", list_id)
}

## Members --------------------------------

cu_get_list_members <- function(list_id) {
    .cu_get("list", list_id, "member")
}
cu_get_task_members <- function(task_id) {
    .cu_get("task", task_id, "member")
}

## Shared Hierarchy --------------------------------

cu_get_shared <- function(team_id) {
    .cu_get("team", team_id, "shared")
}

## Spaces -----------------------------------

cu_get_spaces <- function(team_id, archived=FALSE) {
    .cu_get("team", team_id, "space",
            query = list("archived" = tolower(archived)))
}

cu_get_space <- function(space_id) {
    .cu_get("space", space_id)
}

## Tags -----------------------------------

cu_get_space_tags <- function(space_id) {
    .cu_get("space", space_id, "tag")
}

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

## Task Templates ------------------------

cu_get_task_templates <- function(team_id, page) {
    .cu_get("team", team_id, "taskTemplate",
            query = list(page = page))
}

## Teams / Workspaces ---------------------

# get workspace details (id, name, members), team here is alias for workspace
cu_get_teams <- function() {
    .cu_get("team")
}
cu_get_workspaces <- cu_get_teams

## Time Tracking ---------------------------

cu_get_time <- function(task_id) {
    .cu_get("task", task_id, "time")
}

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

## Webhooks -------------------------

cu_get_webhooks <- function(team_id) {
  .cu_get("team", team_id, "webhook")
}

