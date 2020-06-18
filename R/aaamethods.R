## Methods

## turns cu object into a list
as.list.cu <- function(x, ...) {
    attr(x, "response") <- NULL
    unclass(x)
}

## print without response attribute
print.cu <- function(x, ...) {
    print(as.list(x), ...)
    invisible(x)
}

## str without the response attribute
str.cu <- function(x, ...) {
    str(as.list(x), ...)
    invisible(x)
}
