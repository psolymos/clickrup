# Global options for the clickrup package

Options store and allow to set global values for the ClickUp API and for
clickrup functions.

## Usage

``` r
cu_options(...)
```

## Arguments

- ...:

  Options to set.

## Value

When parameters are set by `cu_options`, their former values are
returned in an invisible named list. Such a list can be passed as an
argument to `cu_options` to restore the parameter values. Tags are the
following:

- `baseurl`: ClickUp API base URL.

- `version`: ClickUp API version.

- `tz`: time zone.

- `useragent`: user agent.

## Details

Options are mostly for internal use and to allow API version changes in
the future.

The `tz` (time zone) option can be set globally for
[`cu_date_from()`](cu-date.md). The default value `""` means current
time zone, see [`strptime()`](https://rdrr.io/r/base/strptime.html).

## Examples

``` r
str(cu_options())
#> List of 4
#>  $ baseurl  : chr "https://api.clickup.com"
#>  $ version  : chr "v2"
#>  $ tz       : chr ""
#>  $ useragent: chr "http://github.com/psolymos/clickrup"

op <- cu_options(tz = "GMT") # save old values and set tz
cu_options()$tz              # new tz value
#> [1] "GMT"
cu_options(op)               # reset
cu_options()$tz              # default tz value
#> [1] ""
```
