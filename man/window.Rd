\name{window}
\alias{window}
\alias{window.PeriodicTS}
\alias{window.PeriodicMTS}

\alias{na.trim}
\alias{na.trim.PeriodicTS}
\alias{na.trim.PeriodicMTS}
\alias{frequency.PeriodicTimeSeries}
\alias{deltat.PeriodicTimeSeries}
\alias{cycle.PeriodicTimeSeries}
\alias{time.PeriodicTimeSeries}
\alias{start.Cyclic}
\alias{end.Cyclic}

\title{Periodic methods for base R functions}
\description{

  Periodic methods for base R functions.

}
\usage{
\method{window}{PeriodicTS}(x, start = NULL, end = NULL, seasons = NULL, \dots)

\method{window}{PeriodicMTS}(x, start = NULL, end = NULL, seasons = NULL, \dots)

\method{na.trim}{PeriodicTS}(object, sides = c("both", "left", "right"), \dots)

\method{na.trim}{PeriodicMTS}(object, sides = c("both", "left", "right"), 
        is.na = c("any", "all"), \dots)

\method{frequency}{PeriodicTimeSeries}(x, \dots)

\method{deltat}{PeriodicTimeSeries}(x, \dots)

\method{cycle}{PeriodicTimeSeries}(x, \dots)

\method{time}{PeriodicTimeSeries}(x, offset = 0, \dots)

\method{start}{Cyclic}(x, \dots)

\method{end}{Cyclic}(x, \dots)
}
\arguments{
  \item{x,object}{an object from the indicated periodic class.}
  \item{start}{\code{numeric(2)}, start time.}
  \item{end}{\code{numeric(2)}, end time.}
  \item{seasons}{numeric, a subset of \code{1:nSeasons(x)}.}
  \item{\dots}{Not used by these methods.}
  \item{sides}{

    which side to trim: start (\code{"left"}), end (\code{"right"}), or
    both (\code{"both"}).

  }
  \item{is.na}{

    for multivariate time series: if \code{"all"}, the observation at
    time \eqn{t} will be considered missing only if all variables are
    \code{NA} at that time. Otherwise, if \code{"any"},  any variable
    with value \code{NA} will cause the observation at time \eqn{t} to
    be considered missing.
    
  }
  \item{offset}{currently ignored (:TODO:)}
}
\details{
  
  Periodic methods for base R and other common functions for
  manipulation of time series. These methods work analogoulsly to their
  base R cousins and only the differences, if any, are discussed below.

  
  \code{\link[stats]{window}} takes a part of \code{x}, preserving the
  class of the object. Argument \code{seasons} selects a subset of the
  seasons. 

  \code{\link[zoo]{na.trim}} is a function defined in package \pkg{zoo}
  and re-exported by \pkg{pcts}. It trims \code{NA}s from one or both
  ends of the time series, as requested by the arguments.  The arguments
  of the methods defined by \pkg{pcts} have the same meaning as those in
  \pkg{zoo}.
  
}
\value{

  for \code{window} and \code{na.trim}, 
  an object from the same class as the original, representing the
  requested part of the time series.

  for \code{frequency}, an integer number.

  for \code{deltat}, a number (1/frequency).

  for \code{cycle} and \code{time}, a \code{"PeriodicTS"} object.

  for \code{start} and \code{end}, time of first/last observation,
  encoded as a pair of numbers.

}
%\references{
%%% ~put references to the literature/web site here ~
%}
%\author{
%%%  ~~who you are~~
%}
%\note{
%%%  ~~further notes~~
%}
%
%%% ~Make other sections like Warning with \section{Warning }{....} ~
%
\seealso{

  \code{\link[stats]{window}},
  \code{\link[stats]{frequency}}, 
  \code{\link[zoo]{na.trim}} for details on what these functions do.

  \code{\link{availStart}} and \code{\link{availEnd}} give the times of
  the first and last non-NA observations.
  
}
\examples{
pres <- pcts(presidents)
head(pres, 8)
availStart(pres)

tail(pres, 12)
availEnd(pres)

## Q3 and Q4 only
presQ3Q4 <- window(pres, seasons = 3:4)
head(presQ3Q4)

identical(na.trim(pres),
          window(pres, start = availStart(pres), end = availEnd(pres)))
## TRUE
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
