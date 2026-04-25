# Teams (workspaces)

Working with teams (workspaces) in ClickUp tasks
(<https://clickup.com/api>). Teams is the legacy term for what are now
called workspaces in ClickUp. For compatablitly, the term team is still
used in the API v2. This is NOT the new 'Teams' feature which represents
a group of users.

## Usage

``` r
cu_get_teams(cu_token = NULL)
```

## Arguments

- cu_token:

  ClickUp personal access token or an access token from the OAuth flow.
  The `CU_PAT` environment variable is used when `NULL`.

## Value

A cu object.

## See also

[cu](cu-class.md) for the cu object class.

## Examples

``` r
if (FALSE) { # \dontrun{
cu_get_teams()
} # }
```
