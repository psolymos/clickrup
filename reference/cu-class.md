# Methods for cu objects.

Calls to the ClickUp API return objects of class cu. The obejct is a
list based on the parsed JSON response from the call. The response is
stored as an attribute. Methods are defined for better printing and
coercion.

## Usage

``` r
# S3 method for class 'cu'
as.list(x, ...)

# S3 method for class 'cu'
print(x, ...)

# S3 method for class 'cu'
str(object, ...)
```

## Arguments

- x:

  An object of class cu.

- ...:

  Other optional arguments passed to methods.

- object:

  An object of class cu.

## See also

[`cu_response()`](cu-response.md) for retrieving the response attribute
from a cu object.
