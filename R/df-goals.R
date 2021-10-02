#' Goals
#'
#' Working with goals in ClickUp tasks.

#' @param team_id Team ID.
#' @param goal_id Goal ID.
#' @param key_result_id Key result ID.
#' @param ... Named arguments to be passed to API request body,
#'   see the ClickUp API documentation (<https://clickup.com/api>).
#'
#' @return
#'
#' A cu object.
#'
#' @seealso [cu-class] for the cu object class.
#'
#' @name api-goals
NULL

#' @export
#' @rdname api-goals
## Goals / Create Goal
## POST https://api.clickup.com/api/v2/team/team_id/goal
##
##    team_id
##    Example: 512.
##    Number
##
## Body
##
## {
##   "name": "Goal Name",
##   "due_date": 1568036964079,
##   "description": "Goal Description",
##   "multiple_owners": true,
##   "owners": [
##     183
##   ],
##   "color": "#32a852"
## }
cuf_create_goal <- function(team_id, ...) {
    .cu_post("team", team_id, "goal",
        body=list(...))
}


#' @export
#' @rdname api-goals
## Goals / Update Goal
## PUT https://api.clickup.com/api/v2/goal/goal_id
##
##     goal_id
##     900e-462d-a849-4a216b06d930 (uuid)
##     Example: e53a033c.
##     String
##
## Body
##
## {
##     "name": "Updated Goal Name",
##     "due_date": 1568036964079,
##     "description": "Updated Goal Description",
##     "rem_owners": [183],
##     "add_owners": [182]
##     "color": "#32a852"
## }
cuf_update_goal <- function(goal_id, ...) {
    .cu_put("goal", goal_id,
        body=list(...))
}


#' @export
#' @rdname api-goals
## Goals / Delete Goal
## DELETE https://api.clickup.com/api/v2/goal/goal_id
##
##     goal_id
##     900e-462d-a849-4a216b06d930 (uuid)
##     Example: e53a033c.
##     String
cuf_delete_goal <- function(goal_id) {
    .cu_delete("goal", goal_id)
}


#' @export
#' @rdname api-goals
## Goals / Get Goals
## GET https://api.clickup.com/api/v2/team/team_id/goal
##
##     team_id
##     Example: 512.
##     Number
cuf_get_goals <- function(team_id) {
    .cu_get("team", team_id, "goal")
}


#' @export
#' @rdname api-goals
## Goals / Get Goal
## GET https://api.clickup.com/api/v2/goal/goal_id
##
##     goal_id
##     900e-462d-a849-4a216b06d930 (uuid)
##     Example: e53a033c.
##     String
cuf_get_goal <- function(goal_id) {
    .cu_get("goal", goal_id)
}


#' @export
#' @rdname api-goals
## Goals / Create Key Result
## POST https://api.clickup.com/api/v2/goal/goal_id/key_result
##
##     goal_id
##     900e-462d-a849-4a216b06d930 (uuid)
##     Example: e53a033c.
##     String
##
## Key result types can be number, currency, boolean, percentage,
## or automatic. The task ID's array and list ID's array can be used
## to attach resources to the goal.
##
## Body
##
## {
##   "name": "New Key Result Name",
##   "owners": [
##     183
##   ],
##   "type": "number",
##   "steps_start": 0,
##   "steps_end": 10,
##   "unit": "km",
##   "task_ids": [],
##   "list_ids": []
## }
cuf_create_key_result <- function(goal_id, ...) {
    .cu_post("goal", goal_id, "key_result",
        body=list(...))
}


#' @export
#' @rdname api-goals
## Goals / Edit Key Result
## PUT https://api.clickup.com/api/v2/key_result/key_result_id
##
##     key_result_id
##     8480-49bc-8c57-e569747efe93 (uuid)
##     Example: 947d46ed.
##     String
##
## All properties available in the create key result route may
## also be used along with the additional properties below.
##
## Body
##
## {
##   "steps_current": 5,
##   "note": "Target achieved"
## }
cuf_edit_key_result <- function(key_result_id, ...) {
    .cu_put("key_result", key_result_id,
        body=list(...))
}


#' @export
#' @rdname api-goals
## Goals / Delete Key Result
## DELETE https://api.clickup.com/api/v2/key_result/key_result_id
##
##     key_result_id
##     8480-49bc-8c57-e569747efe93 (uuid)
##     Example: 947d46ed.
##     String
cuf_delete_key_result <- function(key_result_id) {
    .cu_delete("key_result", key_result_id)
}


