% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/api-tags.R
\name{api-tags}
\alias{api-tags}
\alias{cu_get_space_tags}
\alias{cu_create_space_tag}
\alias{cu_edit_space_tag}
\alias{cu_delete_space_tag}
\alias{cu_add_tag_to_task}
\title{Tags}
\usage{
cu_get_space_tags(space_id)

cu_create_space_tag(space_id, name, ...)

cu_edit_space_tag(space_id, tag_name)

cu_delete_space_tag(task_id, tag_name)

cu_add_tag_to_task(task_id, tag_name)

cu_delete_space_tag(task_id, tag_name)
}
\arguments{
\item{space_id}{Space ID.}

\item{name}{Tag name.}

\item{...}{Named arguments to be passed to API request body,
see the ClickUp API documentation (\url{https://clickup.com/api}).}

\item{tag_name}{Tag name.}

\item{task_id}{Task ID.}
}
\value{
A cu object.
}
\description{
Working with tags in ClickUp tasks.
}
\seealso{
\linkS4class{cu} for the cu object class.
}
