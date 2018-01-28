# Agave Platform Science API
# 
# Power your digital lab and reduce the time from theory to discovery using the Agave Science-as-a-Service API Platform. Agave provides hosted services that allow researchers to manage data, conduct experiments, and publish and share results from anywhere at any time.
# 
# OpenAPI spec version: 2.1.11
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git


#' ClientSubscriptionRequest Class
#'
#' @field apiName 
#' @field apiProvider 
#' @field apiVersion 
#' @field tier 
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
ClientSubscriptionRequest <- R6::R6Class(
  'ClientSubscriptionRequest',
  public = list(
    `apiName` = NULL,
    `apiProvider` = NULL,
    `apiVersion` = NULL,
    `tier` = NULL,
    initialize = function(`apiName`, `apiProvider`, `apiVersion`, `tier`){
      if (!missing(`apiName`)) {
        stopifnot(is.character(`apiName`), length(`apiName`) == 1)
        self$`apiName` <- `apiName`
      }
      if (!missing(`apiProvider`)) {
        stopifnot(is.character(`apiProvider`), length(`apiProvider`) == 1)
        self$`apiProvider` <- `apiProvider`
      }
      if (!missing(`apiVersion`)) {
        stopifnot(is.character(`apiVersion`), length(`apiVersion`) == 1)
        self$`apiVersion` <- `apiVersion`
      }
      if (!missing(`tier`)) {
        stopifnot(R6::is.R6(`tier`))
        self$`tier` <- `tier`
      }
    },
    toJSON = function() {
      ClientSubscriptionRequestObject <- list()
      if (!is.null(self$`apiName`)) {
        ClientSubscriptionRequestObject[['apiName']] <- self$`apiName`
      }
      if (!is.null(self$`apiProvider`)) {
        ClientSubscriptionRequestObject[['apiProvider']] <- self$`apiProvider`
      }
      if (!is.null(self$`apiVersion`)) {
        ClientSubscriptionRequestObject[['apiVersion']] <- self$`apiVersion`
      }
      if (!is.null(self$`tier`)) {
        ClientSubscriptionRequestObject[['tier']] <- self$`tier`$toJSON()
      }

      ClientSubscriptionRequestObject
    },
    fromJSON = function(ClientSubscriptionRequestObject) {
      if (!is.null(ClientSubscriptionRequestObject$`apiName`)) {
        self$`apiName` <- ClientSubscriptionRequestObject$`apiName`
      }
      if (!is.null(ClientSubscriptionRequestObject$`apiProvider`)) {
        self$`apiProvider` <- ClientSubscriptionRequestObject$`apiProvider`
      }
      if (!is.null(ClientSubscriptionRequestObject$`apiVersion`)) {
        self$`apiVersion` <- ClientSubscriptionRequestObject$`apiVersion`
      }
      if (!is.null(ClientSubscriptionRequestObject$`tier`)) {
        tierObject <- ClientSubscriptionTier$new()
        tierObject$fromJSON(jsonlite::toJSON(ClientSubscriptionRequestObject$tier, auto_unbox = TRUE))
        self$`tier` <- tierObject
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "apiName": %s,
           "apiProvider": %s,
           "apiVersion": %s,
           "tier": %s
        }',
        self$`apiName`,
        self$`apiProvider`,
        self$`apiVersion`,
        self$`tier`$toJSON()
      )
    },
    fromJSONString = function(ClientSubscriptionRequestJson) {
      ClientSubscriptionRequestObject <- jsonlite::fromJSON(ClientSubscriptionRequestJson)
      self$`apiName` <- ClientSubscriptionRequestObject$`apiName`
      self$`apiProvider` <- ClientSubscriptionRequestObject$`apiProvider`
      self$`apiVersion` <- ClientSubscriptionRequestObject$`apiVersion`
      ClientSubscriptionTierObject <- ClientSubscriptionTier$new()
      self$`tier` <- ClientSubscriptionTierObject$fromJSON(jsonlite::toJSON(ClientSubscriptionRequestObject$tier, auto_unbox = TRUE))
    }
  )
)
