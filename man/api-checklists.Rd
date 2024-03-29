% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/api-checklists.R
\name{api-checklists}
\alias{api-checklists}
\alias{cu_create_checklist}
\alias{cu_edit_checklist}
\alias{cu_delete_checklist}
\alias{cu_create_checklist_item}
\alias{cu_edit_checklist_item}
\alias{cu_delete_checklist_item}
\title{Task checklists}
\usage{
cu_create_checklist(task_id, name, cu_token = NULL)

cu_edit_checklist(checklist_id, position, cu_token = NULL)

cu_delete_checklist(checklist_id, cu_token = NULL)

cu_create_checklist_item(checklist_id, name, ..., cu_token = NULL)

cu_edit_checklist_item(checklist_id, checklist_item_id, ..., cu_token = NULL)

cu_delete_checklist_item(checklist_id, checklist_item_id, cu_token = NULL)
}
\arguments{
\item{task_id}{Task ID.}

\item{name}{Checklist or checlist item name.}

\item{cu_token}{ClickUp personal access token or an access token from the OAuth flow.
The \code{CU_PAT} environment variable is used when \code{NULL}.}

\item{checklist_id}{Checklist ID.}

\item{position}{Position is the zero-based index of the order you want
the checklist to exist on the task. If you want the checklist to be
in the first position, pass 0.}

\item{...}{Named arguments to be passed to API request body,
see the ClickUp API documentation (\url{https://clickup.com/api}).}

\item{checklist_item_id}{Checklist item ID.}
}
\value{
A cu object.
}
\description{
Working with checklists in ClickUp tasks.
}
\examples{
\dontrun{
## create new checklist
cl <- cu_create_checklist("8ach57", "New checklist")

## change position of checklist
cu_edit_checklist(cl$checklist$id, position = 0)

## create checklist items
cli <- cu_create_checklist_item(cl$checklist$id, name="New item 1")
cli <- cu_create_checklist_item(cl$checklist$id, name="New item 2",
    assignee = 4471793)
cli <- cu_create_checklist_item(cl$checklist$id, name="New item 3",
     assignee = NA, resolved = TRUE, parent = NA)

## delete checklist items
cu_delete_checklist_item(cli$checklist$id,
     cli$checklist$items[[1]]$id)

## delete checklist
cu_delete_checklist(cli$checklist$id)
}

}
\seealso{
\linkS4class{cu} for the cu object class.
}
