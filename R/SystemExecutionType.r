# Agave Platform Science API
#
# Power your digital lab and reduce the time from theory to discovery using the Agave Science-as-a-Service API Platform. Agave provides hosted services that allow researchers to manage data, conduct experiments, and publish and share results from anywhere at any time.
#
# Agave Platform version: 2.2.14
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git


#' SystemExecutionType Class
#'
#' 
#'
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
SystemExecutionType <- R6::R6Class(
  'SystemExecutionType',
  public = list(
    initialize = function(){
    },
    asJSON = function() {
      self$toJSON()
    },
    toJSON = function() {
      SystemExecutionTypeObject <- list()

      SystemExecutionTypeObject
    },
    fromJSON = function(SystemExecutionTypeObject) {
      if (is.character(SystemExecutionTypeObject)) {
        SystemExecutionTypeObject <- jsonlite::fromJSON(SystemExecutionTypeJson)
      }

      if ("result" %in% names(SystemExecutionTypeObject)) {
        SystemExecutionTypeObject <- SystemExecutionTypeObject$result
      }

    },
    toJSONString = function() {
       sprintf(
        '{
        }',
      )
    },
    fromJSONString = function(SystemExecutionTypeJson) {
      SystemExecutionTypeObject <- jsonlite::fromJSON(SystemExecutionTypeJson)
      self::fromJSON(SystemExecutionTypeObject)

    }
  )
)
