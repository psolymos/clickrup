# Time tracking 2.0

Working with time tracking in ClickUp tasks. Note: A time entry that has
a negative duration means that timer is currently ongoing for that user.

## Usage

``` r
cu_get_time_entries_within_date_range(
  team_id,
  start_date,
  end_date,
  assignee,
  cu_token = NULL
)

cu_get_singular_time_entry(team_id, timer_id, cu_token = NULL)

cu_get_time_entry_history(team_id, timer_id, cu_token = NULL)

cu_get_running_time_entry(team_id, timer_id, cu_token = NULL)

cu_create_time_entry(team_id, ..., cu_token = NULL)

cu_remove_tags_from_time_entries(team_id, ..., cu_token = NULL)

cu_get_all_tags_from_time_entries(team_id, cu_token = NULL)

cu_add_tags_from_time_entries(team_id, ..., cu_token = NULL)

cu_change_tag_names_from_time_entries(team_id, ..., cu_token = NULL)

cu_start_time_entry(team_id, timer_id, ..., cu_token = NULL)

cu_stop_time_entry(team_id, cu_token = NULL)

cu_delete_time_entry(team_id, timer_id, cu_token = NULL)

cu_update_time_entry(team_id, timer_id, ..., cu_token = NULL)
```

## Arguments

- team_id:

  Team ID.

- start_date:

  POSIX start time in milliseconds.

- end_date:

  POSIX end time in milliseconds.

- assignee:

  User ids to filter by separated by commas. Note: Only Workspace
  Owners/Admins have access to do this.

- cu_token:

  ClickUp personal access token or an access token from the OAuth flow.
  The `CU_PAT` environment variable is used when `NULL`.

- timer_id:

  Timer ID.

- ...:

  Named arguments to be passed to API request body, see the ClickUp API
  documentation (<https://clickup.com/api>).

## Value

A cu object.

## See also

[api-timetracking-legacy](api-timetracking-legacy.md) for Time tracking
legacy API, [cu](cu-class.md) for the cu object class,
[`cu_date_from()`](cu-date.md) and [`cu_date_to()`](cu-date.md) to deal
with POSIX times.
