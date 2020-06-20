#' Tags
#'
#' Working with tags in ClickUp tasks.

#' @param space_id Space ID.
#' @param task_id  Task ID.
#' @param tag_name Tag name.
#' @param name Tag name.
#' @param ... Named arguments to be passed to API request body,
#'   see the ClickUp API documentation (<https://clickup.com/api>).
#'
#' @return
#'
#' A cu object.
#'
#' @seealso [cu-class] for the cu object class.
#'
#' @name api-tags
NULL

#' @export
#' @rdname api-tags
## Tags / Get Space Tags
## GET https://api.clickup.com/api/v2/space/space_id/tag
##
##    space_id
##    Example: 512.
##    Number
cu_get_space_tags <- function(space_id) {
    .cu_get("space", space_id, "tag")
}


#' @export
#' @rdname api-tags
## Tags / Create Space Tag
## POST https://api.clickup.com/api/v2/space/space_id/tag
##
##     space_id
##     Example: 512.
##     Number
##
## Body
##
## {
##   "tag": {
##     "name": "Tag Name",
##     "tag_fg": "#000000",
##     "tag_bg": "#000000"
##   }
## }
cu_create_space_tag <- function(space_id, name, ...) {
    .cu_post("space", space_id, "tag",
        body=list(
            tag=list(name=name, ...)))
}


#' @export
#' @rdname api-tags
## Tags / Edit Space Tag
## PUT https://api.clickup.com/api/v2/space/space_id/tag/tag_name
##
##     space_id
##     Example: 512.
##     Number
##
##     tag_name
##     Example: name.
##     String
cu_edit_space_tag <- function(space_id, tag_name) {
    .cu_put("space", space_id, "tag", tag_name)
}


#' @export
#' @rdname api-tags
## Tags / Delete Space Tag
## DELETE https://api.clickup.com/api/v2/space/space_id/tag/tag_name
##
##     space_id
##     Example: 512.
##     Number
##
##     tag_name
##     Example: name.
##     String
cu_delete_space_tag <- function(space_id) {
    .cu_delete("space", space_id, "tag", tag_name)
}


#' @export
#' @rdname api-tags
## Tags / Add Tag To Task
## POST https://api.clickup.com/api/v2/task/task_id/tag/tag_name
##
##     task_id
##     Example: abc.
##     String
##
##     tag_name
##     Example: name.
##     String
cu_add_tag_to_task <- function(task_id, tag_name) {
    .cu_post("task", task_id, "tag", tag_name)
}


#' @export
#' @rdname api-tags
## Tags / Remove Tag From Task
## DELETE https://api.clickup.com/api/v2/task/task_id/tag/tag_name
##
##     task_id
##     Example: abc.
##     String
##
##     tag_name
##     Example: name.
##     String
cu_delete_space_tag <- function(task_id, tag_name) {
    .cu_delete("task", task_id, "tag", tag_name)
}

