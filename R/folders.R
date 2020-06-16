## Folders / Create Folder
## POST https://api.clickup.com/api/v2/space/space_id/folder
##
##     space_id
##     Example: 789.
##     Number
##
## Body
##
## {
##   "name": "New Folder Name"
## }
cu_create_folder <- function(space_id, name) {
    .cu_post("space", space_id, "folder",
        body=list(name=name))
}


## Folders / Update Folder
## PUT https://api.clickup.com/api/v2/folder/folder_id
##
##     folder_id
##     Example: 457.
##     Number
##
## Body
##
## {
##   "name": "Updated Folder Name"
## }
cu_update_folder <- function(space_id, name) {
    .cu_put("folder", folder_id,
        body=list(name=name))
}


## Folders / Delete Folder
## DELETE https://api.clickup.com/api/v2/folder/folder_id
##
##     folder_id
##     Example: 457.
##     Number
cu_delete_folder <- function(space_id, name) {
    .cu_delete("folder", folder_id)
}


## Folders / Get Folders
## GET https://api.clickup.com/api/v2/space/space_id/folder?archived=false
##
##    space_id
##    Example: 789.
##    Number
##
##    archived
##    Example: false.
##    Boolean
cu_get_folders <- function(space_id, archived=FALSE) {
    .cu_get("space", space_id, "folder",
            query = list("archived" = tolower(archived)))
}


## Folders / Get Folder
## GET https://api.clickup.com/api/v2/folder/folder_id
##
##    folder_id
##    Example: 457.
##    Number
cu_get_folder <- function(folder_id) {
    .cu_get("folder", folder_id)
}
