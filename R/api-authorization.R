#' Authorization
#'
#' These are the routes for authing the API and
#' going through the OAuth flow.
#' Applications utilizing the personal API token do not need these functions.

#' @param client_id Oauth app client id.
#' @param client_secret Oauth app client secret.
#' @param code Code given in redirect URL.
#' @param cu_token ClickUp personal access token or an access token from the OAuth flow.
#'   The `CU_PAT` environment variable is used when `NULL`.
#'
#' @return
#'
#' A cu object.
#'
#' @seealso [cu-class] for the cu object class.
#'
#' @name api-authorization
NULL

#' @export
#' @rdname api-authorization
## Authorization / Get Access Token
## POST https://api.clickup.com/api/v2/oauth/token?client_id=&client_secret=&code=
##    client_id
##    Oauth app client id
##    String
##
##    client_secret
##    Oauth app client secret
##    String
##
##    code
##    Code given in redirect url
##    String
cu_get_access_token <- function(client_id, client_secret, code, cu_token = NULL) {
    .cu_post("oauth", "token",
        query=list(client_id=client_id,
                   client_secret=client_secret,
                   code=code),
        cu_token = cu_token)
}


#' @export
#' @rdname api-authorization
## Authorization / Get Authorized User
## GET https://api.clickup.com/api/v2/user
cu_get_authorized_user <- function(cu_token = NULL) {
    .cu_get("user", cu_token = cu_token)
}


#' @export
#' @rdname api-authorization
## Authorization / Get Authorized Teams
## GET https://api.clickup.com/api/v2/team
##
## Note: this is the same endpoint as for cu_get_teams
##
cu_get_authorized_teams <- function(cu_token = NULL) {
    .cu_get("team", cu_token = cu_token)
}
