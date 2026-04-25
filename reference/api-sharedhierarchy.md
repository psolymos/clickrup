# Shared hierarchy

Working with shared hierarchy in ClickUp tasks
(<https://clickup.com/api>). Returns all resources you have access to
where you don't have access to its parent. For example, if you have
access to a shared task, but don't have access to its parent list, it
will come back in this request.

## Usage

``` r
cu_get_shared(team_id, cu_token = NULL)
```

## Arguments

- team_id:

  Team ID.

- cu_token:

  ClickUp personal access token or an access token from the OAuth flow.
  The `CU_PAT` environment variable is used when `NULL`.

## Value

A cu object.

## See also

[cu](cu-class.md) for the cu object class.
