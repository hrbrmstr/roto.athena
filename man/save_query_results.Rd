% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/save-query-results.R
\name{save_query_results}
\alias{save_query_results}
\title{Save Query Results to Disk}
\usage{
save_query_results(query_execution_id, filename, aws_access_key_id = NULL,
  aws_secret_access_key = NULL, aws_session_token = NULL,
  region_name = NULL, profile_name = NULL)
}
\arguments{
\item{query_execution_id}{unique ID of the query execution.}

\item{filename}{download location of the athena result}

\item{aws_access_key_id}{AWS access key id}

\item{aws_secret_access_key}{AWS secret access key}

\item{aws_session_token}{AWS session token}

\item{region_name}{region name}

\item{profile_name}{profile name}
}
\value{
the filename
}
\description{
Downloadsthe results of a single query execution specified by
\code{query_execution_id} to \code{filename}. This request does not execute
the query but returns results. Use \code{\link[=start_query_execution]{start_query_execution()}} to run a query.
}
\details{
This is useful for downloading large results where it is undesireable
to load the full dataset into memory.
}
\examples{
\dontrun{
start_query_execution(
  query = "SELECT * FROM elb_logs LIMIT 100",
  database = "sampledb",
  output_location = "s3://aws-athena-query-results-redacted",
  profile = "personal"
) -> sqe

# wait a bit

save_query_results(sqe, filename)
}
}
\references{
\url{https://boto3.readthedocs.io/en/latest/reference/services/athena.html#Athena.Client.get_query_results}
}
