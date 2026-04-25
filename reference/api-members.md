# Members

Working with members in ClickUp tasks (<https://clickup.com/api>).

## Usage

``` r
cu_get_task_members(task_id, cu_token = NULL)

cu_get_list_members(list_id, cu_token = NULL)
```

## Arguments

- task_id:

  Task ID.

- cu_token:

  ClickUp personal access token or an access token from the OAuth flow.
  The `CU_PAT` environment variable is used when `NULL`.

- list_id:

  List ID.

## Value

A cu object.

## See also

[cu](cu-class.md) for the cu object class.
