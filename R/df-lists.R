
#' @rdname api-lists
NULL

#' @export
#' @rdname api-lists
cuf_create_list <- function(folder_id, ...) {
    out <- cu_create_list(folder_id, ...)
    tibblify(list(out), spec_lists)
}


#' @export
#' @rdname api-lists
cuf_create_folderless_list <- function(space_id, ...) {
    out <- cu_create_folderless_list(space_id, ...)
    tibblify(list(out), spec_lists)
}


#' @export
#' @rdname api-lists
cuf_update_list <- function(list_id, ...) {
    out <- cu_update_list(folder_id, ...)
    tibblify(list(out), spec_lists)
}


#' @export
#' @rdname api-lists
cuf_get_lists <- function(folder_id, archived=FALSE) {
    out <- cu_get_lists(folder_id, archived)
    tibblify(out$lists, spec_lists)
}


#' @export
#' @rdname api-lists
cuf_get_lists_folderless <- function(space_id, archived=FALSE) {
    out <- cu_get_lists_folderless(folder_id, archived)
    tibblify(out$lists, spec_lists)
}


#' @export
#' @rdname api-lists
cuf_get_list <- function(list_id) {
    out <- cu_get_list(list_id)
    tibblify(list(out), spec_lists)
}
