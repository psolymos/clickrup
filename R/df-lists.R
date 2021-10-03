
#' @rdname api-lists
NULL

#' @export
#' @rdname api-lists
cuf_create_list <- function(folder_id, ...) {
    .cu_post("folder", folder_id, "list",
        body=list(...))
}


#' @export
#' @rdname api-lists
cuf_create_folderless_list <- function(space_id, ...) {
    .cu_post("space", space_id, "list",
        body=list(...))
}


#' @export
#' @rdname api-lists
cuf_update_list <- function(list_id, ...) {
    .cu_put("list", list_id,
        body=list(...))
}


#' @export
#' @rdname api-lists
cuf_delete_list <- function(list_id, ...) {
    .cu_delete("list", list_id)
}


#' @export
#' @rdname api-lists
cuf_get_lists <- function(folder_id, archived=FALSE) {
    .cu_get("folder", folder_id, "list",
            query = list("archived" = tolower(archived)))
}


#' @export
#' @rdname api-lists
cuf_get_lists_folderless <- function(space_id, archived=FALSE) {
    .cu_get("space", space_id, "list",
            query = list("archived" = tolower(archived)))
}


#' @export
#' @rdname api-lists
cuf_get_list <- function(list_id) {
    .cu_get("list", list_id)
}
