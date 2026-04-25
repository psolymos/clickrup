# Task relationships

Working dependencies xyz in ClickUp tasks (<https://clickup.com/api>).

## Usage

``` r
cu_add_dependency(task_id, depends_on, dependency_of, cu_token = NULL)

cu_delete_dependency(task_id, depends_on, dependency_of, cu_token = NULL)

cu_add_task_link(task_id, links_to, cu_token = NULL)

cu_delete_task_link(task_id, links_to, cu_token = NULL)
```

## Arguments

- task_id:

  Task ID.

- depends_on:

  A waiting on dependency of the task. One and only one of `depends_on`
  or `dependency_of` must be passed.

- dependency_of:

  A blocking dependency of the task. One and only one of `depends_on` or
  `dependency_of` must be passed.

- cu_token:

  ClickUp personal access token or an access token from the OAuth flow.
  The `CU_PAT` environment variable is used when `NULL`.

- links_to:

  Link to another task.

## Value

A cu object.

## See also

[cu](cu-class.md) for the cu object class.
