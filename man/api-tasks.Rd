% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/api-tasks.R
\name{api-tasks}
\alias{api-tasks}
\alias{cu_create_task}
\alias{cu_update_task}
\alias{cu_delete_task}
\alias{cu_get_tasks}
\alias{cu_get_task}
\alias{cu_get_filtered_team_tasks}
\title{Tasks}
\usage{
cu_create_task(list_id, ..., cu_token = NULL)

cu_update_task(task_id, ..., cu_token = NULL)

cu_delete_task(task_id, cu_token = NULL)

cu_get_tasks(list_id, archived = FALSE, ..., cu_token = NULL)

cu_get_task(task_id, cu_token = NULL)

cu_get_filtered_team_tasks(team_id, ..., cu_token = NULL)
}
\arguments{
\item{list_id}{List ID.}

\item{...}{Named arguments to be passed to API request body,
of as query parameters,
see the ClickUp API documentation (\url{https://clickup.com/api}).}

\item{cu_token}{ClickUp personal access token or an access token from the OAuth flow.
The \code{CU_PAT} environment variable is used when \code{NULL}.}

\item{task_id}{Task ID. The ClickUp GUI prepends task IDs with a leading hash, \code{\link[=cu_task_id]{cu_task_id()}} is used internally to normalize task IDs.}

\item{archived}{Logical, to return archived (\code{TRUE}) lists.}

\item{team_id}{Team (workspace) ID.}
}
\value{
A cu object.
}
\description{
Working with tasks in ClickUp tasks.
}
\details{
\subsection{Create task}{

\code{assignees} is an array of the assignees' userids to be added to this task.
\code{priority} is an integer mapping as 1 : Urgent, 2 : High, 3 : Normal, 4 : Low
(\code{\link[=cu_priority]{cu_priority()}}). Time estimate is in milliseconds.
See the fields section below to see the custom fields available on a list.
If \code{notify_all} is true, creation notifications will be sent to everyone
including the creator of the task. Instead of content you can pass
\code{markdown_content} with valid markdown syntax to add formatting to the
task description. Passing an existing task ID in the parent property
will make the new task a subtask of that parent.
The parent you pass must not be a subtask itself,
and must be part of the list that you pass in the URL params.
The \code{links_to} accepts a task ID to create a linked dependency on
the new task.
}

\subsection{Update task}{

Only pass properties you want to update.
It is unnecessary to pass the entire task object.
}

\subsection{Get tasks}{

The maximum number of tasks returned in this response is 100.
When you are paging this request, you should check list limit against
the length of each response to determine if you are on the last page.
By default this does not include closed tasks. To page tasks,
pass the page number you wish to fetch. \code{\link[=cu_get_all_team_tasks]{cu_get_all_team_tasks()}}
is a wrapper to spare paging.
}

\subsection{Filter query parameters}{

When value is an array, use \code{I()} to make sure atomic vectors
remain JSON arrays in the output.
\itemize{
\item archived: return archived tasks.
\item page: page to fetch (starts at 0)
\item order_by: order by field, defaults to created; options: id, created,
updated, due_date.
\item reverse: reverse order.
\item subtasks: include subtasks, default false.
\item space_ids: spaces to query, array.
\item project_ids: projects to query, array.
\item statuses: statuses to query, array.
\item include_closed: by default, the api does not include closed tasks.
Set this to true and don't send a status filter to include closed tasks.
\item assignees: assignees to query, array.
\item due_date_gt: filter due date greater than posix time.
\item due_date_lt: filter due date less than posix time.
\item date_created_gt: filter date created greater than posix time.
\item date_created_lt: filter date created less than posix time.
\item date_updated_gt: filter date updated greater than posix time.
\item date_updated_lt: filter date updated less than posix time
\item custom_fields: filter by custom fields. Must be a stringified
JSON array of objects. See the custom fields section of the API docs
for more details.
}
}
}
\seealso{
\linkS4class{cu} for the cu object class, \code{\link[=cu_date_to]{cu_date_to()}} and
\code{\link[=cu_date_from]{cu_date_from()}} to work with POSIX dates,
\code{\link[=cu_get_all_team_tasks]{cu_get_all_team_tasks()}} is a wrapper. \code{\link[=cu_task_id]{cu_task_id()}} to remove leading hashes from task IDs.
}
