
#' @rdname api-webhooks
NULL

#' @export
#' @rdname api-webhooks
cuf_create_webhook <- function(team_id, endpoint, events="*", ...) {
    .cu_post("team", team_id, "webhook",
        body=list(endpoint=endpoint, events=events),
        query=list(...))
}


#' @export
#' @rdname api-webhooks
cuf_update_webhook <- function(webhook_id, ...) {
    .cu_put("webhook", webhook_id,
        body=list(...))
}


#' @export
#' @rdname api-webhooks
cuf_delete_webhook <- function(webhook_id) {
    .cu_delete("webhook", webhook_id)
}


#' @export
#' @rdname api-webhooks
cuf_get_webhooks <- function(team_id) {
  .cu_get("team", team_id, "webhook")
}
