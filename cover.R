#setup
setwd('/Users/Avril/Documents/summer_lab_coding_project/summer_lab_coding_project/')   #set working directory
directory <- getwd()
outdir    <- paste(directory,"/output/",sep="")                                                    #directory to save model output  
source(paste0(directory, "/source/FunctionSourcer.R"))                                   #source functions and set source directory

## set parameters -------------------------
max.age       <- 4 ## individuals die before reproducing in year 4 (last repro year = 3)
brood         <- 1 ## brood size (# of offspring per pair? probably needs to be 2 if we're going for replacement)
k             <- 100 ## want to allow population size to vary about k
n.years       <- 50 ## number of years over which to run simulation
prop.female   <- 0.50 ## proportion of individuals that are female in the starting population
repro.age     <- 1 ## age at reproductive maturity (i.e., can reproduce in this year)

#generate list of combinations of parameter values to simulate
replicates = expand.grid(max.age, brood, k, n.years, prop.female, repro.age)
colnames(replicates) = c("max.age", "brood", "k", "n.years", "prop.female", "repro.age")

#run model iterating over parameters in replicates
for(r in 1:nrow(replicates)){ 
  RunModel(replicates, r, directory)
}
