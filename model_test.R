setwd('/Users/Avril/Documents/summer_lab_coding_project/summer_lab_coding_project/')

### model overview -------------------------
##
## init pop --> *age up --> die --> reproduce --> age up --> die --> reproduce --> age up ...
## 
## *this is why some individual are intialized as age == -1
##

## set parameters -------------------------
max.age <- 4 ## individuals die before reproducing in year 4 (last repro year = 3)
brood <- 1 ## brood size (# of offspring per pair? probably needs to be 2 if we're going for replacement)
k <- 100 ## want to allow population size to vary about k
n.years <- 50 ## number of years over which to run simulation
prop.female <- 0.50 ## proportion of individuals that are female in the starting population
repro.age <- 1 ## age at reproductive maturity (i.e., can reproduce in this year)


## initialize population ------------------
pop <- matrix(nrow=k, ncol=6)
colnames(pop) <- c('id','sex','mom','dad','age','num.off')
pop[,1] <- seq(1,k,1) ## unique ID for each indiv
pop[,2] <- sample(c(0,1),k,replace = TRUE,prob = c(1-prop.female, prop.female)) ## randomly assign male/female (0=M, 1=F)
pop[,c(3:4)] <- 0 ## mom & dad ID = 0 for simulation founders
pop[,5] <- sample(c(-1:(max.age-1)),k,replace=TRUE) ## assign ages (could edit to model specific starting population age structure)
pop[,6] <- rep(0,k) ## beginning number of offspring is 0 for all indivs

for(y in 1:n.years){
  pop <- pop[-(sample(c(1:nrow(pop)),1)),]
}

### copied from J's RunModel.R:
# out1 <- matrix(0, ncol = 2, nrow = 10) # create a matrix for outputting data 
# 
# for(r in 1:10){ #this controls the number of times you want to run the simulation - we will run it more than 10 times eventually
#   #sample individuals that move from wild to cargo - we will vary this value for sure, so it is a parameter set above
#   intransit = pop[sample(seq(1,nrow(pop),1), wildtocargo, replace=F),,drop=F] #randomly select rows from pop that have moved from wild into cargo/ship
#   
#   #apply some mortality while in transit
#   surviveornot = sample(c(0,1), length(intransit), replace=T, prob=c((1-survivetrans), survivetrans))
#   intransit    = intransit[which(surviveornot==1), , drop=F] #keep only rows that survived, based on survival probabilty in above line
#   
#   #some proportion of individuals leave cargo chain and enter wild area at recipient port
#   exitornot = sample(c(0,1), length(intransit), replace=T, prob=c(exitcargo, (1-exitcargo)))
#   inwild    = intransit[which(exitornot==1), , drop=F] #keep only rows that exited, based on  probabilty in above line
#   intransit = intransit[which(exitornot==0), , drop=F] #update who is in cargo still (this will give some info about repeated port risks)
#   
#   #some mortality because environment is inhospitable
#   liveornot = sample(c(1,0), length(inwild), replace=T, prob=c(newenv, (1-newenv)))
#   inwild    = inwild[which(liveornot==1), , drop=F] #keep only rows that exited, based on  probabilty in above line
#   
#   out1[r,1] <- length(inwild)
#   out1[r,2] <- length(intransit)
#   
#   
#   #reproduction in new location
#   
#   #ACK! this is a complicated section I don't have time to write today, but generally we'd have to make sure there were males and females, 
#   #suitable habitat, and also apply some probability of mating. Then, we could also generate the number of expected offspring to give 
#   #insight into how stable the population might be (if only 1 offspring, generation 3 would rely on repeated invasions, for example)
#   
#   #write simulation output to file - currently not written, but we'd want to output that runs parameters plus anything that 
#   #is possibly interesting down the line, such as the number of mozzies left intransit and how many offspring were "created" in the new location
#   
# }
# 
# out1
# ###NOTE: the sample function right now is binary, but to the extent possible we will substitute those better distributions. For example, probablitly
# #of surviving in transit is set to 0.9, but if we know the tails of that estimate we can make the model function better.