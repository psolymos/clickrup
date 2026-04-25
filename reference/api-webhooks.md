# Webhooks

Working with webhooks in ClickUp tasks.

## Usage

``` r
cu_create_webhook(team_id, endpoint, events = "*", ..., cu_token = NULL)

cu_update_webhook(webhook_id, ..., cu_token = NULL)

cu_delete_webhook(webhook_id, cu_token = NULL)

cu_get_webhooks(team_id, cu_token = NULL)
```

## Arguments

- team_id:

  Team ID.

- endpoint:

  Webhook endpoint.

- events:

  Events (see Details).

- ...:

  Named arguments to be passed to API request body, e.g. `"endpoint"`,
  `"events"`, or `"status"`, see the ClickUp API documentation
  (<https://clickup.com/api>).

- cu_token:

  ClickUp personal access token or an access token from the OAuth flow.
  The `CU_PAT` environment variable is used when `NULL`.

- webhook_id:

  Webhook ID.

## Value

A cu object.

## Details

You may filter the location of resources that get sent to a webhook by
passing an optional `space_id`, `folder_id`, `list_id`, or `task_id` in
the body of the request. Without specifying any events, all event types
will be sent to the webhook. However, you can filter for specific
actions by sending an events array. To subscribe to specific events,
pass an array of events that you want to subscribe to, otherwise pass
`"*"` to subscribe to everything.

Events include: `"taskCreated"` `"taskUpdated"` `"taskDeleted"`
`"listCreated"` `"listUpdated"` `"listDeleted"` `"folderCreated"`
`"folderUpdated"` `"folderDeleted"` `"spaceCreated"` `"spaceUpdated"`
`"spaceDeleted"` `"goalCreated"` `"goalUpdated"` `"goalDeleted"`
`"keyResultCreated"` `"keyResultUpdated"` `"keyResultDeleted"`.

## See also

[cu](cu-class.md) for the cu object class.
[`cu_task_id()`](cu-task-id.md) to remove leading hashes from task IDs.
