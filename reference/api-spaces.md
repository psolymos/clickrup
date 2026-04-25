# Spaces

Working with spaces in ClickUp tasks.

## Usage

``` r
cu_create_space(team_id, name, ..., cu_token = NULL)

cu_update_space(space_id, ..., cu_token = NULL)

cu_delete_space(space_id, cu_token = NULL)

cu_get_spaces(team_id, archived = FALSE, cu_token = NULL)

cu_get_space(space_id, cu_token = NULL)
```

## Arguments

- team_id:

  Team ID.

- name:

  Name of the space.

- ...:

  Named arguments to be passed to API request body, see the ClickUp API
  documentation (<https://clickup.com/api>).

- cu_token:

  ClickUp personal access token or an access token from the OAuth flow.
  The `CU_PAT` environment variable is used when `NULL`.

- space_id:

  Space ID.

- archived:

  Logical, to return archived (`TRUE`) spaces.

## Value

A cu object.

## See also

[cu](cu-class.md) for the cu object class.
