#' Create a wrapper for the pmodel.response.pFormula function
#' 
#' DESCRIPTION TEXT
#' @S3method pmodel.response Formula
#' @param obj a ``Formula'' object 
#' @param ... parameters to pass to pmodel.response
#' @return the exact result of a call to pmodel.response.pFormula(obj, ...)

pmodel.response.Formula <- function (obj, ...) {
  plm:::pmodel.response.pFormula(obj, ...)
}
