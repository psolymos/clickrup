# Goals

Working with goals in ClickUp tasks.

## Usage

``` r
cu_create_goal(team_id, ..., cu_token = NULL)

cu_update_goal(goal_id, ..., cu_token = NULL)

cu_delete_goal(goal_id, cu_token = NULL)

cu_get_goals(team_id, cu_token = NULL)

cu_get_goal(goal_id, cu_token = NULL)

cu_create_key_result(goal_id, ..., cu_token = NULL)

cu_edit_key_result(key_result_id, ..., cu_token = NULL)

cu_delete_key_result(key_result_id, cu_token = NULL)
```

## Arguments

- team_id:

  Team ID.

- ...:

  Named arguments to be passed to API request body, see the ClickUp API
  documentation (<https://clickup.com/api>).

- cu_token:

  ClickUp personal access token or an access token from the OAuth flow.
  The `CU_PAT` environment variable is used when `NULL`.

- goal_id:

  Goal ID.

- key_result_id:

  Key result ID.

## Value

A cu object.

## See also

[cu](cu-class.md) for the cu object class.
