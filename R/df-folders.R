
#' @rdname api-folders
NULL

#' @export
#' @rdname api-folders
cuf_create_folder <- function(space_id, name) {
    out <- cu_create_folder(space_id, name)
    tibblify(list(out), spec_folder)
}


#' @export
#' @rdname api-folders
cuf_update_folder <- function(folder_id, name) {
    out <- cu_update_folder(folder_id, name)
    tibblify(list(out), spec_folder)
}


#' @export
#' @rdname api-folders
cuf_get_folders <- function(space_id, archived=FALSE) {
    out <- cu_get_folders(space_id, archived)
    tibblify(out$folders, spec_folder)
}



#' @export
#' @rdname api-folders
cuf_get_folder <- function(folder_id) {
    out <- cu_get_folder(folder_id)
    tibblify(list(out), spec_folder)
}
