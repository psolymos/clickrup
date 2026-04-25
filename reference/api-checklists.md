# Task checklists

Working with checklists in ClickUp tasks.

## Usage

``` r
cu_create_checklist(task_id, name, cu_token = NULL)

cu_edit_checklist(checklist_id, position, cu_token = NULL)

cu_delete_checklist(checklist_id, cu_token = NULL)

cu_create_checklist_item(checklist_id, name, ..., cu_token = NULL)

cu_edit_checklist_item(checklist_id, checklist_item_id, ..., cu_token = NULL)

cu_delete_checklist_item(checklist_id, checklist_item_id, cu_token = NULL)
```

## Arguments

- task_id:

  Task ID.

- name:

  Checklist or checlist item name.

- cu_token:

  ClickUp personal access token or an access token from the OAuth flow.
  The `CU_PAT` environment variable is used when `NULL`.

- checklist_id:

  Checklist ID.

- position:

  Position is the zero-based index of the order you want the checklist
  to exist on the task. If you want the checklist to be in the first
  position, pass 0.

- ...:

  Named arguments to be passed to API request body, see the ClickUp API
  documentation (<https://clickup.com/api>).

- checklist_item_id:

  Checklist item ID.

## Value

A cu object.

## See also

[cu](cu-class.md) for the cu object class.

## Examples

``` r
if (FALSE) { # \dontrun{
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
} # }
```
