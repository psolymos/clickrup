## Tags / Get Space Tags
## GET https://api.clickup.com/api/v2/space/space_id/tag
##
##    space_id
##    Example: 512.
##    Number
cu_get_space_tags <- function(space_id) {
    .cu_get("space", space_id, "tag")
}


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

