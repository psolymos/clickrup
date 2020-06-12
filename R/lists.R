## Lists -----------------------------------

cu_get_lists <- function(folder_id, archived=FALSE) {
    .cu_get("folder", folder_id, "list",
            query = list("archived" = tolower(archived)))
}

cu_get_lists_folderless <- function(space_id, archived=FALSE) {
    .cu_get("space", space_id, "list",
            query = list("archived" = tolower(archived)))
}

cu_get_list <- function(list_id) {
    .cu_get("list", list_id)
}
