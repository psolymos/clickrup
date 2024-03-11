
#' @export
#' @rdname api-sharedhierarchy
cuf_get_shared <- function(team_id) {
    .cu_get("team", team_id, "shared")
}
