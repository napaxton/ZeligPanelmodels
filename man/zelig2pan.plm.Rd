\name{zelig2pan.plm}
\alias{zelig2pan.plm}
\title{Interface between the Zelig Model plm and
the Pre-existing Model-fitting Method}
\usage{
  zelig2pan.plm(formula, pan.model = NULL,
    pan.index = NULL, ..., data)
}
\arguments{
  \item{formula}{a formula}

  \item{pan.model}{the choice of which sort of effects
  included: pooled, fixed, random, betweem}

  \item{pan.index}{a vector c("unit","time") indicating the
  unit and time index variables}

  \item{...}{additonal parameters}

  \item{data}{a data.frame}
}
\value{
  a list specifying '.function'
}
\description{
  Interface between the Zelig Model plm and the
  Pre-existing Model-fitting Method
}

