
#' @rdname api-views
NULL

#' @export
#' @rdname api-views
cuf_create_team_view <- function(team_id, name, ...) {
    .cu_post("team", team_id, "view",
        body=list(name=name, ...))
}


#' @export
#' @rdname api-views
cuf_create_space_view <- function(space_id, name, ...) {
    .cu_post("space", space_id, "view",
        body=list(name=name, ...))
}


#' @export
#' @rdname api-views
cuf_create_folder_view <- function(folder_id, name, ...) {
    .cu_post("folder", folder_id, "view",
        body=list(name=name, ...))
}


#' @export
#' @rdname api-views
cuf_create_list_view <- function(list_id, name, ...) {
    .cu_post("list", list_id, "view",
        body=list(name=name, ...))
}


#' @export
#' @rdname api-views
cuf_get_team_views <- function(team_id) {
    .cu_get("team", team_id, "view")
}


#' @export
#' @rdname api-views
cuf_get_space_views <- function(space_id) {
    .cu_get("space", space_id, "view")
}


#' @export
#' @rdname api-views
cuf_get_folder_views <- function(folder_id) {
    .cu_get("folder", folder_id, "view")
}


#' @export
#' @rdname api-views
cuf_get_list_views <- function(list_id) {
    .cu_get("list", list_id, "view")
}


#' @export
#' @rdname api-views
cuf_get_view <- function(view_id) {
    .cu_get("view", view_id)
}


#' @export
#' @rdname api-views
cuf_get_view_tasks <- function(view_id, page) {
    .cu_get("view", view_id, "task",
            query = list(page = page))
}


#' @export
#' @rdname api-views
cuf_update_view <- function(view_id, ...) {
    .cu_put("view", view_id,
        body=list(...))
}


#' @export
#' @rdname api-views
cuf_delete_view <- function(view_id) {
    .cu_delete("view", view_id)
}
