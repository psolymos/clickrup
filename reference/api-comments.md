# Comments

Working with comments in ClickUp tasks.

## Usage

``` r
cu_post_task_comment(task_id, ..., cu_token = NULL)

cu_post_view_comment(view_id, ..., cu_token = NULL)

cu_post_list_comment(list_id, ..., cu_token = NULL)

cu_get_task_comments(task_id, cu_token = NULL)

cu_get_view_comments(view_id, cu_token = NULL)

cu_get_list_comments(list_id, cu_token = NULL)

cu_put_update_comment(comment_id, ..., cu_token = NULL)

cu_delete_comment(comment_id, cu_token = NULL)
```

## Arguments

- task_id:

  Task ID.

- ...:

  Named arguments to be passed to API request body, see the ClickUp API
  documentation (<https://clickup.com/api>).

- cu_token:

  ClickUp personal access token or an access token from the OAuth flow.
  The `CU_PAT` environment variable is used when `NULL`.

- view_id:

  View ID.

- list_id:

  List ID.

- comment_id:

  Comment ID.

## Value

A cu object.

## See also

[cu](cu-class.md) for the cu object class.
