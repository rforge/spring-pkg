\name{spring}
\alias{spring}
\title{Adjust a multivariate regression with structuring, sparse penalty.}
\usage{
spring(x, y, lambda1 = NULL, lambda2 = c(1, 0.1, 0.01, 0.001),
  struct = sparseMatrix(i = 1:p, j = 1:p, x = rep(1, p)), cov = NULL,
  intercept = TRUE, normalize = FALSE, threshold = 0.001,
  max.iter = 100, verbose = ifelse(length(lambda2) > 1, 1, 2),
  min.ratio = 0.01, nlambda1 = ifelse(is.null(lambda1), ifelse(is.null(cov),
  10, 50), length(lambda1)), mc.cores = min(length(lambda2), detectCores()))
}
\arguments{
  \item{x}{matrix of features. Do NOT include intercept.}

  \item{y}{matrix of responses.}

  \item{lambda1}{sequence of decreasing
  \eqn{\ell_1}{l1}-penalty levels. If \code{NULL} (the
  default), a vector is generated with \code{nlambda1}
  entries, starting from a guessed level \code{lambda1.max}
  where only the intercept is included, then shrunken to
  \code{min.ratio*lambda1.max}.}

  \item{lambda2}{real scalar; tunes the \eqn{\ell_2}{l2}
  structuring penalty in the Elastic-net. Default is 0.05.}

  \item{struct}{matrix structuring the coefficients,
  possibly sparsely encoded. If \code{NULL} (the default),
  the identity matrix is used. See details below.}

  \item{intercept}{logical; indicates if a vector of
  intercepts should be included in the model. Default is
  \code{TRUE}.}

  \item{normalize}{logical; indicates if predictor
  variables should be normalized to have unit L2 norm
  before fitting.  Default is \code{TRUE}.}

  \item{cov}{the matrix of variance-covariance between the
  reponses y. If \code{NULL} (the default), will be
  inferred.}

  \item{nlambda1}{integer that indicates the number of
  values to put in the \code{lambda1} vector.  Ignored if
  \code{lambda1} is provided.}

  \item{min.ratio}{minimal value of \eqn{\ell_1}{l1}-part
  of the penalty that will be tried, as a fraction of the
  maximal \code{lambda1} value. A too small value might
  lead to unstability at the end of the solution path
  corresponding to small \code{lambda1} combined with
  \eqn{\lambda_2=0}{lambda2=0}.  The default value tries to
  avoid this, adapting to the '\eqn{n<p}{n<p}' context.
  Ignored if \code{lambda1} is provided.}

  \item{verbose}{integer; activate verbose mode from '0'
  (nothing) to '2' (detailed output).}

  \item{max.iter}{integer; the maximal number of iteration
  (i.e. number of alternated optimization between each
  parameter) used to solve the problem for a given value of
  lambda1. Default is 100}

  \item{threshold}{a threshold for convergence for each
  \code{lambda1}. The algorithm stops the alternate scheme
  when the norm of two successive values of the parameters
  the is below this threshold. Default is \code{1e-3}.}

  \item{mc.cores}{if \code{lambda2} is a vector, spring is
  run in parallel: the default is to use as many core as
  there are entries in \code{lambda2}, limited by the
  physical nulber of cores itself.}
}
\value{
an object with class \code{spring}, see the documentation
page \code{\linkS4class{spring}} for details.
}
\description{
Adjust a multivariate regression with structuring, sparse
penalty.
}
\seealso{
See also \code{\linkS4class{spring}} and
\code{\link{cv.spring}}.
}
\keyword{models,}
\keyword{regression}

