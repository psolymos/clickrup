## Folders ------------------------------------

cu_get_folders <- function(space_id, archived=FALSE) {
    .cu_get("space", space_id, "folder",
            query = list("archived" = tolower(archived)))
}

cu_get_folder <- function(folder_id) {
    .cu_get("folder", folder_id)
}
