#Creating dataframe from CSV file of response
library(igraph)
readfile <- read.csv("Faculty Emails Data (Responses) - Form Responses.csv")

#checking teh dataframe
print(readfile)

#checking the length of rows in csv
print(length(readfile$Faculty))



#empty graph
facultygraph=make_empty_graph(directed=TRUE)
vertices=list()


#loop to add directed edges to a graph
for (i in 1:length(readfile$Faculty)){
  if (readfile$Faculty[i] %in% vertices == FALSE){
    facultygraph=facultygraph+vertices(readfile$Faculty[i],School=readfile$School[i],Major=readfile$Major[i],Pod=readfile$Pod[i],posi=readfile$Role[i], Leadership=readfile$Leadership.Position[i])
    vertices=append(vertices,readfile$Faculty[i])
  }
  if (readfile$Name1[i] %in% vertices == FALSE){
    facultygraph=facultygraph+vertices(readfile$Name1[i])
    facultygraph=facultygraph+vertices(readfile$Name1[i],School=readfile$School1[i],Major=readfile$Majo1r[i],Pod=readfile$Pod1[i],posi=readfile$Role1[i], Leadership=readfile$)
    vertices=append(vertices,readfile$Name1[i])
  }
  if (readfile$Name2[i] %in% vertices == FALSE){
    facultygraph=facultygraph+vertices(readfile$Name2[i])
    vertices=append(vertices,readfile$Name2[i])
  }
  if (readfile$Name3[i] %in% vertices == FALSE){
    facultygraph=facultygraph+vertices(readfile$Name3[i])
    vertices=append(vertices,readfile$Name3[i])
  }
  if (readfile$Name4[i] %in% vertices == FALSE){
    facultygraph=facultygraph+vertices(readfile$Name4[i])
    vertices=append(vertices,readfile$Name4[i])
  }
  if (readfile$Name5[i] %in% vertices == FALSE){
    facultygraph=facultygraph+vertices(readfile$Name5[i])
    vertices=append(vertices,readfile$Name5[i])
  }
  if (readfile$Name6[i] %in% vertices == FALSE){
    facultygraph=facultygraph+vertices(readfile$Name6[i])
    vertices=append(vertices,readfile$Name6[i])
  }
  
  
  facultygraph=add_edges(facultygraph,c(readfile$Faculty[i],readfile$Name1[i]))
  facultygraph=add_edges(facultygraph,c(readfile$Faculty[i],readfile$Name2[i]))
  facultygraph=add_edges(facultygraph,c(readfile$Faculty[i],readfile$Name3[i]))
  facultygraph=add_edges(facultygraph,c(readfile$Faculty[i],readfile$Name4[i]))
  facultygraph=add_edges(facultygraph,c(readfile$Faculty[i],readfile$Name5[i]))
  facultygraph=add_edges(facultygraph,c(readfile$Faculty[i],readfile$Name6[i]))
}

print(E(facultygraph))

plot(facultygraph)



# write.csv(get.edgelist(facultygraph),"faculty_graph.csv",na="",row.names = FALSE, col.names = FALSE)
# write.csv(as_adj_list(facultygraph),"faculty_graph.csv",na="",row.names = FALSE, col.names = FALSE)
# 
# length(as_adj_list(facultygraph, mode = "total"))
# as_adj_list(facultygraph)
# which(facultygraph)
# 
# facultygraph$major = readfile$Major
# length(facultygraph)
# 

# 
#  g = facultygraph
# 
#  ebc <- edge.betweenness.community(g, directed=T)
# 
# #Now we have the merges/splits and we need to calculate the modularity
# #for each merge for this we'll use a function that for each edge
# # removed will create a second graph, check for its membership and use
# # that membership to calculate the modularity
# mods <- sapply(0:ecount(g), function(i){
#   g2 <- delete.edges(g, ebc$removed.edges[seq(length=i)])
#   cl <- clusters(g2)$membership
#   # March 13, 2014 - compute modularity on the original graph g
#   # (Thank you to Augustin Luna for detecting this typo) and not on the induced one g2.
#   modularity(g,cl)
# })
# 
# # we can now plot all modularities
# plot(mods, pch=20)
# 
# # Now, let's color the nodes according to their membership
# g2<-delete.edges(g, ebc$removed.edges[seq(length=which.max(mods)-1)])
# V(g)$color=clusters(g2)$membership
# 
# # Let's choose a layout for the graph
# g$layout <- layout.fruchterman.reingold
# 
# # plot it
# plot(g, vertex.label=NA,margin=-0.4)
# 
 print(V(g)$Name)
