\name{qi.pan.plm}
\alias{qi.pan.plm}
\title{Compute Quantities of Interest for the Zelig Model plm}
\usage{

  \method{qi}{pan.plm}(obj, x = NULL, x1 = NULL, y = NULL,
    num = 1000, param = NULL)
}
\arguments{
  \item{obj}{a zelig object}

  \item{x}{a setx object}

  \item{x1}{an optional setx object}

  \item{y}{this parameter is reserved for simulating
  average treatment effects, though this feature is
  currentlysupported by only a handful of models}

  \item{num}{an integer specifying the number of
  simulations to compute}

  \item{param}{a parameters object}
}
\value{
  a list of key-value pairs specifying pairing titles of
  quantities of interest with their simulations
}
\description{
  Compute Quantities of Interest for the Zelig Model plm
}

