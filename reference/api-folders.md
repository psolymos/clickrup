# Folders

Working with folders in ClickUp tasks (<https://clickup.com/api>).

## Usage

``` r
cu_create_folder(space_id, name, cu_token = NULL)

cu_update_folder(folder_id, name, cu_token = NULL)

cu_delete_folder(folder_id, name, cu_token = NULL)

cu_get_folders(space_id, archived = FALSE, cu_token = NULL)

cu_get_folder(folder_id, cu_token = NULL)
```

## Arguments

- space_id:

  Space ID.

- name:

  Name of the folder.

- cu_token:

  ClickUp personal access token or an access token from the OAuth flow.
  The `CU_PAT` environment variable is used when `NULL`.

- folder_id:

  Folder ID.

- archived:

  Logical, to return archived (`TRUE`) folders.

## Value

A cu object.

## See also

[cu](cu-class.md) for the cu object class.
