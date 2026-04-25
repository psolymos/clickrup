# Lists

Working with lists in ClickUp tasks.

## Usage

``` r
cu_create_list(folder_id, ..., cu_token = NULL)

cu_create_folderless_list(space_id, ..., cu_token = NULL)

cu_update_list(list_id, ..., cu_token = NULL)

cu_delete_list(list_id, ..., cu_token = NULL)

cu_get_lists(folder_id, archived = FALSE, cu_token = NULL)

cu_get_lists_folderless(space_id, archived = FALSE, cu_token = NULL)

cu_get_list(list_id, cu_token = NULL)
```

## Arguments

- folder_id:

  Folder ID.

- ...:

  Named arguments to be passed to API request body, see the ClickUp API
  documentation (<https://clickup.com/api>).

- cu_token:

  ClickUp personal access token or an access token from the OAuth flow.
  The `CU_PAT` environment variable is used when `NULL`.

- space_id:

  SPace ID.

- list_id:

  List ID.

- archived:

  Logical, to return archived (`TRUE`) lists.

## Value

A cu object.

## See also

[cu](cu-class.md) for the cu object class.
