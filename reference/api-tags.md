# Tags

Working with tags in ClickUp tasks.

## Usage

``` r
cu_get_space_tags(space_id, cu_token = NULL)

cu_create_space_tag(space_id, name, ..., cu_token = NULL)

cu_edit_space_tag(space_id, tag_name, cu_token = NULL)

cu_delete_space_tag(task_id, tag_name, cu_token = NULL)

cu_add_tag_to_task(task_id, tag_name, cu_token = NULL)

cu_delete_space_tag(task_id, tag_name, cu_token = NULL)
```

## Arguments

- space_id:

  Space ID.

- cu_token:

  ClickUp personal access token or an access token from the OAuth flow.
  The `CU_PAT` environment variable is used when `NULL`.

- name:

  Tag name.

- ...:

  Named arguments to be passed to API request body, see the ClickUp API
  documentation (<https://clickup.com/api>).

- tag_name:

  Tag name.

- task_id:

  Task ID.

## Value

A cu object.

## See also

[cu](cu-class.md) for the cu object class.
