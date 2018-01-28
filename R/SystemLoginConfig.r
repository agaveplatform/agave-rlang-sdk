# Agave Platform Science API
# 
# Power your digital lab and reduce the time from theory to discovery using the Agave Science-as-a-Service API Platform. Agave provides hosted services that allow researchers to manage data, conduct experiments, and publish and share results from anywhere at any time.
# 
# OpenAPI spec version: 2.1.11
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git


#' SystemLoginConfig Class
#'
#' @field auth 
#' @field host 
#' @field port 
#' @field protocol 
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
SystemLoginConfig <- R6::R6Class(
  'SystemLoginConfig',
  public = list(
    `auth` = NULL,
    `host` = NULL,
    `port` = NULL,
    `protocol` = NULL,
    initialize = function(`auth`, `host`, `port`, `protocol`){
      if (!missing(`auth`)) {
        stopifnot(R6::is.R6(`auth`))
        self$`auth` <- `auth`
      }
      if (!missing(`host`)) {
        stopifnot(is.character(`host`), length(`host`) == 1)
        self$`host` <- `host`
      }
      if (!missing(`port`)) {
        stopifnot(is.numeric(`port`), length(`port`) == 1)
        self$`port` <- `port`
      }
      if (!missing(`protocol`)) {
        stopifnot(R6::is.R6(`protocol`))
        self$`protocol` <- `protocol`
      }
    },
    toJSON = function() {
      SystemLoginConfigObject <- list()
      if (!is.null(self$`auth`)) {
        SystemLoginConfigObject[['auth']] <- self$`auth`$toJSON()
      }
      if (!is.null(self$`host`)) {
        SystemLoginConfigObject[['host']] <- self$`host`
      }
      if (!is.null(self$`port`)) {
        SystemLoginConfigObject[['port']] <- self$`port`
      }
      if (!is.null(self$`protocol`)) {
        SystemLoginConfigObject[['protocol']] <- self$`protocol`$toJSON()
      }

      SystemLoginConfigObject
    },
    fromJSON = function(SystemLoginConfigObject) {
      if (!is.null(SystemLoginConfigObject$`auth`)) {
        authObject <- SystemAuthConfig$new()
        authObject$fromJSON(jsonlite::toJSON(SystemLoginConfigObject$auth, auto_unbox = TRUE))
        self$`auth` <- authObject
      }
      if (!is.null(SystemLoginConfigObject$`host`)) {
        self$`host` <- SystemLoginConfigObject$`host`
      }
      if (!is.null(SystemLoginConfigObject$`port`)) {
        self$`port` <- SystemLoginConfigObject$`port`
      }
      if (!is.null(SystemLoginConfigObject$`protocol`)) {
        protocolObject <- SystemLoginProtocolType$new()
        protocolObject$fromJSON(jsonlite::toJSON(SystemLoginConfigObject$protocol, auto_unbox = TRUE))
        self$`protocol` <- protocolObject
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "auth": %s,
           "host": %s,
           "port": %d,
           "protocol": %s
        }',
        self$`auth`$toJSON(),
        self$`host`,
        self$`port`,
        self$`protocol`$toJSON()
      )
    },
    fromJSONString = function(SystemLoginConfigJson) {
      SystemLoginConfigObject <- jsonlite::fromJSON(SystemLoginConfigJson)
      SystemAuthConfigObject <- SystemAuthConfig$new()
      self$`auth` <- SystemAuthConfigObject$fromJSON(jsonlite::toJSON(SystemLoginConfigObject$auth, auto_unbox = TRUE))
      self$`host` <- SystemLoginConfigObject$`host`
      self$`port` <- SystemLoginConfigObject$`port`
      SystemLoginProtocolTypeObject <- SystemLoginProtocolType$new()
      self$`protocol` <- SystemLoginProtocolTypeObject$fromJSON(jsonlite::toJSON(SystemLoginConfigObject$protocol, auto_unbox = TRUE))
    }
  )
)
