# Custom fields

Working with custom fields in ClickUp tasks.

## Usage

``` r
cu_get_accessible_custom_fields(list_id, cu_token = NULL)

cu_set_custom_field_value(task_id, field_id, ..., cu_token = NULL)

cu_remove_field_value(task_id, field_id, cu_token = NULL)
```

## Arguments

- list_id:

  List ID.

- cu_token:

  ClickUp personal access token or an access token from the OAuth flow.
  The `CU_PAT` environment variable is used when `NULL`.

- task_id:

  Task ID.

- field_id:

  Field ID.

- ...:

  Named arguments to be passed to API request body. The accessible
  fields can be found on the task object from the
  [`cu_get_task()`](api-tasks.md) route. This is where you can retrieve
  the `field_id`. see the ClickUp API documentation
  (<https://clickup.com/api>).

## Value

A cu object.

## See also

[cu](cu-class.md) for the cu object class.
