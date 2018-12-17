% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/group_map.R
\name{group_map}
\alias{group_map}
\title{Apply a function to each group}
\usage{
group_map(.tbl, .f, ..., keep = FALSE)
}
\arguments{
\item{.tbl}{A grouped tibble}

\item{.f}{A function or formula to apply to each group. It must return a data frame.

If a \strong{function}, it is used as is. It should have at least 2 formal arguments.

If a \strong{formula}, e.g. \code{~ head(.x)}, it is converted to a function. In the formula,
you can use \code{.} or \code{.x} to refer to the subset of rows of \code{.tbl}
for the given group, and \code{.y} to refer to the key, a one row tibble that
identify the group}

\item{...}{Additional arguments passed on to \code{.f}}

\item{keep}{Should \code{.x} contain the grouping variables}
}
\value{
The function specified in \code{.f} is called on each group, and the data frames
are combined with \code{\link[=bind_rows]{bind_rows()}}
}
\description{
\badgeexperimental
}
\examples{
mtcars \%>\%
  group_by(cyl) \%>\%
  group_map(~ head(.x, 2L))

iris \%>\%
  group_by(Species) \%>\%
  filter(Species == "setosa") \%>\%
  group_map(~ tally(.x))

}
\seealso{
\code{\link[=group_split]{group_split()}} and \code{\link[=group_keys]{group_keys()}}

Other grouping functions: \code{\link{group_by_all}},
  \code{\link{group_by}}, \code{\link{group_indices}},
  \code{\link{group_nest}}, \code{\link{group_rows}},
  \code{\link{group_size}}, \code{\link{groups}}
}
\concept{grouping functions}