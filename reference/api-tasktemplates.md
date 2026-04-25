# Task templates

Working with task templates in ClickUp tasks.

## Usage

``` r
cu_get_task_templates(team_id, page, cu_token = NULL)

cu_create_task_from_template(list_id, template_id, name, ..., cu_token = NULL)
```

## Arguments

- team_id:

  Team ID.

- page:

  Page to fetch (starts at 0). To page task templates, pass the page
  number you wish to fetch.

- cu_token:

  ClickUp personal access token or an access token from the OAuth flow.
  The `CU_PAT` environment variable is used when `NULL`.

- list_id:

  List ID.

- template_id:

  Template ID.

- name:

  Name of the task.

- ...:

  Named arguments to be passed to API request body, see the ClickUp API
  documentation (<https://clickup.com/api>).

## Value

A cu object.

## See also

[cu](cu-class.md) for the cu object class.
