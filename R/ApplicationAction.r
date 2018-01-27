# Agave Platform Science API
# 
# Power your digital lab and reduce the time from theory to discovery using the Agave Science-as-a-Service API Platform. Agave provides hosted services that allow researchers to manage data, conduct experiments, and publish and share results from anywhere at any time.
# 
# OpenAPI spec version: 2.1.11
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git


#' ApplicationAction Class
#'
#' @field action 
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
ApplicationAction <- R6::R6Class(
  'ApplicationAction',
  public = list(
    `action` = NULL,
    initialize = function(`action`){
      if (!missing(`action`)) {
        stopifnot(R6::is.R6(`action`))
        self$`action` <- `action`
      }
    },
    toJSON = function() {
      ApplicationActionObject <- list()
      if (!is.null(self$`action`)) {
        ApplicationActionObject[['action']] <- self$`action`$toJSON()
      }

      ApplicationActionObject
    },
    fromJSON = function(ApplicationActionObject) {
      if (!is.null(ApplicationActionObject$`action`)) {
        actionObject <- ApplicationActionType$new()
        actionObject$fromJSON(jsonlite::toJSON(ApplicationActionObject$action, auto_unbox = TRUE))
        self$`action` <- actionObject
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "action": %s
        }',
        self$`action`$toJSON()
      )
    },
    fromJSONString = function(ApplicationActionJson) {
      ApplicationActionObject <- jsonlite::fromJSON(ApplicationActionJson)
      ApplicationActionTypeObject <- ApplicationActionType$new()
      self$`action` <- ApplicationActionTypeObject$fromJSON(jsonlite::toJSON(ApplicationActionObject$action, auto_unbox = TRUE))
    }
  )
)
