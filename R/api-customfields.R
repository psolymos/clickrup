#' Custom fields
#'
#' Working with custom fields in ClickUp tasks.

#' @param list_id List ID.
#' @param task_id Task ID.
#' @param field_id Field ID.
#' @param ... Named arguments to be passed to API request body.
#'   The accessible fields can be found on the task object from the
#'   [cu_get_task()] route. This is where you can retrieve the `field_id`.
#'   see the ClickUp API documentation (<https://clickup.com/api>).
#' @param cu_token ClickUp personal access token or an access token from the OAuth flow.
#'   The `CU_PAT` environment variable is used when `NULL`.
#'
#' @return
#'
#' A cu object.
#'
#' @seealso [cu-class] for the cu object class.
#'
#' @name api-customfields
NULL

#' @export
#' @rdname api-customfields
## Custom Fields / Get Accessible Custom Fields
## GET https://api.clickup.com/api/v2/list/list_id/field
##    list_id
##    Example: 123.
##    Number
cu_get_accessible_custom_fields <- function(list_id, cu_token = NULL) {
    .cu_get("list", list_id, "field", cu_token = cu_token)
}


#' @export
#' @rdname api-customfields
## Custom Fields / Set Custom Field Value
## POST https://api.clickup.com/api/v2/task/task_id/field/field_id
##
##     task_id
##     Example: 9hv.
##     String
##
##     field_id
##     b8a8-48d8-a0c6-b4200788a683 (uuid)
##     Example: b955c4dc.
##     String
##
## The accessible fields can be found on the task object from the
## get task route. This is where you can retrieve the field_id.
##
## Body
##
## {
##   "value": 80
## }
#cu_set_custom_field_value
cu_set_custom_field_value <- function(task_id, field_id, ..., cu_token = NULL) {
    task_id <- cu_task_id(task_id)
    .cu_post("task", task_id, "field", field_id,
        body=list(...),
        cu_token = cu_token)
}


#' @export
#' @rdname api-customfields
## Custom Fields / Remove Custom Field Value
## DELETE https://api.clickup.com/api/v2/task/task_id/field/field_id
##
##     task_id
##     Example: 9hv.
##     String
##
##     field_id
##     b8a8-48d8-a0c6-b4200788a683 (uuid)
##     Example: b955c4dc.
##     String
##
## The accessible fields can be found on the task object from the
## get task route. This is where you can retrieve the field_id
cu_remove_field_value <- function(task_id, field_id, cu_token = NULL) {
    task_id <- cu_task_id(task_id)
    .cu_delete("task", task_id, "field", field_id, cu_token = cu_token)
}
