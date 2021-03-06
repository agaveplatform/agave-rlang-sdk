% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/TransferTaskProgressSummary.r
\docType{data}
\name{TransferTaskProgressSummary}
\alias{TransferTaskProgressSummary}
\title{TransferTaskProgressSummary Class}
\format{An object of class \code{R6ClassGenerator} of length 24.}
\usage{
TransferTaskProgressSummary
}
\description{
This represents a rollup of a data transfer operation.
}
\section{Fields}{

\describe{
\item{\code{averageRate}}{Average transfer rate in bytes/sec}

\item{\code{source}}{The source URL of the transfer operation}

\item{\code{totalActiveTransfers}}{The number of concurrent transfers behind this transfer task}

\item{\code{totalBytes}}{The total number of bytes to be transferred}

\item{\code{totalBytesTransferred}}{The total number of bytes transferred thus far}

\item{\code{totalFiles}}{The total number of files transferred to date}

\item{\code{uuid}}{The id of the transfer task associated with this object}
}}

\keyword{datasets}
