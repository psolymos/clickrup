library(httr)
library(igraph)
library(DiagrammeR)

source("R/cu.R")
source("R/tasks.R")
source("R/teams.R")
source("R/spaces.R")

options("cu_options"=list(version="v2",
                          baseurl="https://api.clickup.com",
                          tz=""))

wsp <- cu_get_teams()
wsp_id <- wsp$teams[[1L]]$id
wsp_name <- wsp$teams[[1L]]$name
wsp_members <- do.call(rbind, lapply(wsp$teams[[1L]]$members, function(z) {
    data.frame(id=z$user$id,
      username=if (is.null(z$user$username)) NA else z$user$username,
      email=z$user$email,
      role=switch(as.character(z$user$role),
                       "1"="owner",
                       "2"="admin",
                       "3"="member",
                       "4"="guest"),
      joined=!is.null(z$user$date_joined))
}))


team_id <- 2342712
Tasks <- cu_get_tasks_all(team_id, subtasks="true")
Tasks <- Tasks$tasks
length(Tasks)
names(Tasks) <- sapply(Tasks, "[[", "id")
Spaces <- cu_get_spaces(team_id)
Spaces <- do.call(rbind, lapply(Spaces$spaces, function(z) {
    data.frame(id=z$id, name=z$name)
}))
rownames(Spaces) <- Spaces$id


task_table <- do.call(rbind, lapply(Tasks, function(z) {
    data.frame(id=z$id,
              name=z$name,
              status=z$status$status,
              parent=if (is.null(z$parent)) NA else z$parent,
              priority=if (is.null(z$priority)) NA else z$priority$priority,
              due_date=if (is.null(z$due_date)) NA else cu_date(z$due_date),
              list=z$list$name,
              folder=z$folder$name,
              space=as.character(Spaces[z$space$id, "name"]),
              stringsAsFactors = FALSE)
}))


cu_create_space(2342712, "Test")



#task_deps <- lapply(Tasks, function(z) {
#    sapply(z$dependencies, "[[", "depends_on")
#})

task_el <- do.call(rbind, lapply(Tasks, function(z) {
    d <- sapply(z$dependencies, "[[", "depends_on")
    data.frame(from=d, to=rep(z$id, length(d)), stringsAsFactors = FALSE)
}))
#task_el <- task_el[task_el[,"from"] %in% rownames(task_table)[
#    task_table$folder=="All-in-one Analysis"],]
task_el <- as.matrix(task_el[task_el[,1]!=task_el[,2],])

el <- cbind(
  task_table$name[match(task_el[,1], task_table$id)],
  task_table$name[match(task_el[,2], task_table$id)])
el[is.na(el)] <- task_el[is.na(el)]

g <- graph_from_edgelist(el)

plot(g, edge.arrow.size=.5, vertex.color="gold", vertex.size=15,
     vertex.frame.color="gray", vertex.label.color="black",
     vertex.label.cex=0.8, vertex.label.dist=2)

plot(g, vertex.shape="none", #vertex.label=V(net)$media,
     vertex.label.font=2, vertex.label.color="gray40",
     vertex.label.cex=.7, edge.color="gray85", arrow.size=0.2)

V(g)$label = V(g)$name
V(g)$name = factor(V(g)$name, levels=as.character(V(g)$name))
g2 <- from_igraph(g)

render_graph(g2)
#grViz(generate_dot(g2))

str(Tasks[["6wh5np"]])

str(cu_get_task("6wh5nt")) # subtask


aa <- cu_get_tasks_filtered(2342712, page=0)

cu_get_shared(wsp_id)

sp <- cu_get_spaces(wsp_id)
Spaces <- do.call(rbind, lapply(sp$spaces, function(z) {
    data.frame(id=z$id, name=z$name)
}))
sp1 <- cu_get_space(4450981)

cu_get_space_tags(4450981)

f1 <- cu_get_folders(4450981)
Folders <- do.call(rbind, lapply(f1$folders, function(z) {
    data.frame(id=z$id, name=z$name,
               space_id=z$space$id, space_name=z$space$name)
}))
ff1 <- cu_get_folder(10736465)

cu_get_lists_folderless(4450981)
cu_get_lists(10736465)
cu_get_list(25249327)



## attachment

## Attachments / Post Task Attachment
## POST https://api.clickup.com/api/v2/task/task_id/attachment
## task_id: Example: 9hv. String


    req <- httr::POST(
            httr::modify_url(getOption("cu_options")$baseurl,
                       path = .cu_path("task", "5ye7nu", "attachment")),
            httr::add_headers(Authorization = cu_pat(),
                              "Content-Type" = "multipart/form-data"),
            encode="multipart",
            body=upload_file("inst/examples/example.png"),
            user_agent("http://github.com/psolymos/clickrup"))
content(req)

png("inst/examples/example.png")
set.seed(1)
#hist(rnorm(10^6), main="Demo image", col="pink", border="red", xlab="x")
plot(0, col=2, pch=19, axes=FALSE, ann=FALSE)
dev.off()

txt <- base64enc::base64encode("inst/examples/example.png")

