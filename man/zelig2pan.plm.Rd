\name{zelig2pan.plm}
\alias{zelig2pan.plm}
\title{Interface between plm model and Zelig
This function is exclusively for use by the `zelig' function}
\usage{
  zelig2pan.plm(formula,pan.model=NULL, pan.index=NULL,..., data)
}
\arguments{
  \item{formula}{a formula}

  \item{pan.model}{the panel model method, with options "within","random","ht","between","pooling","fd"}

  \item{pan.index}{argument to indicate individual and time indices. Generally this is in the form \code{pan.index = c("individual","time")}}

  \item{...}{other parameters that zelig ignores, but which plm may use (including random effects methods, instrumental variable transformations, etc. See plm package documentation for further details.)}

  \item{data}{a data.frame}
}
\value{
  a list to be coerced into a zelig.call object
}
\description{
  Interface between plm() model and Zelig This function is
  exclusively for use by the `zelig' function
}
\author{
  Nathan A. Paxton \email{napaxton@post.harvard.edu}
}