#remotes::install_github("psolymos/clickrup")

library(clickrup)
library(igraph)
library(DiagrammeR)

cu_set_pat(Sys.getenv("CU_PAT_A"))

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
table(is.na(task_table$parent))

task_el <- do.call(rbind, lapply(Tasks, function(z) {
    d <- sapply(z$dependencies, "[[", "depends_on")
    k <- sapply(z$dependencies, "[[", "task_id")
    data.frame(from=d, to=k, stringsAsFactors = FALSE)
}))

el <- cbind(
  from=task_table$name[match(task_el[,1], task_table$id)],
  to=task_table$name[match(task_el[,2], task_table$id)])
el[is.na(el)] <- task_el[is.na(el)]

d <- data.frame(table(el[,1]))
d <- d[order(d$Freq, decreasing=TRUE),]

g <- graph_from_edgelist(el)
V(g)$label = V(g)$name
V(g)$name = factor(V(g)$name, levels=as.character(V(g)$name))
V(g)$size <- degree(g, mode="all")

plot(g, edge.arrow.size=.5, vertex.color="gold", vertex.size=15,
     vertex.frame.color="gray", vertex.label.color="black",
     vertex.label.cex=0.8, vertex.label.dist=2)

plot(g, vertex.shape="none", #vertex.label=V(net)$media,
     vertex.label.font=2, vertex.label.color="gray40",
     vertex.label.cex=.7, edge.color="gray85", arrow.size=0.2)


g2 <- from_igraph(g)

render_graph(g2, output = "visNetwork")
#grViz(generate_dot(g2))

plot(g,
     vertex.size        = V(g)$size/2,
     #vertex.label.cex   = V(g)$size/50,
     #vertex.label.color = "black",
     #edge.curved        = TRUE,
     vertex.label.family = "sans"
     )

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


