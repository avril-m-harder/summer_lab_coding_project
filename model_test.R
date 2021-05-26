setwd('/Users/Avril/Documents/summer_lab_coding_project/summer_lab_coding_project/')

## set parameters -------------------------
max.age <- 4 ## individuals die before reproducing in year 4 (last repro year = 3)
brood <- 1 ## brood size (# of offspring per pair? probably needs to be 2 if we're going for replacement)
#k <- 100 ## want to allow population size to vary about k
n.years <- 50 ## number of years over which to run simulation

## initialize population ------------------
pop <- matrix(nrow=100, ncol=6)
colnames(pop) <- c('id','sex','mom','dad','age','num.off')
pop[,1] <- seq(1,100,1) ## unique ID for each indiv
pop[,2] <- sample(c(0,1),100,replace = TRUE) ## randomly assign male/female (0=M, 1=F)
pop[,3] <- rep(0,100) ## mom ID = 0 for simulation founders
pop[,4] <- rep(0,100) ## mom ID = 0 for simulation founders
pop[,5] <- sample(c(-1:3),100,replace=TRUE) ## assign ages (could edit to model specific age structure)
pop[,6] <- rep(0,100) ## beginning number of offspring is 0 for all indivs

