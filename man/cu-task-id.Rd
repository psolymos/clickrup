% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cu-task-id.R
\name{cu-task-id}
\alias{cu-task-id}
\alias{cu_task_id}
\title{Handling task IDs}
\usage{
cu_task_id(task_id)
}
\arguments{
\item{task_id}{Task ID with or without a leading hash.}
}
\value{
Returns task ID as character without leading hash to be used in the API.
}
\description{
Task IDs are prepended with a hash when copied from the ClickUp GUI.
The function checks and removes the leading hash.
}
\examples{

cu_task_id("#7ygh8h")
cu_task_id("7ygh8h")

}
