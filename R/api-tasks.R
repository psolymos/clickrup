#' Tasks
#'
#' Working with tasks in ClickUp tasks.

#' @details
#'
#' ### Create task
#'
#' `assignees` is an array of the assignees' userids to be added to this task.
#' `priority` is an integer mapping as 1 : Urgent, 2 : High, 3 : Normal, 4 : Low
#' ([cu_priority()]). Time estimate is in milliseconds.
#' See the fields section below to see the custom fields available on a list.
#' If `notify_all` is true, creation notifications will be sent to everyone
#' including the creator of the task. Instead of content you can pass
#' `markdown_content` with valid markdown syntax to add formatting to the
#' task description. Passing an existing task ID in the parent property
#' will make the new task a subtask of that parent.
#' The parent you pass must not be a subtask itself,
#' and must be part of the list that you pass in the URL params.
#' The `links_to` accepts a task ID to create a linked dependency on
#' the new task.
#'
#' ### Update task
#'
#' Only pass properties you want to update.
#' It is unnecessary to pass the entire task object.
#'
#' ### Get tasks
#'
#' The maximum number of tasks returned in this response is 100.
#' When you are paging this request, you should check list limit against
#' the length of each response to determine if you are on the last page.
#' By default this does not include closed tasks. To page tasks,
#' pass the page number you wish to fetch. [cu_get_all_team_tasks()]
#' is a wrapper to spare paging.
#'
#' ### Filter query parameters
#'
#' When value is an array, use `I()` to make sure atomic vectors
#' remain JSON arrays in the output.
#'
#' * archived: return archived tasks.
#' * page: page to fetch (starts at 0)
#' * order_by: order by field, defaults to created; options: id, created,
#'     updated, due_date.
#' * reverse: reverse order.
#' * subtasks: include subtasks, default false.
#' * space_ids: spaces to query, array.
#' * project_ids: projects to query, array.
#' * statuses: statuses to query, array.
#' * include_closed: by default, the api does not include closed tasks.
#'     Set this to true and don't send a status filter to include closed tasks.
#' * assignees: assignees to query, array.
#' * due_date_gt: filter due date greater than posix time.
#' * due_date_lt: filter due date less than posix time.
#' * date_created_gt: filter date created greater than posix time.
#' * date_created_lt: filter date created less than posix time.
#' * date_updated_gt: filter date updated greater than posix time.
#' * date_updated_lt: filter date updated less than posix time
#' * custom_fields: filter by custom fields. Must be a stringified
#'   JSON array of objects. See the custom fields section of the API docs
#'   for more details.
#'
#' @param team_id Team (workspace) ID.
#' @param list_id List ID.
#' @param task_id Task ID. The ClickUp GUI prepends task IDs with a leading hash, [cu_task_id()] is used internally to normalize task IDs.
#' @param archived Logical, to return archived (`TRUE`) lists.
#' @param ... Named arguments to be passed to API request body,
#'   of as query parameters,
#'   see the ClickUp API documentation (<https://clickup.com/api>).
#' @param cu_token ClickUp personal access token or an access token from the OAuth flow.
#'   The `CU_PAT` environment variable is used when `NULL`.
#'
#' @return
#'
#' A cu object.
#'
#' @seealso [cu-class] for the cu object class, [cu_date_to()] and
#'   [cu_date_from()] to work with POSIX dates,
#'   [cu_get_all_team_tasks()] is a wrapper. [cu_task_id()] to remove leading hashes from task IDs.
#'
#' @name api-tasks
NULL

#' @export
#' @rdname api-tasks
## Tasks / Create Task
## POST https://api.clickup.com/api/v2/list/list_id/task
##
##     list_id
##     Example: 123.
##     Number
##
## assignees is an array of the assignees' userids to be added to this task.
## priority is an integer mapping as 1 : Urgent, 2 : High, 3 : Normal, 4 : Low.
## Time estimate is in milliseconds.
## See the fields section below to see the custom fields available on a list.
## If notify_all is true, creation notifications will be sent to everyone
## including the creator of the task. Instead of content you can pass
## markdown_content with valid markdown syntax to add formatting to the
## task description. Passing an existing task ID in the parent property
## will make the new task a subtask of that parent.
## The parent you pass must not be a subtask itself,
## and must be part of the list that you pass in the URL params.
## The links_to accepts a task ID to create a linked dependency on the new task.
##
## Body
##
## {
##   "name": "New Task Name",
##   "content": "New Task Content",
##   "assignees": [
##     183
##   ],
##   "tags": [
##     "tag name 1"
##   ],
##   "status": "Open",
##   "priority": 3,
##   "due_date": 1508369194377,
##   "due_date_time": false,
##   "time_estimate": 8640000,
##   "start_date": 1567780450202,
##   "start_date_time": false,
##   "notify_all": true,
##   "parent": null,
##   "links_to": null,
##   "custom_fields": [
##     {
##       "id": "0a52c486-5f05-403b-b4fd-c512ff05131c",
##       "value": 23
##     },
##     {
##       "id": "03efda77-c7a0-42d3-8afd-fd546353c2f5",
##       "value": "Text field input"
##     }
##   ]
## }
##
## Use I() when providing arrays as part of the body
## list(a=1, b=I(2)) will be {"a":1,"b":[2]}
cu_create_task <- function(list_id, ..., cu_token = NULL) {
    .cu_post("list", list_id, "task",
        body=list(...), cu_token = cu_token)
}


#' @export
#' @rdname api-tasks
## Tasks / Update Task
## PUT https://api.clickup.com/api/v2/task/task_id
##
##     task_id
##     Example: 9hx.
##     String
##
## Only pass properties you want to update.
## It is unnecessary to pass the entire task object. assignees is an
## array of the assignees' userids to be added to this task.
## priority is an integer mapping as 1 : Urgent, 2 : High, 3 : Normal, 4 : Low.
## Time estimate is in milliseconds.
##
## Body
##
## {
##     "name": "Updated Task Name",
##     "content": "Updated Task Content",
##     "status": "in progress",
##     "priority": 1,
##     "time_estimate": 8640000,
##     "assignees": {
##         "add": [182],
##         "rem": [183]
##     },
##     "archived": false,
## }
cu_update_task <- function(task_id, ..., cu_token = NULL) {
    task_id <- cu_task_id(task_id)
    .cu_put("task", task_id,
        body=list(...), cu_token = cu_token)
}


#' @export
#' @rdname api-tasks
## Tasks / Delete Task
## DELETE https://api.clickup.com/api/v2/task/task_id
##
##     task_id
##     Example: 9xh.
##     String
cu_delete_task <- function(task_id, cu_token = NULL) {
    task_id <- cu_task_id(task_id)
    .cu_delete("task", task_id, cu_token = cu_token)
}


#' @export
#' @rdname api-tasks
## Tasks / Get Tasks
## GET https://api.clickup.com/api/v2/list/list_id/task?archived=false&page=&order_by=&reverse=&subtasks=&space_ids%5B%5D=&project_ids%5B%5D=&statuses%5B%5D=&include_closed=&assignees%5B%5D=&due_date_gt=&due_date_lt=&date_created_gt=&date_created_lt=&date_updated_gt=&date_updated_lt=&custom_fields=
##
##     list_id
##     Example: 123.
##     Number
##
##     archived
##     Example: false.
##     Boolean
##
##     page
##     Page to fetch (starts at 0)
##     Integer
##
##     order_by
##     Order by field, defaults to created Options: id, created,
##     updated, due_date
##     String
##
##     reverse
##     Reverse order
##     Boolean
##
##     subtasks
##     Include subtasks, default false
##     Boolean
##
##     space_ids[]
##     Spaces to query
##     Array
##
##     project_ids[]
##     Projects to query
##     Array
##
##     statuses[]
##     Statuses to query
##     Array
##
##     include_closed
##     By default, the api does not include closed tasks.
##     Set this to true and dont send a status filter to include closed tasks.
##     Boolean
##
##     assignees[]
##     Assignees to query
##     Array
##
##     due_date_gt
##     Filter due date greater than posix time
##     Integer
##
##     due_date_lt
##     Filter due date less than posix time
##     Integer
##
##     date_created_gt
##     Filter date created greater than posix time
##     Integer
##
##     date_created_lt
##     Filter date created less than posix time
##     Integer
##
##     date_updated_gt
##     Filter date updated greater than posix time
##     Integer
##
##     date_updated_lt
##     Filter date updated less than posix time
##     Integer
##
##     custom_fields
##     Filter by custom fields. Must be a stringified JSON array of objects.
##     See the custom fields section for more details.
##     Object[]
##
## The maximum number of tasks returned in this response is 100.
## When you are paging this request, you should check list limit against
## the length of each response to determine if you are on the last page.
##
# ... takes parameters, most importantly page (starting at 0)
cu_get_tasks <- function(list_id, archived=FALSE, ..., cu_token = NULL) {
    .cu_get("list", list_id, "task",
            query = list("archived" = tolower(archived), ...), cu_token = cu_token)
}


#' @export
#' @rdname api-tasks
## Tasks / Get Task
## GET https://api.clickup.com/api/v2/task/task_id
##
##     task_id
##     Example: 9hz.
##     String
cu_get_task <- function(task_id, cu_token = NULL) {
    task_id <- cu_task_id(task_id)
    .cu_get("task", task_id, cu_token = cu_token)
}


#' @export
#' @rdname api-tasks
## Tasks / Get Filtered Team Tasks
## GET https://api.clickup.com/api/v2/team/team_id/task?page=&order_by=&reverse=&subtasks=&space_ids%5B%5D=&project_ids%5B%5D=&list_ids%5B%5D=&statuses%5B%5D=&include_closed=&assignees%5B%5D=&tags%5B%5D=&due_date_gt=&due_date_lt=&date_created_gt=&date_created_lt=&date_updated_gt=&date_updated_lt=&custom_fields%5B%5D=
##
##    team_id
##    Team ID of tasks
##    Example: 123.
##    String
##
##    page
##    Page to fetch
##    Integer
##
##    order_by
##    Order by field, defaults to created Options: id, created, updated, due_date
##    String
##
##    reverse
##    Reverse order
##    Boolean
##
##    subtasks
##    Include subtasks, default false
##    Boolean
##
##    space_ids[]
##    Spaces to query
##    Array
##
##    project_ids[]
##    Projects to query
##    Array
##
##    list_ids[]
##    Lists to query
##    Array
##
##    statuses[]
##    Statuses to query
##    Array
##
##    include_closed
##    By default, the api does not include closed tasks.
##    Set this to true and dont send a status filter to include closed tasks.
##    Boolean
##
##    assignees[]
##    Assignees to query
##    Array
##
##    tags[]
##    Tag names to query
##    Array
##
##    due_date_gt
##    Filter due date greater than posix time
##    Integer
##
##    due_date_lt
##    Filter due date less than posix time
##    Integer
##
##    date_created_gt
##    Filter date created greater than posix time
##    Integer
##
##    date_created_lt
##    Filter date created less than posix time
##    Integer
##
##    date_updated_gt
##    Filter date updated greater than posix time
##    Integer
##
##    date_updated_lt
##    Filter date updated less than posix time
##    Integer
##
##    custom_fields[]
##    Filter by custom fields. Must be a stringified JSON array of
##    objects that must include fields field_id, value, operator.
##    See the custom fields section for more details.
##    Object[]
##
## By default this does not include closed tasks. To page tasks,
## pass the page number you wish to fetch.
cu_get_filtered_team_tasks <- function(team_id, ..., cu_token = NULL) {
    .cu_get("team", team_id, "task",
            query = list(...), cu_token = cu_token)
}

