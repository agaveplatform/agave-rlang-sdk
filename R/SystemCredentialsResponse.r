# Agave Platform Science API
# 
# Power your digital lab and reduce the time from theory to discovery using the Agave Science-as-a-Service API Platform. Agave provides hosted services that allow researchers to manage data, conduct experiments, and publish and share results from anywhere at any time.
# 
# OpenAPI spec version: 2.1.11
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git


#' SystemCredentialsResponse Class
#'
#' @field message 
#' @field result 
#' @field status 
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
SystemCredentialsResponse <- R6::R6Class(
  'SystemCredentialsResponse',
  public = list(
    `message` = NULL,
    `result` = NULL,
    `status` = NULL,
    initialize = function(`message`, `result`, `status`){
      if (!missing(`message`)) {
        stopifnot(is.character(`message`), length(`message`) == 1)
        self$`message` <- `message`
      }
      if (!missing(`result`)) {
        stopifnot(R6::is.R6(`result`))
        self$`result` <- `result`
      }
      if (!missing(`status`)) {
        stopifnot(is.character(`status`), length(`status`) == 1)
        self$`status` <- `status`
      }
    },
    toJSON = function() {
      SystemCredentialsResponseObject <- list()
      if (!is.null(self$`message`)) {
        SystemCredentialsResponseObject[['message']] <- self$`message`
      }
      if (!is.null(self$`result`)) {
        SystemCredentialsResponseObject[['result']] <- self$`result`$toJSON()
      }
      if (!is.null(self$`status`)) {
        SystemCredentialsResponseObject[['status']] <- self$`status`
      }

      SystemCredentialsResponseObject
    },
    fromJSON = function(SystemCredentialsResponseObject) {
      if (!is.null(SystemCredentialsResponseObject$`message`)) {
        self$`message` <- SystemCredentialsResponseObject$`message`
      }
      if (!is.null(SystemCredentialsResponseObject$`result`)) {
        resultObject <- SystemCredential$new()
        resultObject$fromJSON(jsonlite::toJSON(SystemCredentialsResponseObject$result, auto_unbox = TRUE))
        self$`result` <- resultObject
      }
      if (!is.null(SystemCredentialsResponseObject$`status`)) {
        self$`status` <- SystemCredentialsResponseObject$`status`
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "message": %s,
           "result": %s,
           "status": %s
        }',
        self$`message`,
        self$`result`$toJSON(),
        self$`status`
      )
    },
    fromJSONString = function(SystemCredentialsResponseJson) {
      SystemCredentialsResponseObject <- jsonlite::fromJSON(SystemCredentialsResponseJson)
      self$`message` <- SystemCredentialsResponseObject$`message`
      SystemCredentialObject <- SystemCredential$new()
      self$`result` <- SystemCredentialObject$fromJSON(jsonlite::toJSON(SystemCredentialsResponseObject$result, auto_unbox = TRUE))
      self$`status` <- SystemCredentialsResponseObject$`status`
    }
  )
)
