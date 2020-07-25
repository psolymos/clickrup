#remotes::install_github("psolymos/clickrup")

library(clickrup)
library(magick)
cu_set_pat(Sys.getenv("CU_PAT_A"))

tsk <- cu_get_task("#8ach57")

cm <- cu_get_task_comments("#8ach57")
str(cm$comments)


im <- image_read(cm$comments[[1]]$user$profilePicture)

users <- sapply(cm$comments, function(z) z$user$username)
comments <- sapply(cm$comments, function(z) z$comment_text)
dates <- cu_date_from(sapply(cm$comments, function(z) z$date))

## issue: no replies to comments are visible only the comments
