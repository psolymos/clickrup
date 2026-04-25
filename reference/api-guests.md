# Guests

Working with guests in ClickUp tasks (Enterprise only feature).

## Usage

``` r
cu_invite_guest_to_workspace(team_id, cu_token = NULL)

cu_edit_guest_on_workspace(team_id, guest_id, ..., cu_token = NULL)

cu_remove_guest_from_workspace(team_id, guest_id, cu_token = NULL)

cu_get_guest(team_id, guest_id, cu_token = NULL)

cu_add_guest_to_task(
  task_id,
  guest_id,
  permission_level = "read",
  cu_token = NULL
)

cu_remove_guest_from_task(task_id, guest_id, cu_token = NULL)

cu_add_guest_to_list(
  list_id,
  guest_id,
  permission_level = "read",
  cu_token = NULL
)

cu_remove_guest_from_list(list_id, guest_id, cu_token = NULL)

cu_add_guest_to_folder(
  folder_id,
  guest_id,
  permission_level = "read",
  cu_token = NULL
)

cu_remove_guest_from_folder(folder_id, guest_id, cu_token = NULL)
```

## Arguments

- team_id:

  Team ID.

- cu_token:

  ClickUp personal access token or an access token from the OAuth flow.
  The `CU_PAT` environment variable is used when `NULL`.

- guest_id:

  Guest ID.

- ...:

  Named arguments to be passed to API request body, see the ClickUp API
  documentation (<https://clickup.com/api>).

- task_id:

  Task ID.

- permission_level:

  Permisson level can be `"read"`, `"comment"`, `"edit"`, or `"create"`.

- list_id:

  List ID.

- folder_id:

  Folder ID.

## Value

A cu object.

## See also

[cu](cu-class.md) for the cu object class.
