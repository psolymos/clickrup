# ClickUp API rate limit

The ClickUp API is rate limited per OAuth/PAT token. You will receive a
429 HTTP status code if you exceed the rate limit. According to the API
description (<https://clickup.com/api>), the rate limit is 100 requests
per minute per token and is subject to change. At the time of writing,
the limit is 900/min/token.

## Usage

``` r
cu_ratelimit(x)
```

## Arguments

- x:

  A cu object returned by an API call.

## Value

Returns a list with the following elements:

- `limit`: rate limit (per minute),

- `remaining`: remaining requests.

## See also

[cu](cu-class.md) for the cu object class.

## Examples

``` r
if (FALSE) { # \dontrun{
task <- cu_get_task("8ach57")
cu_ratelimit(task)
} # }
```
