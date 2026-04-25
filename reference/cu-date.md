# Handling ClickUp date/time values.

`cu_date_from` turns ClickUp date/time format (Unix time in
milliseconds) to
[`POSIXct()`](https://rdrr.io/r/base/DateTimeClasses.html). `cu_date_to`
turns a POSIXct coercible date/time value back to Unix time.

## Usage

``` r
cu_date_from(ms, tz = NULL, ...)

cu_date_to(dt)
```

## Arguments

- ms:

  ClickUp date/time format, Unix time in milliseconds.

- tz:

  time zone, when `NULL` it defaults to `cu_options()$tz`.

- ...:

  Other optional arguments passed to
  [`as.POSIXct()`](https://rdrr.io/r/base/as.POSIXlt.html).

- dt:

  POSIXct coercible date/time value.

## Value

`cu_date_from` returns
[`POSIXct()`](https://rdrr.io/r/base/DateTimeClasses.html).

`cu_date_to` returns Unix time as character .

## See also

[`cu_options()`](cu-options.md) to set `tz` globally.

## Examples

``` r
if (FALSE) { # \dontrun{
task_id <- "8ach57"
due_date <- as.POSIXct("2020-12-24 21:15:49 MDT")

task <- cu_get_task(task_id)
task$due_date

cu_date_to(due_date)
task_up <- cu_update_task("8ach57", due_date=cu_date_to(due_date))

cu_date_from(task_up$due_date)
identical(cu_date_from(task_up$due_date), due_date)
} # }
```
