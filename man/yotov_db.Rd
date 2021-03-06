% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/connections.R
\name{yotov_db}
\alias{yotov_db}
\title{The local Yotov database}
\usage{
yotov_db(dbdir = yotov_path())
}
\arguments{
\item{dbdir}{The location of the database on disk. Defaults to
\code{yotovdb} under \code{\link[rappdirs:user_data_dir]{rappdirs::user_data_dir()}}, or the environment variable \code{yotov_DB_DIR}.}
}
\description{
Returns a connection to the local yotov database. This is a DBI-compliant
duckdb database connection. When using \strong{dplyr}-based
workflows, one typically accesses tables with \code{\link[=yotov_data]{yotov_data()}}, but this
function lets the user interact with the database directly via SQL.
}
\examples{
if (yotov_status()) {
  DBI::dbListTables(yotov_db())

  ch1_application1 <- DBI::dbReadTable(yotov_db(), "ch1_application1")

  DBI::dbGetQuery(
    yotov_db(),
    "SELECT * FROM ch1_application1"
  )
}
}
