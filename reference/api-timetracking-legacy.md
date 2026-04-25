# Time tracking legacy

Working with time tracking in ClickUp tasks. Note: This is the legacy
API for time tracking. Please use the new Time tracking API. You won't
be able to update timer entries that uses our Time Tracking 2.0 features
that uses labels, descriptions, and making time entries billable.

## Usage

``` r
cu_track_time(task_id, ..., cu_token = NULL)

cu_get_tracked_time(task_id, cu_token = NULL)

cu_edit_time_tracked(task_id, interval_id, ..., cu_token = NULL)

cu_delete_time_tracked(task_id, interval_id, cu_token = NULL)
```

## Arguments

- task_id:

  Task ID.

- ...:

  Named arguments to be passed to API request body, see the ClickUp API
  documentation (<https://clickup.com/api>). Edit the `start`, `end`, or
  total `time` of a time tracked entry.

- cu_token:

  ClickUp personal access token or an access token from the OAuth flow.
  The `CU_PAT` environment variable is used when `NULL`.

- interval_id:

  Interval ID.

## Value

A cu object. Note: the legacy API comes with a deprecation warning.

## See also

[api-timetracking-2](api-timetracking-2.md) for Time Tracking 2.0,
[cu](cu-class.md) for the cu object class,
[`cu_date_from()`](cu-date.md) and [`cu_date_to()`](cu-date.md) to deal
with POSIX times.
