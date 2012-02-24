#' Compute Quantities of Interest for the Zelig Model plm
#' @param obj a zelig object
#' @param x a setx object
#' @param x1 an optional setx object
#' @param y this parameter is reserved for simulating average treatment effects,
#'   though this feature is currentlysupported by only a handful of models
#' @param num an integer specifying the number of simulations to compute
#' @param param a parameters object
#' @return a list of key-value pairs specifying pairing titles of quantities of interest
#'         with their simulations
#' @export
#' based on a Zelig3 plm module and the Zelig4 qi.normal/ls.R functions

qi.pan.plm <- function(obj, x=NULL, x1=NULL, y=NULL, num=1000, param=NULL) {  
	message("qi.plm called")
  k <- length(coef(obj))
  coef <- coef(param)   # coef <- simpar[,1:k,drop = FALSE]
  alpha <- alpha(param) # alpha <- simpar[,ncol(simpar)]

  ev <- .compute.ev(k, coef, alpha, obj, x, num)
  ev1 <- .compute.ev(k, coef, alpha, obj, x1, num)
  
  pr <- .compute.pr(ev,alpha)
  #   pr1 <- .compute.pr(ev1, alpha)     

#   if (k < ncol(x)){
#   x <- as.data.frame(x[,names(coef(obj)),drop = FALSE])
#   }  
#   rownames(x) <- NULL  # vacating the row names for the purposes of final output formatting
#   # x param sims
#   ev <- coef %*% t(x)       # matrix(coef %*% t(x), nrow=nrow(coef))
#   pr <- matrix(NA, ncol = ncol(ev), nrow = nrow(ev))
#   for (i in 1:ncol(ev)){
# 	pr[,i] <- rnorm(length(ev[,i]), mean = ev[,i], # [4]
# 					sd = alpha)
#   } # end of the x parameter section

#   # x1 param sims
#   if (!is.null(x1)){    # filling in the matrix for the first differences
#     if (k < ncol(x1)){
#       x1 <- as.data.frame(x1[,names(coef(obj)),drop=FALSE])
# 	}  
#   	if (!is.null(x1)){   # vacating the row names for the purposes of final output formatting (applies to plm models only) 
# 	   rownames(x1) <- NULL
#   	}
#     ev1 <- coef %*% t(x1) 
# 	pr1 <- matrix(NA, ncol = ncol(ev1), nrow = nrow(ev1))
#     for (i in 1:ncol(ev1)){
# 		pr1[,i] <- rnorm(length(ev1[,i]), mean = ev1[,i], # [4]
# 										  sd = alpha)
# 	}
#   }  # end of the x1 (first difference) parameter section

  # to compute the average treatment effects (comment out for testing)
#   if (!is.null(y)) {
#     yvar <- matrix(rep(y, nrow(param)), nrow = nrow(param), byrow = TRUE)
#     tmp.ev <- yvar - ev        
#     att.ev <- matrix(apply(tmp.ev, 1, mean), nrow = nrow(param))  
#   } #Comment out for testing
  
  list(
        "Expected Value: E(Y|X)" = ev,
        "Expected Value: E(Y|X1)" = ev1,
        "Predicted Value: Y|X" = pr,
#         "Predicted Value: Y|X1" = pr1,
        "First Differences (Expected Values): E(Y|X1) - E(Y|X)" = ev1-ev #,
#         "First Difference (Predicted Values): Y|X1 - Y|X" = pr1-pr,
#        "Average Treatment Effect for the Treated: Y - EV" = att.ev       
	)
}

.compute.ev <- function(k, coef, alpha, obj, x=NULL, num=1000){
	if (is.null(x))
	    return(NA)
   # coef = coef(param), alpha = alpha(param), k= getlength(getcoef(obj))
#   if (!is.null(x)){    # filling in the matrix for the first differences
    # if (k < ncol(x)){
      # x <- as.data.frame(x[,names(coef(obj)),drop=FALSE]) #column names
    # }  
      if (!is.null(x)){   # vacating the row names for the purposes of final output formatting (applies to plm models only) 
       rownames(x) <- NULL
      }
    ev <- matrix(coef %*% t(x), nrow=nrow(coef))   # could also be: ev <- matrix(coef %*% t(x), nrow=nrow(coef))       coef %*% t(x)
	ev
  }
  
.compute.pr <- function(ev, alpha){
    pr <- matrix(NA,nrow = nrow(ev), ncol = ncol(ev))
	for (i in nrow(ev))
		pr[i,] <- rnorm(ncol(ev), mean = ev[i,], sd = alpha)  
	
	pr <- matrix(data=1, ncol = ncol(ev), nrow = nrow(ev)) 
        for (i in 1:ncol(ev)){   # for (i in 1:nrow(ev)) #as per qi.normal.R in Z4
            pr[,i] <- rnorm(length(ev[,i]), mean = ev[,i], # [4]   #pr[i,] <- rnorm(ncol(ev), mean = ev[i,], 
        									  sd = alpha)                                     # sd = alpha[i])
    	}   
    pr
}  
