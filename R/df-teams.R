
#' @export
#' @rdname api-teams
cuf_get_teams <- function() {
    out <- cu_get_teams()
    tibblify(out$teams, spec_teams)
}
#cuf_get_workspaces <- cu_get_teams
