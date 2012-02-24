\name{zelig2pan.plm}
\alias{zelig2pan.plm}
\title{Interface between plm model and Zelig
This function is exclusively for use by the `zelig' function}
\usage{
  zelig2pan.plm(formula,pan.model=NULL, pan.index=NULL,..., data)
}
\arguments{
  \item{formula}{a formula}

  \item{pan.model}{}

  \item{pan.index}{}

  \item{...}{ignored parameters}

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