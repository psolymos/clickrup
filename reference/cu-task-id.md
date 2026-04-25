# Handling task IDs

Task IDs are prepended with a hash when copied from the ClickUp GUI. The
function checks and removes the leading hash.

## Usage

``` r
cu_task_id(task_id)
```

## Arguments

- task_id:

  Task ID with or without a leading hash.

## Value

Returns task ID as character without leading hash to be used in the API.

## Examples

``` r

cu_task_id("#7ygh8h")
#> [1] "7ygh8h"
cu_task_id("7ygh8h")
#> [1] "7ygh8h"
```
