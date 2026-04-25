# Users

Working with users in ClickUp tasks (Enterprise only feture).

## Usage

``` r
cu_invite_user_to_workspace(
  team_id,
  email,
  admin = FALSE,
  ...,
  cu_token = NULL
)

cu_edit_user_on_workspace(
  team_id,
  user_id,
  username,
  admin = FALSE,
  ...,
  cu_token = NULL
)

cu_remove_user_from_workspace(team_id, user_id, cu_token = NULL)

cu_get_user(team_id, user_id, cu_token = NULL)
```

## Arguments

- team_id:

  Team (workspace) ID.

- email:

  Email.

- admin:

  Logical, admin account or not

- ...:

  Named arguments to be passed to API request body, see the ClickUp API
  documentation (<https://clickup.com/api>).

- cu_token:

  ClickUp personal access token or an access token from the OAuth flow.
  The `CU_PAT` environment variable is used when `NULL`.

- user_id:

  User ID.

- username:

  User name.

## Value

A cu object.

## See also

[cu](cu-class.md) for the cu object class.
