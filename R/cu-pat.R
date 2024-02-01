#' Managing ClickUp personal access token
#'
#' The ClickUp API requires a personal access token (PAT)
#' to be sent with each API request.
#' The `cu_set_pat` function uses `Sys.setenv` to set
#' the `CU_PAT` environment variable for other processes
#' called from within R or future calls to `Sys.getenv` from the same
#' R process. `cu_get_pat` is used to retrieve the PAT for the API calls.

#' @details
#'
#' To set up a ClickUp PAT, Follow this
#' [tutorial](https://docs.clickup.com/en/articles/1367130-getting-started-with-the-clickup-api):
#'
#' * sign up for ClickUp (you can use this referral [link](https://clickup.com?fp_ref=peter51) to do so, it's free),
#' * navigate to your personal *Settings*,
#' * click *Apps* in the left sidebar,
#' * click *Generate* to create your API token,
#' * click *Copy* to copy the token to your clipboard.
#'
#' Now add your ClickUp token as an environment variable:
#'
#' * open the file `.Renviron`: `file.edit("~/.Renviron")`,
#' * add a line with `CU_PAT="your_token"` to the `.Renviron` file and save it,
#' * check with `Sys.getenv("CU_PAT")`, it should return the token.
#'
#' @param token ClickUp personal access token or an access token from the OAuth flow.
#'   The `CU_PAT` environment variable is used when `NULL`.
#'
#' @return
#'
#' `cu_set_pat` returns logical similarly to [Sys.setenv()].
#'
#' `cu_get_pat` returns the ClickUp PAT that will look something like
#' `pk_4753994_EXP7MPOJ7XQM5UJDV2M45MPF0YHH5YHO`.
#' When `token` is not `NULL` it will simply pass through the token value
#' and not look for the `CU_PAT` environment variable.
#'
#' @seealso [Sys.setenv()] and [Sys.getenv()]
#'
#' @name cu-pat
#'
#'
NULL

#' @export
#' @rdname cu-pat
cu_get_pat <- function(token = NULL) {
    if (!is.null(token))
        return(invisible(token))
    pat <- Sys.getenv("CU_PAT")
    if (identical(pat, ""))
        stop("Set CU_PAT env var as your ClickUp personal access token",
            call. = FALSE)
    invisible(pat)
}

#' @export
#' @rdname cu-pat
cu_set_pat <- function(token) {
    Sys.setenv(CU_PAT=token)
}
