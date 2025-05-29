
#' @rdname api-folders
NULL

#' @export
#' @rdname api-folders
cuf_create_folder <- function(space_id, name, cu_token = NULL) {
    out <- cu_create_folder(space_id, name, cu_token = cu_token)
    tibblify(list(out), spec_folders)
}


#' @export
#' @rdname api-folders
cuf_update_folder <- function(folder_id, name, cu_token = NULL) {
    out <- cu_update_folder(folder_id, name, cu_token = cu_token)
    tibblify(list(out), spec_folders)
}


#' @export
#' @rdname api-folders
cuf_delete_folder <- function(folder_id, name) {
    .cu_delete("folder", folder_id)
}


#' @export
#' @rdname api-folders
cuf_get_folders <- function(space_id, archived=FALSE, cu_token = NULL) {
    out <- cu_get_folders(space_id, archived, cu_token = cu_token)
    tibblify(out$folders, spec_folders)
}



#' @export
#' @rdname api-folders
cuf_get_folder <- function(folder_id, cu_token = NULL) {
    out <- cu_get_folder(folder_id, cu_token = cu_token)
    tibblify(list(out), spec_folders)
}
