#setup
setwd('/Users/Avril/Documents/summer_lab_coding_project/summer_lab_coding_project/')   #set working directory
directory = getwd()
outdir    = paste(directory,"/output/",sep="")                                                    #directory to save model output  
source(paste(directory, "/source/FunctionSourcer.R", sep = ''))                                   #source functions and set source directory

#simulation parameters
lifespan    = 3     #max number of years an individual can live
years       = 50    #number of years to run each replicate/simulated population
K           = 100
fecundity   = 1
maturity    = 1
prop.female = 0.5

#generate list of combinations of parameter values to simulate
replicates = expand.grid(lifespan, years, K, fecundity, maturity, prop.female)
colnames(replicates) = c("lifespan", "years", "K", "fecundity", "maturity", "prop.female")

#run model iterating over parameters in replicates
for(r in 1:nrow(replicates)){ 
  RunModel(replicates, r, directory)
}