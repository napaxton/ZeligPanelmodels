#' Create a wrapper for the pmodel.response.pFormula function
#' 
#' DESCRIPTION TEXT
#' @S3method pmodel.response Formula
#' @param object a ``Formula'' object 
#' @param ... parameters to pass to pmodel.response
#' @return the exact result of a call to pmodel.response.pFormula(obj, ...)

pmodel.response.Formula <- function (object, ...) {
  plm:::pmodel.response.pFormula(obj, ...)
}
