
#' @rdname api-authorization
NULL

#' @export
#' @rdname api-authorization
cuf_get_access_token <- function(client_id, client_secret, code) {
    .cu_post("oauth", "token",
        query=list(client_id=client_id,
                   client_secret=client_secret,
                   code=code))
}


#' @export
#' @rdname api-authorization
cuf_get_authorized_user <- function() {
    .cu_get("user")
}


#' @export
#' @rdname api-authorization
cuf_get_authorized_teams <- function() {
    .cu_get("team")
}
