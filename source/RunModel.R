### model overview -------------------------
##
## init pop --> *age up --> die --> reproduce --> age up --> die --> reproduce --> age up ...
## 
## *this is why some individual are intialized as age == -1
##

RunModel <- function(replicates, r, directory){
  ## set parameters -------------------------
  max.age       <- replicates$max.age[r]
  brood         <- replicates$brood[r]
  k             <- replicates$k[r]
  n.years       <- replicates$n.years[r]
  prop.female   <- replicates$prop.female[r]
  repro.age     <- replicates$repro.age[r]
  
  
  ## initialize population ------------------
  pop <- matrix(nrow=k, ncol=6)
  colnames(pop) <- c('id','sex','mom','dad','age','num.off')
  pop[,1]       <- seq(1,k,1) ## unique ID for each indiv
  pop[,2]       <- sample(c(0,1),k,replace = TRUE,prob = c(1-prop.female, prop.female)) ## randomly assign male/female (0=M, 1=F)
  pop[,c(3:4)]  <- 0 ## mom & dad ID = 0 for simulation founders
  pop[,5]       <- sample(c(-1:(max.age-1)),k,replace=TRUE) ## assign ages (could edit to model specific starting population age structure)
  pop[,6]       <- rep(0,k) ## beginning number of offspring is 0 for all indivs
  
  for(y in 1:n.years){
    to.kill <- (sample(c(1:nrow(pop)),1))
    pop <- pop[-to.kill,]
  }
  write.table(pop, paste0(directory,'/output/testpop_rep',r,'.txt'), sep='\t', col.names=FALSE, row.names=FALSE, append=TRUE)
}