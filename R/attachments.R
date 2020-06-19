## Attachments / Post Task Attachment
## POST https://api.clickup.com/api/v2/task/task_id/attachment
##
##    task_id
##    Example: 9hv.
##    String
##
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
cu_post_task_attachment <- function(task_id, attachment, filename=NULL, ...) {
    if (is.null(filename))
        filename <- basename(attachment)
    resp <- httr::POST(
        httr::modify_url(getOption("cu_options")$baseurl,
            path = .cu_path("task", task_id, "attachment")),
        httr::add_headers(
            Authorization = cu_get_pat(),
            "Content-Type" = "multipart/form-data"),
        accept_json(),
        body=list(
            filename=filename,
            attachment=httr::upload_file(attachment, ...)),
        encode="multipart",
        user_agent(getOption("cu_options")$useragent))
    cont <- .cu_process(resp)
    class(cont) <- c(class(cont), "cu_post")
    cont
}

# f <- tempfile(fileext=".png")
# png(f)
# plot(1:10, col=1:10)
# dev.off()
#
# cu_post_task_attachment("8ach57", f)
#
# unlink(f)
