#' Webhooks
#'
#' Working with webhooks in ClickUp tasks.

#' @details
#' You may filter the location of resources that get sent to a webhook
#' by passing an optional `space_id`, `folder_id`, `list_id`, or
#' `task_id` in the body of the request.
#' Without specifying any events, all event types
#' will be sent to the webhook. However, you can filter for specific
#' actions by sending an events array. To subscribe to specific events,
#' pass an array of events that you want to subscribe to,
#' otherwise pass `"*"` to subscribe to everything.
#'
#' Events include: `"taskCreated"`
#'     `"taskUpdated"`
#'     `"taskDeleted"`
#'     `"listCreated"`
#'     `"listUpdated"`
#'     `"listDeleted"`
#'     `"folderCreated"`
#'     `"folderUpdated"`
#'     `"folderDeleted"`
#'     `"spaceCreated"`
#'     `"spaceUpdated"`
#'     `"spaceDeleted"`
#'     `"goalCreated"`
#'     `"goalUpdated"`
#'     `"goalDeleted"`
#'     `"keyResultCreated"`
#'     `"keyResultUpdated"`
#'     `"keyResultDeleted"`.
#'
#' @param team_id Team ID.
#' @param endpoint Webhook endpoint.
#' @param events Events (see Details).
#' @param webhook_id Webhook ID.
#' @param ... Named arguments to be passed to API request body,
#'   e.g. `"endpoint"`, `"events"`, or `"status"`,
#'   see the ClickUp API documentation (<https://clickup.com/api>).
#' @param cu_token ClickUp personal access token or an access token from the OAuth flow.
#'   The `CU_PAT` environment variable is used when `NULL`.
#'
#' @return
#'
#' A cu object.
#'
#' @seealso [cu-class] for the cu object class. [cu_task_id()] to remove leading hashes from task IDs.
#'
#' @name api-webhooks
NULL

#' @export
#' @rdname api-webhooks
## Webhooks / Create Webhook
## POST https://api.clickup.com/api/v2/team/team_id/webhook
##
##     team_id
##     Example: 512.
##     Number
##
## You may filter the location of resources that get sent to a webhook
## by passing an optional space_id, folder_id, list_id, or task_id in the
## body of the request. Without specifying any events, all event types
## will be sent to the webhook. However, you can filter for specific
## actions by sending an events array. To subscribe to specific events,
## pass an array of events that you want to subscribe to,
## otherwise pass "*" to subscribe to everything.
##
## Body
##
## {
##   "endpoint": "https://yourdomain.com/webhook",
##   "events": [
##     "taskCreated",
##     "taskUpdated",
##     "taskDeleted",
##     "listCreated",
##     "listUpdated",
##     "listDeleted",
##     "folderCreated",
##     "folderUpdated",
##     "folderDeleted",
##     "spaceCreated",
##     "spaceUpdated",
##     "spaceDeleted",
##     "goalCreated",
##     "goalUpdated",
##     "goalDeleted",
##     "keyResultCreated",
##     "keyResultUpdated",
##     "keyResultDeleted"
##   ]
## }
##
## ... passes query params for optional filtering
## for space_id, folder_id, list_id, or task_id
cu_create_webhook <- function(team_id, endpoint, events="*", ..., cu_token = NULL) {
    .cu_post("team", team_id, "webhook",
        body=list(endpoint=endpoint, events=events),
        query=list(...), cu_token = cu_token)
}


#' @export
#' @rdname api-webhooks
## Webhooks / Update Webhook
## PUT https://api.clickup.com/api/v2/webhook/webhook_id
##
##     webhook_id
##     e506-4a29-9d42-26e504e3435e (uuid)
##     Example: 4b67ac88.
##     String
##
## To subscribe to specific events, pass an array of events that
## you want to subscribe to, otherwise pass "*" to subscribe to everything.
##
## Body
##
## {
##   "endpoint": "https://yourdomain.com/webhook",
##   "events": "*",
##   "status": "active"
## }
## ... passes props to body
cu_update_webhook <- function(webhook_id, ..., cu_token = NULL) {
    .cu_put("webhook", webhook_id,
        body=list(...), cu_token = cu_token)
}


#' @export
#' @rdname api-webhooks
## Webhooks / Delete Webhook
## DELETE https://api.clickup.com/api/v2/webhook/webhook_id
##
##     webhook_id
##     e506-4a29-9d42-26e504e3435e (uuid)
##     Example: 4b67ac88.
##     String
cu_delete_webhook <- function(webhook_id, cu_token = NULL) {
    .cu_delete("webhook", webhook_id, cu_token = cu_token)
}


#' @export
#' @rdname api-webhooks
## Webhooks / Get Webhooks
## GET https://api.clickup.com/api/v2/team/team_id/webhook
##
##     team_id
##     Example: 512.
##     Number
cu_get_webhooks <- function(team_id, cu_token = NULL) {
  .cu_get("team", team_id, "webhook", cu_token = cu_token)
}
