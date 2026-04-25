# Authorization

These are the routes for authing the API and going through the OAuth
flow. Applications utilizing the personal API token do not need these
functions.

## Usage

``` r
cu_get_access_token(client_id, client_secret, code, cu_token = NULL)

cu_get_authorized_user(cu_token = NULL)

cu_get_authorized_teams(cu_token = NULL)
```

## Arguments

- client_id:

  Oauth app client id.

- client_secret:

  Oauth app client secret.

- code:

  Code given in redirect URL.

- cu_token:

  ClickUp personal access token or an access token from the OAuth flow.
  The `CU_PAT` environment variable is used when `NULL`.

## Value

A cu object.

## See also

[cu](cu-class.md) for the cu object class.
