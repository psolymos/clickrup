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
cu_add_dependency <- function(task_id, ...) {
    .cu_post("task", task_id, "dependency",
        body=list(...))
}


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
cu_delete_dependency <- function(task_id, field_id,
    depends_on, dependency_of) {
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
    .cu_post("task", task_id, "link", links_to)
}


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
    .cu_delete("task", task_id, "link", links_to)
}
