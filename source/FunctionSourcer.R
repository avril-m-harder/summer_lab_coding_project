## set working directory, import packages, source functions, 
setwd(paste0(directory,"/source/"))    # set temp working directory 

#import packages
#library()

## source functions
# source(paste0(getwd(), "/RunModel.R"))

## source all functions in /source/ other than FunctionSourcer.R (this script)
funcs <- list.files(paste0(getwd()))
funcs <- funcs[-which(funcs == 'FunctionSourcer.R')]
sapply(funcs, source, .GlobalEnv)
