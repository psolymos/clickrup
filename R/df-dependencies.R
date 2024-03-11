
#' @rdname api-dependencies
NULL

#' @export
#' @rdname api-dependencies
cuf_add_dependency <- function(task_id, depends_on, dependency_of) {
    task_id <- cu_task_id(task_id)
    if (missing(depends_on) && missing(dependency_of))
        stop("Provide one of depends_on or dependency_of", call.=FALSE)
    if (!missing(depends_on) && !missing(dependency_of))
        stop("Provide only one of depends_on or dependency_of", call.=FALSE)
    if (!missing(depends_on) && missing(dependency_of))
        body <- list(depends_on=depends_on)
    if (missing(depends_on) && !missing(dependency_of))
        body <- list(dependency_of=dependency_of)
    .cu_post("task", task_id, "dependency",
        body=body)
}


#' @export
#' @rdname api-dependencies
cuf_delete_dependency <- function(task_id, depends_on, dependency_of) {
    task_id <- cu_task_id(task_id)
    if (missing(depends_on) && missing(dependency_of))
        stop("Provide one of depends_on or dependency_of", call.=FALSE)
    if (!missing(depends_on) && !missing(dependency_of))
        stop("Provide only one of depends_on or dependency_of", call.=FALSE)
    if (!missing(depends_on) && missing(dependency_of))
        query <- list(depends_on=depends_on)
    if (missing(depends_on) && !missing(dependency_of))
        query <- list(dependency_of=dependency_of)
    .cu_delete("task", task_id, "dependency",
        query=query)
}


#' @export
#' @rdname api-dependencies
cuf_add_task_link <- function(task_id, links_to) {
    task_id <- cu_task_id(task_id)
    .cu_post("task", task_id, "link", links_to)
}


#' @export
#' @rdname api-dependencies
cuf_delete_dependency <- function(task_id, links_to) {
    task_id <- cu_task_id(task_id)
    .cu_delete("task", task_id, "link", links_to)
}
