## Authorization / Get Access Token

## These are the routes for authing the API and
## going through the OAuth flow described above.
## Applications utilizing the personal API token can skip this section.

## R PKG STATUS: not yet implemented

## POST https://api.clickup.com/api/v2/oauth/token?client_id=&client_secret=&code=
##     client_id    Oauth app client id    String
##    client_secret    Oauth app client secret    String
##    code    Code given in redirect url    String

## Authorization / Get Authorized User
## GET https://api.clickup.com/api/v2/user

## Authorization / Get Authorized Teams
## GET https://api.clickup.com/api/v2/team
