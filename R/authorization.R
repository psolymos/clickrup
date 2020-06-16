## Authorization
##
## These are the routes for authing the API and
## going through the OAuth flow described above.
## Applications utilizing the personal API token can skip this section.


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
cu_get_access_token <- function(client_id, client_secret, code) {
    .cu_post("oauth", "token",
        query=list(client_id=client_id,
                   client_secret=client_secret,
                   code=code))
}


## Authorization / Get Authorized User
## GET https://api.clickup.com/api/v2/user
cu_get_authorized_user <- function() {
    .cu_get("user")
}


## Authorization / Get Authorized Teams
## GET https://api.clickup.com/api/v2/team
##
## Note: this is the same endpoint as for cu_get_teams
##
cu_get_authorized_teams <- function() {
    .cu_get("team")
}
