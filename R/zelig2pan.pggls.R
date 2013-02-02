#' Interface between the Zelig Model pggls and 
#' the Pre-existing Model-fitting Method, i.e., plm::pggls
#' @param formula a formula
#' @param pan.model the choice of which sort of effects included: pooled, fixed, random, betweem
#' @param pan.index a vector c("unit","time") indicating the unit and time index variables
#' @param ... additonal parameters
#' @param data a data.frame 
#' @return a list specifying '.function'
#' @export
zelig2pan.pggls <- function(formula, pan.model=NULL, pan.index=NULL,..., data) {
    if(!is.null(pan.index)){    #Checking to see if TS and CS indices have been set
        data <- pdata.frame(data, pan.index) 
    }
    else {
        warning("Data frame had no time or cross-sectional index specified;",
                "you may have already set them with 'pdata.frame()'. ",
                "Zelig will use {plm} package default behavior. Please make sure this is what you wanted."
        ) 
    }
    if(!is.null(pan.model)){    #check to make sure that fixed/random/between, etc. is set
        model <- pan.model 
    }
    else{
        model <- NULL
        warning("No panel model (within, random, pooled, between, etc.) specified.",
            "{plm} package chooses within/fixed effects as the default model.")
    }            
    
    list(
        .function = "pggls",
        .hook = "pFormulaFix",
        formula = formula,
        model = model,
        data = data
    )
}

#' PLM HOOK
#' Recast the plm object from pFormula class to Formula class
#' 
#' @param obj ...
#' @param zcall ..
#' @param call ...
#' @return ...
#' @export
pFormulaFix <- function(obj, zcall, call, ...) {                                                                                                       
    # class(obj$formula) <- c("Formula", "formula")                                                        
    obj$call <- call
    obj                                                                                                  
}
