\name{mC.ss}
\alias{mC.ss}
\alias{xx.ss}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Create environment for mc-fitting}
\description{
  Creates an environment for mc-fitting. These functions are transitory,
  hence the strange names.
}
\usage{
mC.ss(spec, \dots)

xx.ss(period, type.eigval, n.root, eigabs, eigsign, co_r, co_arg, 
      init = NULL, len.block = NULL, mo.col, generators = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{spec}{a model, an object of class mcSpec.}
  \item{\dots}{further arguments to be passed on to \code{xx.ss}.}
  \item{period}{the number of seasons.}
  \item{type.eigval}{types of the eigenvalues, a character vector with
      elements "r" or "cp", see Details.}
  \item{n.root}{number of roots. Currently the dimension of the matrix
      is set to this.}
  \item{eigabs}{The absolute values/moduli of the eigenvalues, numeric vector.}
  \item{eigsign}{The signs/moduli of the eigenvalues.}
  \item{co_r}{similar to \code{eigabs} but for the co parameters.}
  \item{co_arg}{similar to \code{eigsign} but for the co parameters.}
  \item{init}{
    initial values, see Details.
  }
  \item{len.block}{lengths of Jordan blocks.}
  \item{mo.col}{last non-zero column in the top of the matrix.}
  \item{generators}{~~ TODO: describe this argument. ~~}
}
\details{
  \code{mC.ss} takes the specification of the model as an object of
  class mcSpec and calls \code{xx.ss}.

  Basically, the value returned by these functions is an extended
  model specification together with an environment which can be used for
  fitting the model, exploring the results and trying various things.
  This may be used for getting better understanding of the model and the
  optimisation routines.

  The result of both functions is a list, containing several functions
  and an environment. The environment (element \code{env}) is the most
  important element since it allows access to everything in the model
  environment. The function elements of the list are simply a
  convenience.

  Several functions in \code{env} are available for fitting the
  model. Currently these are \code{minim}, \code{minimBB} and
  \code{minimBBlu}. The first argument of all these functions is a time
  series to which the model is to be fitted. By default, a conditional
  likelihood is being optimised. To base the optimisation on conditional
  sum of squares, set argument \code{CONDLIK} to FALSE.  The remaining
  arguments in a call to any of the above functions are passed on to the
  corresponding optimisation routine (whose help page should be
  consulted for details).

  \code{minim} uses the core \R function \code{optim}.
  \code{minimBB} and \code{minimBBlu} use \code{BBoptim} from package
  \code{BB}. They result is a list, as returned by the corresponding
  optimisation function with the optimal parameters  in element
  \code{par}. The elements of this vector are named to help somewhat in
  its interpretation but complete information about the fitted model can
  be obtained from the environment.

  Firstly, at the end of the optimisation, the optimal parameters and
  other information are stored in \code{env}. If the same call (maybe
  with modified instructions for the optimisation) is repeated, these
  parameters will be used as initial values for a new optimisation
  run. This may be useful, for example, if the previous run didn't
  converge.

  Secondly, properties of the fitted model and more useful
  representations can be obtained using functions in the environment or
  the convinience functions in the list returned by \code{xx.ss}.

  \code{optparam2mcparam} converts a vector of parameters into the
  more familiar filter representation, where the i-th row contains the
  coefficients for the i-th season. This function takes one argument the
  vector of parameters, e.g. the one returned by the fitting
  functions. It updates a number of variables in \code{env}, computes
  the filter representation of the model and stores it in
  \code{wrkmodel}. It returns NULL.
  This function may be used for exploratory purposes or to set new
  values for the parameters, e.g. to be used as starting values for a
  new optimisation run.

  \code{mcparam2optparam} does the opposite. It converts the current
  model in \code{env} to a vector of parameter. This function does not
  have arguments.

  \code{mclik} computes the value of the conditional likelihood for
  given parameters. Its first argument is a time series, the second is a
  vector of parameters and the third is a vector of innovations. Only
  the first argument is compulsory. If \code{param} is not supplied, the
  current parameters in \code{env} are used. Otherwise, they are updated
  with the new parameters and then used. The innovations default to the
  zero vector.
  \code{mcss} is similar but computes the conditional sum of squares.

  \strong{Argument \code{init}} can be used to provide initial
  values. If it is missing or NULL, random initial values are generated
  for the free parameters.
  \code{init} may also be a numeric vector suitable for the call
  \code{optparam2mcparam(init)}, see above. This vector would typically
  come from a previous optimisation run.

  \code{init} may also be a list with elements \code{"eigabs"},
  \code{"eigsign"}, \code{"co_r"}, \code{"co_abs"}. These components
  have the same meaning as the corresponding arguments of \code{xx.ss}.

  \strong{TODO: more is needed here!}

}
\value{
  A list with the following components:
  \item{fmcss}{a function to compute the sum of squares for a model.}
  \item{fparamvec}{a function to convert mc-parameters to optimisation
      parameters.}
  \item{fmcparam}{a function to convert optimisation parameters to
      mc-parameters.}
  \item{env}{an object of class \code{environment}}
}
\references{
  \insertRef{boshnakov2009gen}{pcts}
}
\author{Georgi N. Boshnakov}
% \note{
% %%  ~~further notes~~
% }

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
  \code{\link{xx.ss}} which is called by \code{mC.ss}
}
\examples{
# test0 roots
spec.coz2 <- mcompanion::mcSpec(dim = 5, mo = 4, root1 = c(1,1), order = rep(2,4))
spec.coz2
xxcoz2a <- mC.ss(spec.coz2)

## test0 roots
spec.coz4 <- mcompanion::mcSpec(dim = 5, mo = 4, root1 = c(1,1), order = rep(3,4))
xxcoz4a <- mC.ss(spec.coz4)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ pcts }
\keyword{ torevise }
