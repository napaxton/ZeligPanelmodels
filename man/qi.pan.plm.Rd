\name{qi.pan.plm}
\alias{qi.pan.plm}
\title{Compute quantities of interest for 'pan.plm' Zelig models}
\usage{
  \method{qi}{pan.plm}(obj, x=NULL, x1=NULL, y=NULL, num=1000, param=NULL)
}
\arguments{
  \item{obj}{a 'zelig' object}

  \item{x}{a 'setx' object or NULL}

  \item{x1}{an optional 'setx' object}

  \item{y}{this parameter is reserved for simulating
  average treatment effects, though this feature is
  currently supported by only a handful of models}

  \item{num}{an integer specifying the number of
  simulations to compute}

  \item{param}{a parameters object}
}
\value{
  a list of key-value pairs specifying pairing titles of
  quantities of interest with their simulations
}
\description{
  Compute quantities of interest for 'pan.plm' Zelig models
}
\author{
  Nathan A. Paxton \email{napaxton@post.harvard.edu}
}


