#' Task templates
#'
#' Working with task templates in ClickUp tasks.

#' @param team_id Team ID.
#' @param page Page to fetch (starts at 0).
#'   To page task templates, pass the page number you wish to fetch.
#' @param list_id List ID.
#' @param template_id Template ID.
#' @param name Name of the task.
#' @param ... Named arguments to be passed to API request body,
#'   see the ClickUp API documentation (<https://clickup.com/api>).
#' @param cu_token ClickUp personal access token or an access token from the OAuth flow.
#'   The `CU_PAT` environment variable is used when `NULL`.
#'
#' @return
#'
#' A cu object.
#'
#' @seealso [cu-class] for the cu object class.
#'
#' @name api-tasktemplates
NULL

#' @export
#' @rdname api-tasktemplates
## Task Templates / Get Task Templates
## GET https://api.clickup.com/api/v2/team/team_id/taskTemplate?page=0
##
##    team_id
##    Example: 512.
##    Number
##
##    page
##    Example: 0.
##    Integer
##
## To page task templates, pass the page number you wish to fetch.
cu_get_task_templates <- function(team_id, page, cu_token = NULL) {
    .cu_get("team", team_id, "taskTemplate",
            query = list(page = page), cu_token = cu_token)
}


#' @export
#' @rdname api-tasktemplates
## Task Templates / Create Task From Template
## POST https://api.clickup.com/api/v2/list/list_id/taskTemplate/template_id
##
##    list_id
##    Example: 512.
##    Number
##
##    template_id
##    Example: 9hz.
##    String
##
## Body
##
## {
##   "name": "New task name"
## }
cu_create_task_from_template <- function(list_id, template_id, name, ..., cu_token = NULL) {
    .cu_post("list", list_id, "taskTemplate", template_id,
        body=list(name=name, ...), cu_token = cu_token)
}
