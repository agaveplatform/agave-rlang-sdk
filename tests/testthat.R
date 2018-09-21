library(testthat)
library(httr)
library(plyr)
library(rAgave)


check_api <- function() {
  if (not_working()) {
    skip("API not available")
  }
}

test_check("rAgave")
