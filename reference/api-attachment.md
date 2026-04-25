# Attachments

Result from a call to the API endpoint POST
https://api.clickup.com/api/v2/task/task_id/attachment

## Usage

``` r
cu_post_task_attachment(
  task_id,
  attachment,
  filename = NULL,
  ...,
  cu_token = NULL
)
```

## Arguments

- task_id:

  Task ID.

- attachment:

  Path to a file.

- filename:

  File name as it will show up in CluckUp, deduced from `attachment`
  when not provided (`NULL`).

- ...:

  Can be used to pass mime `type` argument to
  [`httr::upload_file()`](https://httr.r-lib.org/reference/upload_file.html),
  mime type is guessed otherwise.

- cu_token:

  ClickUp personal access token or an access token from the OAuth flow.
  The `CU_PAT` environment variable is used when `NULL`.

## Value

A cu object.

## See also

[cu](cu-class.md) for the cu object class.

## Examples

``` r
if (FALSE) { # \dontrun{
## produce a png image
f <- tempfile(fileext=".png")
png(f)
plot(1:10, col=1:10)
dev.off()

## attache the image to a task
cu_post_task_attachment("8ach57", f)

unlink(f) # clean up the image
} # }
```
