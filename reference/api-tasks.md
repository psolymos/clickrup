# Tasks

Working with tasks in ClickUp tasks.

## Usage

``` r
cu_create_task(list_id, ..., cu_token = NULL)

cu_update_task(task_id, ..., cu_token = NULL)

cu_delete_task(task_id, cu_token = NULL)

cu_get_tasks(list_id, archived = FALSE, ..., cu_token = NULL)

cu_get_task(task_id, cu_token = NULL)

cu_get_filtered_team_tasks(team_id, ..., cu_token = NULL)
```

## Arguments

- list_id:

  List ID.

- ...:

  Named arguments to be passed to API request body, of as query
  parameters, see the ClickUp API documentation
  (<https://clickup.com/api>).

- cu_token:

  ClickUp personal access token or an access token from the OAuth flow.
  The `CU_PAT` environment variable is used when `NULL`.

- task_id:

  Task ID. The ClickUp GUI prepends task IDs with a leading hash,
  [`cu_task_id()`](cu-task-id.md) is used internally to normalize task
  IDs.

- archived:

  Logical, to return archived (`TRUE`) lists.

- team_id:

  Team (workspace) ID.

## Value

A cu object.

## Details

### Create task

`assignees` is an array of the assignees' userids to be added to this
task. `priority` is an integer mapping as 1 : Urgent, 2 : High, 3 :
Normal, 4 : Low ([`cu_priority()`](cu-priority.md)). Time estimate is in
milliseconds. See the fields section below to see the custom fields
available on a list. If `notify_all` is true, creation notifications
will be sent to everyone including the creator of the task. Instead of
content you can pass `markdown_content` with valid markdown syntax to
add formatting to the task description. Passing an existing task ID in
the parent property will make the new task a subtask of that parent. The
parent you pass must not be a subtask itself, and must be part of the
list that you pass in the URL params. The `links_to` accepts a task ID
to create a linked dependency on the new task.

### Update task

Only pass properties you want to update. It is unnecessary to pass the
entire task object.

### Get tasks

The maximum number of tasks returned in this response is 100. When you
are paging this request, you should check list limit against the length
of each response to determine if you are on the last page. By default
this does not include closed tasks. To page tasks, pass the page number
you wish to fetch. [`cu_get_all_team_tasks()`](cu-get-all-team-tasks.md)
is a wrapper to spare paging.

### Filter query parameters

When value is an array, use [`I()`](https://rdrr.io/r/base/AsIs.html) to
make sure atomic vectors remain JSON arrays in the output.

- archived: return archived tasks.

- page: page to fetch (starts at 0)

- order_by: order by field, defaults to created; options: id, created,
  updated, due_date.

- reverse: reverse order.

- subtasks: include subtasks, default false.

- space_ids: spaces to query, array.

- project_ids: projects to query, array.

- statuses: statuses to query, array.

- include_closed: by default, the api does not include closed tasks. Set
  this to true and don't send a status filter to include closed tasks.

- assignees: assignees to query, array.

- due_date_gt: filter due date greater than posix time.

- due_date_lt: filter due date less than posix time.

- date_created_gt: filter date created greater than posix time.

- date_created_lt: filter date created less than posix time.

- date_updated_gt: filter date updated greater than posix time.

- date_updated_lt: filter date updated less than posix time

- custom_fields: filter by custom fields. Must be a stringified JSON
  array of objects. See the custom fields section of the API docs for
  more details.

## See also

[cu](cu-class.md) for the cu object class, [`cu_date_to()`](cu-date.md)
and [`cu_date_from()`](cu-date.md) to work with POSIX dates,
[`cu_get_all_team_tasks()`](cu-get-all-team-tasks.md) is a wrapper.
[`cu_task_id()`](cu-task-id.md) to remove leading hashes from task IDs.
