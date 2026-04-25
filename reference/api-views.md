# Views

Working views in ClickUp tasks.

## Usage

``` r
cu_create_team_view(team_id, name, ..., cu_token = NULL)

cu_create_space_view(space_id, name, ..., cu_token = NULL)

cu_create_folder_view(folder_id, name, ..., cu_token = NULL)

cu_create_list_view(list_id, name, ..., cu_token = NULL)

cu_get_team_views(team_id, cu_token = NULL)

cu_get_space_views(space_id, cu_token = NULL)

cu_get_folder_views(folder_id, cu_token = NULL)

cu_get_list_views(list_id, cu_token = NULL)

cu_get_view(view_id, cu_token = NULL)

cu_get_view_tasks(view_id, page, cu_token = NULL)

cu_update_view(view_id, ..., cu_token = NULL)

cu_delete_view(view_id, cu_token = NULL)
```

## Arguments

- team_id:

  Team (workspace) ID.

- name:

  View name.

- ...:

  Named arguments to be passed to API request body, see the ClickUp API
  documentation (<https://clickup.com/api>).

- cu_token:

  ClickUp personal access token or an access token from the OAuth flow.
  The `CU_PAT` environment variable is used when `NULL`.

- space_id:

  Space ID.

- folder_id:

  Folder ID.

- list_id:

  List ID.

- view_id:

  View ID.

- page:

  Page to fetch (starts at 0).

## Value

A cu object.

## See also

[cu](cu-class.md) for the cu object class.
