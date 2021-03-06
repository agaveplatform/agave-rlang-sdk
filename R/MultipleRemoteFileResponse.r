# Agave Platform Science API
#
# Power your digital lab and reduce the time from theory to discovery using the Agave Science-as-a-Service API Platform. Agave provides hosted services that allow researchers to manage data, conduct experiments, and publish and share results from anywhere at any time.
#
# Agave Platform version: 2.2.14
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git


#' MultipleRemoteFileResponse Class
#'
#' 
#'
#' @field message success or failure
#' @field result response body
#' @field status success or failure
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
MultipleRemoteFileResponse <- R6::R6Class(
  'MultipleRemoteFileResponse',
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
        stopifnot(is.list(`result`), length(`result`) != 0)
        lapply(`result`, function(x) stopifnot(R6::is.R6(x)))
        self$`result` <- `result`
      }
      if (!missing(`status`)) {
        stopifnot(is.character(`status`), length(`status`) == 1)
        self$`status` <- `status`
      }
    },
    asJSON = function() {
      self$toJSON()
    },
    toJSON = function() {
      MultipleRemoteFileResponseObject <- list()
      if (!is.null(self$`message`)) {
        MultipleRemoteFileResponseObject[['message']] <- self$`message`
      }
      else {
        MultipleRemoteFileResponseObject[['message']] <- NULL
      }
      if (!is.null(self$`result`)) {
        MultipleRemoteFileResponseObject[['result']] <- lapply(self$`result`, function(x) x$toJSON())
      }
      else {
        MultipleRemoteFileResponseObject[['result']] <- NULL
      }
      if (!is.null(self$`status`)) {
        MultipleRemoteFileResponseObject[['status']] <- self$`status`
      }
      else {
        MultipleRemoteFileResponseObject[['status']] <- NULL
      }

      MultipleRemoteFileResponseObject
    },
    fromJSON = function(MultipleRemoteFileResponseObject) {
      if (is.character(MultipleRemoteFileResponseObject)) {
        MultipleRemoteFileResponseObject <- jsonlite::fromJSON(MultipleRemoteFileResponseJson)
      }

      if ("result" %in% names(MultipleRemoteFileResponseObject)) {
        MultipleRemoteFileResponseObject <- MultipleRemoteFileResponseObject$result
      }

      if (!is.null(MultipleRemoteFileResponseObject$`message`)) {
        self$`message` <- MultipleRemoteFileResponseObject$`message`
      }
      if (!is.null(MultipleRemoteFileResponseObject$`result`)) {
        self$`result` <- lapply(MultipleRemoteFileResponseObject$`result`, function(x) {
          resultObject <- FileInfo$new()
          resultObject$fromJSON(jsonlite::toJSON(x, auto_unbox = TRUE))
          resultObject
        })
      }
      if (!is.null(MultipleRemoteFileResponseObject$`status`)) {
        self$`status` <- MultipleRemoteFileResponseObject$`status`
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "message": %s,
           "result": [%s],
           "status": %s
        }',
        ifelse( is.null(self$`message`),"null",paste0(c('"', self$`message`, '"'))),
        lapply(self$`result`, function(x) paste(x$toJSON(), sep=",")),
        ifelse( is.null(self$`status`),"null",paste0(c('"', self$`status`, '"')))
      )
    },
    fromJSONString = function(MultipleRemoteFileResponseJson) {
      MultipleRemoteFileResponseObject <- jsonlite::fromJSON(MultipleRemoteFileResponseJson)
      self::fromJSON(MultipleRemoteFileResponseObject)

    }
  )
)
