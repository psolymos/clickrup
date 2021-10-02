#' Views
#'
#' Working views in ClickUp tasks.

#' @param team_id Team (workspace) ID.
#' @param name View name.
#' @param space_id Space ID.
#' @param folder_id Folder ID.
#' @param list_id List ID.
#' @param view_id View ID.
#' @param page Page to fetch (starts at 0).
#' @param ... Named arguments to be passed to API request body,
#'   see the ClickUp API documentation (<https://clickup.com/api>).
#'
#' @return
#'
#' A cu object.
#'
#' @seealso [cu-class] for the cu object class.
#'
#' @name api-views
NULL

#' @export
#' @rdname api-views
## Views / Create Team View
## POST https://api.clickup.com/api/v2/team/team_id/view
##
##     team_id
##     Example: 512.
##     Number
##
## Body
##
## {
##   "name": "New Team View Name",
##   "type": "list",
##   "grouping": {
##     "field": "status",
##     "dir": 1,
##     "collapsed": [],
##     "ignore": false
##   },
##   "divide": {
##     "field": null,
##     "dir": null,
##     "collapsed": []
##   },
##   "sorting": {
##     "fields": []
##   },
##   "filters": {
##     "op": "AND",
##     "fields": [],
##     "search": "",
##     "show_closed": false
##   },
##   "columns": {
##     "fields": []
##   },
##   "team_sidebar": {
##     "assignees": [],
##     "assigned_comments": false,
##     "unassigned_tasks": false
##   },
##   "settings": {
##     "show_task_locations": false,
##     "show_subtasks": 3,
##     "show_subtask_parent_names": false,
##     "show_closed_subtasks": false,
##     "show_assignees": true,
##     "show_images": true,
##     "collapse_empty_columns": null,
##     "me_comments": true,
##     "me_subtasks": true,
##     "me_checklists": true
##   }
## }
cu_create_team_view <- function(team_id, name, ...) {
    .cu_post("team", team_id, "view",
        body=list(name=name, ...))
}


#' @export
#' @rdname api-views
## Views / Create Space View
## POST https://api.clickup.com/api/v2/space/space_id/view
##
##     space_id
##     Example: 790.
##     Number
##
## Body
##
## {
##     "name": "New Space View Name",
##     "type": "list",
##     "grouping": {
##       "field": "status",
##       "dir": 1,
##       "collapsed": [],
##       "ignore": false
##     },
##   "divide": {
##       "field": null,
##       "dir": null,
##       "collapsed": []
##     },
##     "sorting": {
##       "fields": []
##     },
##     "filters": {
##       "op": "AND",
##       "fields": [],
##       "search": "",
##       "show_closed": false
##     },
##     "columns": {
##       "fields": []
##     },
##     "team_sidebar": {
##       "assignees": [],
##       "assigned_comments": false,
##       "unassigned_tasks": false
##     },
##     "settings": {
##       "show_task_locations": false,
##       "show_subtasks": 3,
##       "show_subtask_parent_names": false,
##       "show_closed_subtasks": false,
##       "show_assignees": true,
##       "show_images": true,
##       "collapse_empty_columns": null,
##       "me_comments": true,
##       "me_subtasks": true,
##       "me_checklists": true
##     }
## }
cu_create_space_view <- function(space_id, name, ...) {
    .cu_post("space", space_id, "view",
        body=list(name=name, ...))
}


#' @export
#' @rdname api-views
## Views / Create Folder View
## POST https://api.clickup.com/api/v2/folder/folder_id/view
##
##    folder_id
##    Example: 457.
##    Number
##
## Body
##
## {
##   "name": "New Folder View Name",
##   "type": "list",
##   "grouping": {
##     "field": "status",
##     "dir": 1,
##     "collapsed": [],
##     "ignore": false
##   },
##   "divide": {
##     "field": null,
##     "dir": null,
##     "collapsed": []
##   },
##   "sorting": {
##     "fields": []
##   },
##   "filters": {
##     "op": "AND",
##     "fields": [],
##     "search": "",
##     "show_closed": false
##   },
##   "columns": {
##     "fields": []
##   },
##   "team_sidebar": {
##     "assignees": [],
##     "assigned_comments": false,
##     "unassigned_tasks": false
##   },
##   "settings": {
##     "show_task_locations": false,
##     "show_subtasks": 3,
##     "show_subtask_parent_names": false,
##     "show_closed_subtasks": false,
##     "show_assignees": true,
##     "show_images": true,
##     "collapse_empty_columns": null,
##     "me_comments": true,
##     "me_subtasks": true,
##     "me_checklists": true
##   }
## }
cu_create_folder_view <- function(folder_id, name, ...) {
    .cu_post("folder", folder_id, "view",
        body=list(name=name, ...))
}


#' @export
#' @rdname api-views
## Views / Create List View
## POST https://api.clickup.com/api/v2/list/list_id/view
##
##     list_id
##     Example: 124.
##     Number
##
## Body
##
## {
##   "name": "New List View Name",
##   "type": "list",
##   "grouping": {
##     "field": "status",
##     "dir": 1,
##     "collapsed": [],
##     "ignore": false
##   },
##   "divide": {
##     "field": null,
##     "dir": null,
##     "collapsed": []
##   },
##   "sorting": {
##     "fields": []
##   },
##   "filters": {
##     "op": "AND",
##     "fields": [],
##     "search": "",
##     "show_closed": false
##   },
##   "columns": {
##     "fields": []
##   },
##   "team_sidebar": {
##     "assignees": [],
##     "assigned_comments": false,
##     "unassigned_tasks": false
##   },
##   "settings": {
##     "show_task_locations": false,
##     "show_subtasks": 3,
##     "show_subtask_parent_names": false,
##     "show_closed_subtasks": false,
##     "show_assignees": true,
##     "show_images": true,
##     "collapse_empty_columns": null,
##     "me_comments": true,
##     "me_subtasks": true,
##     "me_checklists": true
##   }
## }
cu_create_list_view <- function(list_id, name, ...) {
    .cu_post("list", list_id, "view",
        body=list(name=name, ...))
}


#' @export
#' @rdname api-views
## Views / Get Team Views
## GET https://api.clickup.com/api/v2/team/team_id/view
##
##     team_id
##     Example: 512.
##     Number
cu_get_team_views <- function(team_id) {
    .cu_get("team", team_id, "view")
}


#' @export
#' @rdname api-views
## Views / Get Space Views
## GET https://api.clickup.com/api/v2/space/space_id/view
##
##    space_id
##    Example: 790.
##    Number
cu_get_space_views <- function(space_id) {
    .cu_get("space", space_id, "view")
}


#' @export
#' @rdname api-views
## Views / Get Folder Views
## GET https://api.clickup.com/api/v2/folder/folder_id/view
##
##    folder_id
##    Example: 457.
##    Number
cu_get_folder_views <- function(folder_id) {
    .cu_get("folder", folder_id, "view")
}


#' @export
#' @rdname api-views
## Views / Get List Views
## GET https://api.clickup.com/api/v2/list/list_id/view
##
##     list_id
##     Example: 124.
##     Number
cu_get_list_views <- function(list_id) {
    .cu_get("list", list_id, "view")
}


#' @export
#' @rdname api-views
## Views / Get View
## GET https://api.clickup.com/api/v2/view/view_id
##
##    view_id
##    105 (string)
##    Example: 3c.
##    String
cu_get_view <- function(view_id) {
    .cu_get("view", view_id)
}


#' @export
#' @rdname api-views
## Views / Get View Tasks
## GEThttps://api.clickup.com/api/v2/view/view_id/task?page=0
##
##     view_id
##     105 (string)
##     Example: 3c.
##     String
##
##     page
##     Example: 0.
##     Integer
##
## To page the tasks returned, include the page param
cu_get_view_tasks <- function(view_id, page) {
    .cu_get("view", view_id, "task",
            query = list(page = page))
}


#' @export
#' @rdname api-views
## Views / Update View
## PUT https://api.clickup.com/api/v2/view/view_id
##
##    view_id
##    105 (string)
##    Example: 3c.
##    String
##
## Body
##
## {
##   "name": "New View Name",
##   "type": "list",
##   "parent": {
##     "id": "512",
##     "type": 7
##   },
##   "grouping": {
##     "field": "status",
##     "dir": 1,
##     "collapsed": [],
##     "ignore": false
##   },
##   "divide": {
##     "field": null,
##     "dir": null,
##     "collapsed": []
##   },
##   "sorting": {
##     "fields": []
##   },
##   "filters": {
##     "op": "AND",
##     "fields": [],
##     "search": "",
##     "show_closed": false
##   },
##   "columns": {
##     "fields": []
##   },
##   "team_sidebar": {
##     "assignees": [],
##     "assigned_comments": false,
##     "unassigned_tasks": false
##   },
##   "settings": {
##     "show_task_locations": false,
##     "show_subtasks": 3,
##     "show_subtask_parent_names": false,
##     "show_closed_subtasks": false,
##     "show_assignees": true,
##     "show_images": true,
##     "collapse_empty_columns": null,
##     "me_comments": true,
##     "me_subtasks": true,
##     "me_checklists": true
##   }
## }
## Views / Update View
## PUT https://api.clickup.com/api/v2/view/view_id
cu_update_view <- function(view_id, ...) {
    .cu_put("view", view_id,
        body=list(...))
}


#' @export
#' @rdname api-views
## Views / Delete View
## DELETE https://api.clickup.com/api/v2/view/view_id
##
##     view_id
##     105 (string)
##     Example: 3c.
##     String
cu_delete_view <- function(view_id) {
    .cu_delete("view", view_id)
}
