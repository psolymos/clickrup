# Wrapper function to get all tasks from a workspace

The wrapper function uses [`cu_get_filtered_team_tasks()`](api-tasks.md)
but takes care of paging.

## Usage

``` r
cu_get_all_team_tasks(team_id, ...)
```

## Arguments

- team_id:

  Team ID of tasks.

- ...:

  All query parameters for
  [`cu_get_filtered_team_tasks()`](api-tasks.md) except for `page`
  (paging is taken care of), e.g. `include_closed` to include closed
  tasks.

## Value

A list parsed from the JSON response. The return object does not have a
response attribute.

## See also

[cu](cu-class.md) for the cu object class.
