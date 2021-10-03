
#' @export
#' @rdname api-attachment


cuf_post_task_attachment <- function(task_id, attachment, filename=NULL, ...) {
    task_id <- cu_task_id(task_id)
    if (is.null(filename))
        filename <- basename(attachment)
    resp <- httr::POST(
        httr::modify_url(getOption("cu_options")$baseurl,
            path = .cu_path("task", task_id, "attachment")),
        httr::add_headers(
            Authorization = cu_get_pat(),
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

