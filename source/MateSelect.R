## Monogamous mate selection. Randomly pairs males and females 1:1. Some individuals of the sex with greater number 
## of individuals will be left unmatched. Returns 2-column matrix where each row is a pair of mates. Order of columns
## (i.e., sex) will vary by which sex is more commonly observed in the pop.

MateSelect <- function(){
  # sex <- c(0,1)[which.min(tabulate(match(pop[,'sex'], c(0,1))))] ## determine which sex is underrepresented
  if(mean(pop[,'sex']) < 0.5){ ## determine which sex is underrepresented
    sex <- 1
  }
  else{
    sex <- 0
  }
  mates <- sample(pop[pop[,'sex'] != sex, 'id'], tabulate(match(pop[,'sex'], sex)), replace=FALSE)
  pairs <- cbind(pop[pop[,'sex'] == sex, 'id'], mates)
  colnames(pairs) <- c('m1','m2')
  return(pairs)
}