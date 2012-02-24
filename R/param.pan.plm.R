#' Extract Samples from a Distribution in Order to Pass Them to the \code{qi} Function
#' (this is primarily a helper function for the plm model)
#' @param obj a zelig object
#' @param num an integer specifying the number of simulations to compute
#' @param ... additional parameters
#' @return a list specifying link, link-inverse, random samples, and ancillary parameters
#' 
#' @export
param.pan.plm <-function(obj, num=1000, ...) {
    coef <- mvrnorm(num, mu=coef(obj), Sigma=vcov(obj))
    df <- summary(obj)$df.residual
    RSS <- plm:::deviance.panelmodel(obj)    # Residuals Sum of Squares
    MSE <- RSS/df # Mean-Squared Error, "sigma-squared" in lm()
    # RMSE <- sqrt(MSE) #Residual mean squared error, "sigma" in the lm()
    alpha <- sqrt(df*MSE/rchisq(num, df=df))
  
  list(
       simulations = coef,    
       alpha = alpha
       )
}



