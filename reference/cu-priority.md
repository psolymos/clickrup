# Turn ClickUp API priority scores to labels

The ClickUp API returns priority values as integer scores. The
`cu_priority` function maps these scores to the priority labels Urgent
(1), High (2), Normal (3), Low (4).

## Usage

``` r
cu_priority(score)
```

## Arguments

- score:

  Character or numeric values between 1 and 4.

## Value

Returns a character vector with the labels.

## Examples

``` r
cu_priority(c(1, 2, 3, 4))
#> [1] "Urgent" "High"   "Normal" "Low"   
```
