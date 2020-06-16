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
cu_get_task_templates <- function(team_id, page) {
    .cu_get("team", team_id, "taskTemplate",
            query = list(page = page))
}


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
cu_create_task_from_template <- function(list_id, template_id, name) {
    .cu_post("list", list_id, "taskTemplate", template_id,
        body=list(name=name))
}
