#' Attachments
#'
#' Result from a call to the API endpoint
#' POST https://api.clickup.com/api/v2/task/task_id/attachment

#' @param task_id Task ID.
#' @param attachment Path to a file.
#' @param filename File name as it will show up in CluckUp,
#'   deduced from `attachment` when not provided (`NULL`).
#' @param ... Can be used to pass mime `type` argument to [httr::upload_file()],
#'   mime type is guessed otherwise.
#' @param cu_token ClickUp personal access token or an access token from the OAuth flow.
#'   The `CU_PAT` environment variable is used when `NULL`.
#'
#' @examples
#' \dontrun{
#' ## produce a png image
#' f <- tempfile(fileext=".png")
#' png(f)
#' plot(1:10, col=1:10)
#' dev.off()
#'
#' ## attache the image to a task
#' cu_post_task_attachment("8ach57", f)
#'
#' unlink(f) # clean up the image
#' }
#'
#' @return
#'
#' A cu object.
#'
#' @seealso [cu-class] for the cu object class.
#'
#' @export
#' @name api-attachment

## API documentation is actually incorrect about showing the curl request.
## The correct curl is this:
##
## curl --location \
##   --request POST 'https://api.clickup.com/api/v2/task/task_id/attachment' \
##   --header 'Authorization: pk_xx_xxx' \
##   --header 'Content-Type: multipart/form-data' \
##   --form 'filename=imagefilename.png' \
##   --form 'attachment=@/path/to/the/file/example.png'

## ... can be used to pass type argument to httr::upload_file
cu_post_task_attachment <- function(task_id, attachment, filename=NULL, ..., cu_token = NULL) {
    task_id <- cu_task_id(task_id)
    if (is.null(filename))
        filename <- basename(attachment)
    resp <- httr::POST(
        httr::modify_url(getOption("cu_options")$baseurl,
            path = .cu_path("task", task_id, "attachment")),
        httr::add_headers(
            Authorization = cu_get_pat(token = cu_token),
            "Content-Type" = "multipart/form-data"),
        httr::accept_json(),
        body=list(
            filename=filename,
            attachment=httr::upload_file(attachment, ...)),
        encode="multipart",
        httr::user_agent(getOption("cu_options")$useragent))
    cont <- .cu_process(resp)
    class(cont) <- c(class(cont), "cu_post")
    cont
}

