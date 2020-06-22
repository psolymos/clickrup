#' Dependencies
#'
#' Working dependencies xyz in ClickUp tasks (<https://clickup.com/api>).

#' @param task_id Task ID.
#' @param depends_on A waiting on dependency of the task.
#'   One and only one of `depends_on` or `dependency_of` must be passed.
#' @param dependency_of A blocking dependency of the task.
#'   One and only one of `depends_on` or `dependency_of` must be passed.
#' @param links_to Link to another task.
#'
#' @return
#'
#' A cu object.
#'
#' @seealso [cu-class] for the cu object class.
#'
#' @name api-dependencies
NULL

#' @export
#' @rdname api-dependencies
## Dependencies / Add Dependency
## POST https://api.clickup.com/api/v2/task/task_id/dependency
##
##     task_id
##     Example: 9hv.
##     String
##
## To create a waiting on dependency, pass the property depends_on in the body.
## To create a blocking dependency, pass the property dependency_of.
## Both can not be passed in the same request.
##
## {
##   "depends_on": "9hw"
## }
cu_add_dependency <- function(task_id, depends_on, dependency_of) {
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
## Dependencies / Delete Dependency
## DELETE https://api.clickup.com/api/v2/task/task_id/dependency?depends_on=9hz&dependency_of=9hz
##
##     task_id
##     Example: 9hv.
##     String
##
##     depends_on
##     Example: 9hz.
##     String
##
##     dependency_of
##     Example: 9hz.
##     String
##
## One and only one of depends_on or dependency_of must be passed in the
## query params.
cu_delete_dependency <- function(task_id, depends_on, dependency_of) {
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
## Dependencies / Add Task Link
## POST https://api.clickup.com/api/v2/task/task_id/link/links_to
##
##     task_id
##     Example: 9hv.
##     String
##
##     links_to
##     Example: 9hz.
##     String
cu_add_task_link <- function(task_id, links_to) {
    task_id <- cu_task_id(task_id)
    .cu_post("task", task_id, "link", links_to)
}


#' @export
#' @rdname api-dependencies
## Dependencies / Delete Task Link
## DELETE https://api.clickup.com/api/v2/task/task_id/link/links_to
##
##     task_id
##     Example: 9hv.
##     String
##
##     links_to
##     Example: 9hz.
##     String
cu_delete_dependency <- function(task_id, links_to) {
    task_id <- cu_task_id(task_id)
    .cu_delete("task", task_id, "link", links_to)
}
