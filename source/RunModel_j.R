RunModel = function(replicates, r, directory){ 
  #initialize variables
  lifespan    = replicates$lifespan[r]
  years       = replicates$years[r]
  K           = replicates$K[r]
  fecundity   = replicates$fecundity[r]
  maturity    = replicates$maturity[r]
  prop.female = replicates$prop.female[r]
  
  #initialize population
  pop = matrix(nrow=K, ncol=5)
  colnames(pop) = c("id", "momid", "dadid", "age", "sex") 
  pop[ ,1]   = seq(1,100,1)                                 #ID
  pop[ ,2:3] = 0                                            #momid, dadid
  pop[ ,4]   = sample(seq(0,lifespan,1), K, replace=T) - 1  #age (minus 1 to help with loop below)
  pop[ ,5]   = sample(c(0,1), K, replace=T)                 #sex
  
  #Create a simple loop that removes variable number of individuals each year and runs for 50 years
  for(y in 1:years){
    dead = sample(seq(1,nrow(pop), 1), 1, replace=F)
    pop  = pop[-dead,]
  }
  write.table(pop, paste(directory, "/output/testpop.txt", sep=""), sep="\t", col.names=F, row.names=F)
}