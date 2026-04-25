# Extracts the response attribute

The function extracts the response attribute from a cu object after an
ClickUp API call.

## Usage

``` r
cu_response(x)
```

## Arguments

- x:

  An object of class cu.

## Value

A response object as returned by
[`httr::response()`](https://httr.r-lib.org/reference/response.html).
Only calls to existing API endpoints return a response attribute.
Wrapper functions that make multiple calls to endpoints (e.g. due to
paging etc.) do not store the responses and return `NULL`.

## See also

[`httr::response()`](https://httr.r-lib.org/reference/response.html) for
the response object, and [cu](cu-class.md) for the cu object class.

## Examples

``` r
if (FALSE) { # \dontrun{
task <- cu_get_task("8ach57")
cu_response(task)
} # }
```
