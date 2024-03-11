
#' @export
#' @rdname api-teams
cuf_get_teams <- function(cu_token = NULL) {
    out <- cu_get_teams(cu_token = cu_token)
    tibblify(out$teams, spec_teams)
}
#cuf_get_workspaces <- cu_get_teams
