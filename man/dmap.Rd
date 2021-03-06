% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dmap.R
\name{dmap}
\alias{dmap}
\alias{dmap_at}
\alias{dmap_if}
\title{Map over the columns of a data frame}
\usage{
dmap(.d, .f, ...)

dmap_at(.d, .at, .f, ...)

dmap_if(.d, .p, .f, ...)
}
\arguments{
\item{.d}{A data frame.}

\item{.f}{A function, formula, or atomic vector.

  If a \strong{function}, it is used as is.

  If a \strong{formula}, e.g. \code{~ .x + 2}, it is converted to a
  function with two arguments, \code{.x} or \code{.} and \code{.y}. This
  allows you to create very compact anonymous functions with up to
  two inputs.

  If \strong{character} or \strong{integer vector}, e.g. \code{"y"}, it
  is converted to an extractor function, \code{function(x) x[["y"]]}. To
  index deeply into a nested list, use multiple values; \code{c("x", "y")}
  is equivalent to \code{z[["x"]][["y"]]}.}

\item{...}{Additional arguments passed on to \code{.f}.}

\item{.at}{A character vector of names or a numeric vector of
positions. Only those elements corresponding to \code{.at} will be
modified.}

\item{.p}{A single predicate function, a formula describing such a
predicate function, or a logical vector of the same length as \code{.x}.
Alternatively, if the elements of \code{.x} are themselves lists of
objects, a string indicating the name of a logical element in the
inner lists. Only those elements where \code{.p} evaluates to
\code{TRUE} will be modified.}
}
\description{
\code{dmap()} is just like \code{\link{map}()} but always returns a
data frame. In addition, it handles grouped or sliced data frames.
}
\details{
\code{dmap_at()} and \code{dmap_if()} recycle length 1 vectors to
the group sizes.
}
\examples{
# dmap() always returns a data frame:
dmap(mtcars, summary)

# dmap() also supports sliced data frames:
sliced_df <- mtcars[1:5] \%>\% slice_rows("cyl")
sliced_df \%>\% dmap(mean)
sliced_df \%>\% dmap(~ .x / max(.x))

# This is equivalent to the combination of by_slice() and dmap()
# with 'rows' collation of results:
sliced_df \%>\% by_slice(dmap, mean, .collate = "rows")
}

