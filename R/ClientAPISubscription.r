# Agave Platform Science API
# 
# Power your digital lab and reduce the time from theory to discovery using the Agave Science-as-a-Service API Platform. Agave provides hosted services that allow researchers to manage data, conduct experiments, and publish and share results from anywhere at any time.
# 
# OpenAPI spec version: 2.1.11
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git


#' ClientAPISubscription Class
#'
#' @field apiContext 
#' @field apiName 
#' @field apiProvider 
#' @field apiVersion 
#' @field status 
#' @field tier 
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
ClientAPISubscription <- R6::R6Class(
  'ClientAPISubscription',
  public = list(
    `apiContext` = NULL,
    `apiName` = NULL,
    `apiProvider` = NULL,
    `apiVersion` = NULL,
    `status` = NULL,
    `tier` = NULL,
    initialize = function(`apiContext`, `apiName`, `apiProvider`, `apiVersion`, `status`, `tier`){
      if (!missing(`apiContext`)) {
        stopifnot(is.character(`apiContext`), length(`apiContext`) == 1)
        self$`apiContext` <- `apiContext`
      }
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
      if (!missing(`status`)) {
        stopifnot(R6::is.R6(`status`))
        self$`status` <- `status`
      }
      if (!missing(`tier`)) {
        stopifnot(R6::is.R6(`tier`))
        self$`tier` <- `tier`
      }
    },
    toJSON = function() {
      ClientAPISubscriptionObject <- list()
      if (!is.null(self$`apiContext`)) {
        ClientAPISubscriptionObject[['apiContext']] <- self$`apiContext`
      }
      if (!is.null(self$`apiName`)) {
        ClientAPISubscriptionObject[['apiName']] <- self$`apiName`
      }
      if (!is.null(self$`apiProvider`)) {
        ClientAPISubscriptionObject[['apiProvider']] <- self$`apiProvider`
      }
      if (!is.null(self$`apiVersion`)) {
        ClientAPISubscriptionObject[['apiVersion']] <- self$`apiVersion`
      }
      if (!is.null(self$`status`)) {
        ClientAPISubscriptionObject[['status']] <- self$`status`$toJSON()
      }
      if (!is.null(self$`tier`)) {
        ClientAPISubscriptionObject[['tier']] <- self$`tier`$toJSON()
      }

      ClientAPISubscriptionObject
    },
    fromJSON = function(ClientAPISubscriptionObject) {
      if (!is.null(ClientAPISubscriptionObject$`apiContext`)) {
        self$`apiContext` <- ClientAPISubscriptionObject$`apiContext`
      }
      if (!is.null(ClientAPISubscriptionObject$`apiName`)) {
        self$`apiName` <- ClientAPISubscriptionObject$`apiName`
      }
      if (!is.null(ClientAPISubscriptionObject$`apiProvider`)) {
        self$`apiProvider` <- ClientAPISubscriptionObject$`apiProvider`
      }
      if (!is.null(ClientAPISubscriptionObject$`apiVersion`)) {
        self$`apiVersion` <- ClientAPISubscriptionObject$`apiVersion`
      }
      if (!is.null(ClientAPISubscriptionObject$`status`)) {
        statusObject <- ClientAPISubscriptionStatusType$new()
        statusObject$fromJSON(jsonlite::toJSON(ClientAPISubscriptionObject$status, auto_unbox = TRUE))
        self$`status` <- statusObject
      }
      if (!is.null(ClientAPISubscriptionObject$`tier`)) {
        tierObject <- ClientSubscriptionTier$new()
        tierObject$fromJSON(jsonlite::toJSON(ClientAPISubscriptionObject$tier, auto_unbox = TRUE))
        self$`tier` <- tierObject
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "apiContext": %s,
           "apiName": %s,
           "apiProvider": %s,
           "apiVersion": %s,
           "status": %s,
           "tier": %s
        }',
        self$`apiContext`,
        self$`apiName`,
        self$`apiProvider`,
        self$`apiVersion`,
        self$`status`$toJSON(),
        self$`tier`$toJSON()
      )
    },
    fromJSONString = function(ClientAPISubscriptionJson) {
      ClientAPISubscriptionObject <- jsonlite::fromJSON(ClientAPISubscriptionJson)
      self$`apiContext` <- ClientAPISubscriptionObject$`apiContext`
      self$`apiName` <- ClientAPISubscriptionObject$`apiName`
      self$`apiProvider` <- ClientAPISubscriptionObject$`apiProvider`
      self$`apiVersion` <- ClientAPISubscriptionObject$`apiVersion`
      ClientAPISubscriptionStatusTypeObject <- ClientAPISubscriptionStatusType$new()
      self$`status` <- ClientAPISubscriptionStatusTypeObject$fromJSON(jsonlite::toJSON(ClientAPISubscriptionObject$status, auto_unbox = TRUE))
      ClientSubscriptionTierObject <- ClientSubscriptionTier$new()
      self$`tier` <- ClientSubscriptionTierObject$fromJSON(jsonlite::toJSON(ClientAPISubscriptionObject$tier, auto_unbox = TRUE))
    }
  )
)
