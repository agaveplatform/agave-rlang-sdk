context("test_Agave.R")
library(testthat)
library(httr)
library(plyr)
library(rAgave)
library(futile.logger)

# test empty constructor
test_that("Agave object should initialize",{

  Sys.setenv(AGAVE_TENANT_BASE_URL="https://sandbox.agaveplatform.org")

  api<-Agave$new(
        baseUrl="https://sandbox.agaveplatform.org",
		cacheDir="/tmp",
        username="test",
        password="test",
        clientKey=NULL,
        clientSecret=NULL,
        accessToken="foo",
        refreshToken=NULL,
        responseType="list",
        logLevel=DEBUG,
        logFilePath="agave.log",
        verify=FALSE)
  
  expect_type(api$tokenInfo, "environment")
  expect_equal(api$tokenInfo$username, "testuser", "Username was not assigned")
  expect_equal(api$tenantInfo$code, "sandbox", "Tenant code was not assigned")
  expect_equal(api$tenantInfo$baseUrl, "https://sandbox.agaveplatform.org", "Base url was not assigned")
})


# # test empty constructor
# test_that("Agave object should fail to initialize",{
#   baseUrl <- "https://sandbox.agaveplatform.org"
#   cacheDir <- "/tmp"
#   username <- NULL
#   password <- NULL
#   clientKey <- NULL
#   clientSecret <- NULL
#   accessToken <- NULL
#   refreshToken <- NULL
#   responseType <- "list"
#   logLevel <- DEBUG
#   logFilePath <- "agave.log"
#   verify <- FALSE
#
#   expect_error(Agave$new(baseUrl,
#       cacheDir=cacheDir,
#       username=username,
#       password=password,clientKey=clientKey,clientSecret=clientSecret,accessToken=accessToken,refreshToken=refreshToken,
# 				responseType=responseType,
# 				logLevel=logLevel,
# 				logFilePath=logFilePath,
# 				verify=verify),
# 				"Missing credentials")
# })
