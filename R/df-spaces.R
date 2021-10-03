#' @export
#' @rdname api-spaces
cuf_create_space <- function(team_id, name, ...) {
    out <- cu_create_space(team_id, name, ...)
    tibblify(list(out), spec_spaces)
}


#' @export
#' @rdname api-spaces
cuf_update_space <- function(space_id, ...) {
    out <- cu_update_space(team_id, name, ...)
    tibblify(list(out), spec_spaces)
}


#' @export
#' @rdname api-spaces
cuf_delete_space <- function(space_id) {
    .cu_delete("space", space_id)
}


#' @export
#' @rdname api-spaces
##GET https://api.clickup.com/api/v2/team/team_id/space?archived=false
cuf_get_spaces <- function(team_id, archived=FALSE) {
    out <- cu_get_spaces(team_id, archived)
    tibblify(out$spaces, spec_spaces)
}

#' @export
#' @rdname api-spaces
cuf_get_space <- function(space_id) {
    out <- cu_get_space(space_id)
    tibblify(list(out), spec_spaces)
}
