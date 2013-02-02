#' Compute Quantities of Interest for the Zelig Model pggls
#' @param obj a zelig object
#' @param x a setx object
#' @param x1 an optional setx object
#' @param y this parameter is reserved for simulating average treatment effects,
#'   though this feature is currently supported by only a handful of models
#' @param num an integer specifying the number of simulations to compute
#' @param param a parameters object
#' @return a list of key-value pairs specifying pairing titles of quantities of
#' interest with their simulations
#' @export
qi.pan.pggls <- function(obj, x=NULL, x1=NULL, y=NULL, num=1000, param=NULL) {     
    # Get simulated (??) parameters of the linear function... usually stylized as
    # a beta
    coef <- param$simulations   #was 'param$coefficients, butthe param.pan.pggls returns a list with elements (simulations, alpha)
    
    # Get the number of the parameters fit (fitted?) by the linear model
    # number.of.parameters <- length(coef(obj))
    
    # Get ancillary parameters... usually stylized as an alpha
    alpha <- alpha(param) # alpha <- simpar[,ncol(simpar)]
    
    # Get predictor terms. Note that this function is defined at the bottom of
    # this page. Additionally, note the only difference between function calls is
    # the last parameter.
    tx1 <- makePredictorTermMatrix(formula(obj), obj$data, x)
    tx2 <- makePredictorTermMatrix(formula(obj), obj$data, x1)
    
    
    # NOTE: The following is probably not correct. Check "compute.ev" to make sure
    # that everything is working smoothly.
    
    # Expected values
    ev1 <- compute.ev(param$coefficients, tx1)
    ev2 <- compute.ev(param$coefficients, tx2)
    
    # Compute *predicted values* here
    # ...
    # pr2 <- compute.pr(ev2,alpha)
    # pr1 <- matrix(NA, nrow=nrow(ev1), ncol=ncol(ev1))
    # for (i in 1:nrow(ev1)){
    # 	pr1[i,] <- rnorm(ncol(ev1), mean = ev1[i,], sd = alpha[i])	#might just be alpha
    # }
    
    # First-differences
    fd <- ev2 - ev1
    
    # Return simulations
    list(
        "Expected Value: E(Y|X)" = ev1 #,
        # "Expected Value: E(Y|X1)" = ev2,
        # "Predicted Value: Y|X" = pr1,
        # "Predicted Value Y|X1" = pr2,
        # "First Differences (Expected Values): E(Y|X1) - E(Y|X)" = fd
        # "Average Treatment Effect" = 
    )
}  

#' Compute Expected Values for pan.plm model
#' 
#' Computes expected values of the panel lm.
#' @note This function should remain *UNexported*
#' @param beta Simualted parameters from the fitted model
#' @param x Explanatory variables specified by the setx function
#' @return A numeric vector specifying the expected values of the derived from
#' the statistical model, its data, and the values specified by the setx method.
compute.ev <- function (beta, x) {
    # Return NA if x isn't valid
    if (is.null(x))
        return(NA)
    # Return the cross-multiplied value of the parameters and the predictor terms.
    beta %*% x 
}

#' Return a 1-row Design Matrix for Use in Predicting Outcome Values
#'
#' Returns a 1xN matrix where N is the number of columns in the *DESIGN* matrix
#' of the data-set. This matrix contains the values specified by the ``setx''
#' which are used in statistical simulation and predicting expected values of
#' this model.
#' @param formula a ``pFormula'' object specifying response and predictor
#' variables for the statistical model.
#' @param data a ``data.frame'' or ``pdata.frame'' object which was used by
#' the model-fitting function to find the fit
#' @param x a ``setx'' object which specifies the appropriate value to assign to
#' each variable
#' @return a vector/matrix to be used along with a design matrix to produce
#' expected/predicted values of the model
makePredictorTermMatrix <- function (formula, data, x) {
    
    # Return NULL if x is invalid
    if (is.null(x))
        return(NULL)
    
    # If the columns mismatch, give a warning that will explain the upcoming
    # error. Have no doubt about it. There will be an error.
    if (any(colnames(data) != colnames(x$updated))) {
        warning("Data frame used in 'x' has different column names than in the", 
                "fitted model.")
    }
    
    # Add the summarized data-set to the data-set.
    # Note that we must swap the first row of the data-set, instead of using:
    #   data <- rbind(x$updated, data)
    # because pmodel.matrix requires that the data-frame be the exact same size
    # as the original used in fitting the model.
    data[1, ] <- x$updated
    
    # Construct the design matrix. Note that, in a perfect world, we would be able
    # to write the following as:
    #   mm <- model.matrix(formula, x$updated)
    # This can't be done because of the implementation of "pmodel.matrix", where
    # certain columns' role as fixed, etc. is specified by variance(column) != 0
    # ... Clearly for a 1-row data.frame, variance is NA or 0.
    mm <- model.matrix(formula, data)
    
    # Return only the first row, since the other rows really hold no significance
    # for our purposes (statistical simulation and prediction). That is, creating
    # the complete model.matrix is merely a workaround for plm. This method will
    # be deprecated if/when plm is patched.
    mm[1, ]
}
