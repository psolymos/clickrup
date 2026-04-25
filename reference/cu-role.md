# Turn ClickUp API role to meaningful label

The ClickUp API returns role as integer. The `cu_role` function maps
these scores to the priority labels Owner (1), Admin (2), Member (3),
Guest (4).

## Usage

``` r
cu_role(role)
```

## Arguments

- role:

  Character or numeric values between 1 and 4.

## Value

Returns a character vector with the labels.

## Examples

``` r
cu_role(c(1, 2, 3, 4))
#> [1] "Owner"  "Admin"  "Member" "Guest" 
```
