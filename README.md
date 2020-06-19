# clickrup <img src="https://raw.githubusercontent.com/psolymos/clickrup/master/inst/images/clickrup.jpg" align="right" style="padding-left:10px;background-color:white;" width="200px" />

> Interacting with the ClickUp v2 API from R

[ClickUp](https://clickup.com/?noRedirect=true) is a cloud-based
collaboration and project management tool. Features include tasks, docs,
chat, goals, and [more](https://clickup.com/features).

The {clickrup} R package wraps the ClickUp [API
v2](https://clickup.com/api). See the
[roadmap](https://github.com/psolymos/clickrup/issues/1) for what is
currently included in the package.

## Setup

Install the {clickrup} package:

``` r
remotes::install_github("psolymos/clickrup")
```

Follow this
[tutorial](https://docs.clickup.com/en/articles/1367130-getting-started-with-the-clickup-api):

  - sign up for ClickUp (you can use this referral
    [link](https://clickup.com?fp_ref=peter51) to do so, it’s free),
  - navigate to your personal *Settings*,
  - click *Apps* in the left sidebar,
  - click *Generate* to create your API token,
  - click *Copy* to copy the token to your clipboard.

Now add your ClickUp token as an environment variable:

  - open the file `.Renviron`: `file.edit("~/.Renviron")`,
  - add a line with `CU_PAT="your_token"` to the `.Renviron` file and
    save it,
  - check with `Sys.getenv("CU_PAT")`, it should return the token.

The ClickUp token will look something like
`pk_4753994_EXP7MPOJ7XQM5UJDV2M45MPF0YHH5YHO`.

The `cu_set_pat` function uses `Sys.setenv` to set the `CU_PAT`
environment variable for other processes called from within R or future
calls to `Sys.getenv` from the same R process.

## API endpoints

The first step you want to do is to get the IDs for your workspaces
(teams is the legacy term for this in the API):

If your setup was successful, `cu_get_teams()` should return a list with
the workspace IDs and names.

The easiest way to get going with the various endpoints is to browse the
[API v2 documentation](https://clickup.com/api). Once you found what you
are after, just look at the API heading. There is **Get Teams**, the R
function is prepended with `cu_` (to facilitate RStudio suggestions),
then comes the heading in lower case and spaces replaced by underscores.
For example **Get Filtered Team Tasks** will be
`cu_get_filtered_team_tasks()`.

Function arguments are the *Parameters* listed on the API page, `...`
passes optional parameters, query parameters, or elements for the body.

## Examples

Load the package and set the access token if it is not already set.
`cu_get_pat()` returns the token invisibly, so it doesn’t end up in
logs.

``` r
library(clickrup)
#> Loading required package: httr
#> clickrup 0.0.1    2020-06-10
cu_get_pat() # returns PAT invisibly
```

### ClikUp hierarchy

The [ClickUp
hierarchy](https://docs.clickup.com/en/articles/1045623-how-does-the-hierarchy-structure-work-in-clickup)
includes the following levels:

  - Workspaces (teams is the legacy term for this in the API)
  - Spaces
  - Folders
  - Lists
  - Tasks
  - Subtasks
  - Checklists

We can list Workspaces that we have access to using the `cu_get_teams()`
function. It takes no arguments, it only passes the access token behind
the scenes, so it is a good way to test if things are working as
expected

``` r
Teams <- cu_get_teams()
str(Teams, 3)
#> List of 1
#>  $ teams:List of 2
#>   ..$ :List of 5
#>   .. ..$ id     : chr "2253762"
#>   .. ..$ name   : chr "Peter's Workspace"
#>   .. ..$ color  : chr "#40BC86"
#>   .. ..$ avatar : NULL
#>   .. ..$ members:List of 1
#>   ..$ :List of 5
#>   .. ..$ id     : chr "2399763"
#>   .. ..$ name   : chr "My Workspace"
#>   .. ..$ color  : chr "#ea80fc"
#>   .. ..$ avatar : NULL
#>   .. ..$ members:List of 1
```

Spaces within a specific Workspace defined by its `team_id`

``` r
team_id <- Teams$teams[[2]]$id
Spaces <- cu_get_spaces(team_id)
str(Spaces, 3)
#> List of 1
#>  $ spaces:List of 2
#>   ..$ :List of 7
#>   .. ..$ id                : chr "6331651"
#>   .. ..$ name              : chr "Extras"
#>   .. ..$ private           : logi FALSE
#>   .. ..$ statuses          :List of 4
#>   .. ..$ multiple_assignees: logi TRUE
#>   .. ..$ features          :List of 11
#>   .. ..$ archived          : logi FALSE
#>   ..$ :List of 7
#>   .. ..$ id                : chr "6331576"
#>   .. ..$ name              : chr "Bugs"
#>   .. ..$ private           : logi FALSE
#>   .. ..$ statuses          :List of 2
#>   .. ..$ multiple_assignees: logi FALSE
#>   .. ..$ features          :List of 8
#>   .. ..$ archived          : logi FALSE
```

Folders within a specific Space defined by its `space_id`

``` r
space_id <- Spaces$spaces[[2]]$id
Folders <- cu_get_folders(space_id)
str(Folders, 3)
#> List of 1
#>  $ folders:List of 1
#>   ..$ :List of 11
#>   .. ..$ id               : chr "12783555"
#>   .. ..$ name             : chr "Bug queues"
#>   .. ..$ orderindex       : int 1
#>   .. ..$ override_statuses: logi TRUE
#>   .. ..$ hidden           : logi FALSE
#>   .. ..$ space            :List of 2
#>   .. ..$ task_count       : chr "10"
#>   .. ..$ archived         : logi FALSE
#>   .. ..$ statuses         :List of 13
#>   .. ..$ lists            :List of 2
#>   .. ..$ permission_level : chr "create"
```

Lists within a specific Folder defined by its `folder_id` (or Folderless
Lists based on `space_id`)

``` r
folder_id <- Folders$folders[[1]]$id
Lists <- cu_get_lists(folder_id)
str(Lists, 3)
#> List of 1
#>  $ lists:List of 2
#>   ..$ :List of 14
#>   .. ..$ id               : chr "31538033"
#>   .. ..$ name             : chr "Hotfix"
#>   .. ..$ orderindex       : int 2
#>   .. ..$ status           : NULL
#>   .. ..$ priority         : NULL
#>   .. ..$ assignee         : NULL
#>   .. ..$ task_count       : chr "5"
#>   .. ..$ due_date         : NULL
#>   .. ..$ start_date       : NULL
#>   .. ..$ folder           :List of 4
#>   .. ..$ space            :List of 3
#>   .. ..$ archived         : logi FALSE
#>   .. ..$ override_statuses: logi FALSE
#>   .. ..$ permission_level : chr "create"
#>   ..$ :List of 14
#>   .. ..$ id               : chr "31538032"
#>   .. ..$ name             : chr "Internal Bugs"
#>   .. ..$ orderindex       : int 3
#>   .. ..$ status           : NULL
#>   .. ..$ priority         : NULL
#>   .. ..$ assignee         : NULL
#>   .. ..$ task_count       : chr "5"
#>   .. ..$ due_date         : NULL
#>   .. ..$ start_date       : NULL
#>   .. ..$ folder           :List of 4
#>   .. ..$ space            :List of 3
#>   .. ..$ archived         : logi FALSE
#>   .. ..$ override_statuses: logi FALSE
#>   .. ..$ permission_level : chr "create"

cu_get_lists_folderless(space_id)
#> $lists
#> list()
```

The functions `cu_get_spaces`, `cu_get_folders`, and `cu_get_lists`
accept the argument `archived` to return archived spaces/folders/lists

``` r
str(cu_get_lists(folder_id, archived=TRUE), 3)
#> List of 1
#>  $ lists:List of 1
#>   ..$ :List of 14
#>   .. ..$ id               : chr "31538034"
#>   .. ..$ name             : chr "Backlog"
#>   .. ..$ orderindex       : int 4
#>   .. ..$ status           : NULL
#>   .. ..$ priority         : NULL
#>   .. ..$ assignee         : NULL
#>   .. ..$ task_count       : int 5
#>   .. ..$ due_date         : NULL
#>   .. ..$ start_date       : NULL
#>   .. ..$ folder           :List of 4
#>   .. ..$ space            :List of 3
#>   .. ..$ archived         : logi TRUE
#>   .. ..$ override_statuses: logi FALSE
#>   .. ..$ permission_level : chr "create"
```

### Tasks

We can list Tasks within a specific List defined by its `list_id`

``` r
list_id <- Lists$lists[[1]]$id
Tasks <- cu_get_tasks(list_id)
str(Tasks, 2)
#> List of 1
#>  $ tasks:List of 5
#>   ..$ :List of 32
#>   ..$ :List of 32
#>   ..$ :List of 32
#>   ..$ :List of 32
#>   ..$ :List of 32
```

Notice that we have 5 tasks in the list. We can include Subtasks too

``` r
subTasks <- cu_get_tasks(list_id, subtasks=TRUE)
length(subTasks$tasks)
#> [1] 7
```

Getting all the tasks (possibly filtered) in a Workspace is done via the
`cu_get_filtered_team_tasks` function. This function returns tasks in
batches of 100. If you don’t want to deal with paging, use the wrapper
function `cu_get_all_team_tasks` The list of tasks returned does not include
closed tasks, to get those as well we need to pass the `include_closed`
query parameter

``` r
## without closed tasks
length(cu_get_all_team_tasks(team_id, subtasks=TRUE)$tasks)
#> [1] 17

## with closed tasks
allSubTasks <- cu_get_all_team_tasks(team_id, subtasks=TRUE,
                                include_closed=TRUE)
length(allSubTasks$tasks)
#> [1] 18

Status <- sapply(allSubTasks$tasks, function(z) z$status$status)
data.frame(table(Status))
#>          Status Freq
#> 1        Closed    1
#> 2   in progress    3
#> 3 investigating    2
#> 4          Open    5
#> 5    production    1
#> 6        review    4
#> 7        staged    2
```

Let’s inspect the first few elements of a Task object

``` r
str(Tasks$tasks[[1]][1:10])
#> List of 10
#>  $ id          : chr "8ckc8h"
#>  $ name        : chr "Slow speed report"
#>  $ text_content: NULL
#>  $ description : NULL
#>  $ status      :List of 4
#>   ..$ status    : chr "investigating"
#>   ..$ color     : chr "#ff1010"
#>   ..$ type      : chr "custom"
#>   ..$ orderindex: int 2
#>  $ orderindex  : chr "2.69039285693592680000000000000000"
#>  $ date_created: chr "1592452913384"
#>  $ date_updated: chr "1592452913384"
#>  $ date_closed : NULL
#>  $ archived    : logi FALSE
```

Dates are given as Unix time (in milliseconds), `cu_date` and `cu_time`
is there to convert back and forth

``` r
Tasks$tasks[[1]]$date_created
#> [1] "1592452913384"
cu_date(Tasks$tasks[[1]]$date_created)
#> [1] "2020-06-17 22:01:53 MDT"
cu_time(cu_date(Tasks$tasks[[1]]$date_created))
#> [1] 1.592453e+12
```

A single task can be accessed through the task ID (note: copying the
task ID from the ClickUp GUI will prepend the task ID by a hash,
`"#8ckjp5"`, but the API expects ID without the hash `"8ckjp5"`).

The `$parent` property is `NULL` for Tasks, and it contains the parent
Task ID for Subtasks

``` r
x1 <- cu_get_task("8ckjp5") # task
x1$parent
#> NULL

x2 <- cu_get_task("8ckjru") # subtask
x2$parent
#> [1] "8ckjp5"
```

Dependencies are stored in the `$dependencies` property

``` r
str(x1$dependencies)
#> List of 1
#>  $ :List of 5
#>   ..$ task_id     : chr "8ckjp5"
#>   ..$ depends_on  : chr "8ckjpg"
#>   ..$ type        : int 1
#>   ..$ date_created: chr "1592458378628"
#>   ..$ userid      : chr "4300475"
```

### Helper functions

`cu_options` stores the API settings

``` r
str(cu_options())
#> List of 4
#>  $ baseurl  : chr "https://api.clickup.com"
#>  $ version  : chr "v2"
#>  $ tz       : chr ""
#>  $ useragent: chr "http://github.com/psolymos/clickrup"
```

`cu_response` allows inspecting the response object

``` r
cu_response(Teams)
#> Response [https://api.clickup.com/api/v2/team]
#>   Date: 2020-06-19 19:59
#>   Status: 200
#>   Content-Type: application/json; charset=utf-8
#>   Size: 776 B
```

Check rate limits and remaining requests (rate is limited by the minute)

``` r
cu_ratelimit(subTasks)
#> $limit
#> [1] 900
#> 
#> $remaining
#> [1] 892
```

### Formatting the request body

`PUSH` and `PUT` requests often require to send data as part of the
request body. Check the API examples and use `I()` when the API expects
an array as part of the body. For example when passing data to
`cu_create_task`, `assignees` is an array of the assignees’ userids to
be added. Adding a single userid without `I()` will drop the brackets,
but `list(name = "New Task Name", assignees = I(183))` will result in
the expected JSON object: `{ "name": "New Task Name", "assignees": [183]
}`.

## Issues

<https://github.com/psolymos/clickrup/issues>

## License

[MIT](LICENSE) © 2020 Peter Solymos
