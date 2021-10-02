
#' @rdname api-folders
NULL

#' @export
#' @rdname api-folders
## Folders / Create Folder
## POST https://api.clickup.com/api/v2/space/space_id/folder
##
##     space_id
##     Example: 789.
##     Number
##
## Body
##
## {
##   "name": "New Folder Name"
## }
cuf_create_folder <- function(space_id, name) {
    out <- cu_create_folder(space_id, name)
    tibblify(list(out), spec_folder)
}


#' @export
#' @rdname api-folders
## Folders / Update Folder
## PUT https://api.clickup.com/api/v2/folder/folder_id
##
##     folder_id
##     Example: 457.
##     Number
##
## Body
##
## {
##   "name": "Updated Folder Name"
## }
cuf_update_folder <- function(folder_id, name) {
    out <- cu_update_folder(folder_id, name)
    tibblify(list(out), spec_folder)
}


#' @export
#' @rdname api-folders
## Folders / Get Folders
## GET https://api.clickup.com/api/v2/space/space_id/folder?archived=false
##
##    space_id
##    Example: 789.
##    Number
##
##    archived
##    Example: false.
##    Boolean
cuf_get_folders <- function(space_id, archived=FALSE) {
    out <- cu_get_folders(space_id, archived)
    tibblify(out$folders, spec_folder)
}



#' @export
#' @rdname api-folders
## Folders / Get Folder
## GET https://api.clickup.com/api/v2/folder/folder_id
##
##    folder_id
##    Example: 457.
##    Number
cuf_get_folder <- function(folder_id) {
    out <- cu_get_folder(folder_id)
    tibblify(list(out), spec_folder)
}



spec_folder <- lcols(
    id = lcol_chr("id"),
    name = lcol_chr("name"),
    orderindex = lcol_int("orderindex"),
    override_statuses = lcol_lgl("override_statuses"),
    hidden = lcol_lgl("hidden"),
    space = lcol_df(
        "space",
        id = lcol_chr("id"),
        name = lcol_chr("name")
    ),
    task_count = lcol_chr("task_count"),
    archived = lcol_lgl("archived"),
    statuses = lcol_df_lst(
        "statuses",
        id = lcol_chr("id"),
        status = lcol_chr("status"),
        type = lcol_chr("type"),
        orderindex = lcol_int("orderindex"),
        color = lcol_chr("color"),
        .default = NULL
    ),
    lists = lcol_df_lst(
        "lists",
        id = lcol_chr("id"),
        name = lcol_chr("name"),
        orderindex = lcol_int("orderindex"),
        content = lcol_chr("content", .default = NA_character_),
        status = lcol_df(
            "status",
            status = lcol_chr("status", .default = NA_character_),
            color = lcol_chr("color", .default = NA_character_),
            .default = NULL
        ),
        priority = lcol_guess("priority", .default = NULL),
        assignee = lcol_df(
            "assignee",
            color = lcol_chr("color", .default = NA_character_),
            username = lcol_chr("username", .default = NA_character_),
            initials = lcol_chr("initials", .default = NA_character_),
            profilePicture = lcol_chr("profilePicture", .default = NA_character_),
            .default = NULL
        ),
        task_count = lcol_int("task_count"),
        due_date = lcol_chr("due_date", .default = NA_character_),
        start_date = lcol_chr("start_date", .default = NA_character_),
        space = lcol_df(
            "space",
            id = lcol_chr("id"),
            name = lcol_chr("name"),
            access = lcol_lgl("access")
        ),
        archived = lcol_lgl("archived"),
        override_statuses = lcol_lgl("override_statuses", .default = NA),
        statuses = lcol_df_lst(
            "statuses",
            id = lcol_chr("id"),
            status = lcol_chr("status"),
            orderindex = lcol_int("orderindex"),
            color = lcol_chr("color"),
            type = lcol_chr("type")
        ),
        permission_level = lcol_chr("permission_level")
    ),
    permission_level = lcol_chr("permission_level")
)
