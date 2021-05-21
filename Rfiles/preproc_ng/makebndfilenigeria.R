require(BayesX)

states <- levels(nigeriaraw$v024)

map <- shp2bnd(shpname = "sdr_subnational_boundaries_2015-08-10-2/shps/sdr_subnational_boundaries",
               regionnames = states)

data <- data.frame(intnr = seq(1, length(states)), states = as.character(states), x = seq(0, 1, length = length(states)))

drawmap(data = data, map = map, drawnames = TRUE, plotvar = "x")



states <- levels(nigeriaraw$v023)

states_str <- as.character(states)
in_it <- rep(FALSE, 73)
for(i in 1:73){
  in_it[i] <- length(grep("Urban", states_str[i])) > 0
}

states <- as.factor(states_str[in_it])

states <- 1:37

map <- shp2bnd(shpname = "sdr_subnational_boundaries_2015-08-10-2/shps2/sdr_subnational_boundaries2",
               regionnames = states)

data <- data.frame(intnr = seq(1, length(states)), states = as.character(states), x = seq(0, 1, length = length(states)))

drawmap(data = data, map = map, drawnames = TRUE, plotvar = "x")

write.bnd(map = map, file = "nigeriamap.bnd")


