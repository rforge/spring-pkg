\docType{methods}
\name{pen.crit}
\alias{pen.crit}
\alias{pencrit,spring-method}
\title{Penalized criteria based on estimation of degrees of freedom}
\usage{
pen.crit(object, penalty=setNames(c(2, log(N)), c("AIC","BIC")))
}
\arguments{
  \item{object}{A list or a single object with class
  \code{spring}. Typically, an output of the \code{spring}
  fitting function.}

  \item{penalty}{a vector with as many penalties a desired.
  The default contains the penalty corresponding to the AIC
  and the BIC (\eqn{2}{2} and \eqn{\log(n)}{log(n)}).
  Setting the "names" attribute, as done in the default
  definition, leads to outputs which are easier to read.}
}
\value{
A list of object with class \code{criterion} for which a
plot is available.
}
\description{
Send back the values of some penalized criteria accompanied
with the vector(s) of parameters selected accordingly. The
default behavior recover AIC and BIC (with respective
factor \eqn{2}{2} and \eqn{\log(n)}{log(n)}) yet the user
can specify any penalty.
}
\references{
Ryan Tibshirani and Jonathan Taylor. Degrees of freedom in
lasso problems, Annals of Statistics, 40(2) 2012.
}
\seealso{
\code{\linkS4class{spring}}.
}

