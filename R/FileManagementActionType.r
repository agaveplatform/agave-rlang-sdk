# Agave Platform Science API
# 
# Power your digital lab and reduce the time from theory to discovery using the Agave Science-as-a-Service API Platform. Agave provides hosted services that allow researchers to manage data, conduct experiments, and publish and share results from anywhere at any time.
# 
# OpenAPI spec version: 2.1.11
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git


#' FileManagementActionType Class
#'
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
FileManagementActionType <- R6::R6Class(
  'FileManagementActionType',
  public = list(
    initialize = function(){
    },
    toJSON = function() {
      FileManagementActionTypeObject <- list()

      FileManagementActionTypeObject
    },
    fromJSON = function(FileManagementActionTypeObject) {
    },
    toJSONString = function() {
       sprintf(
        '{
        }',
      )
    },
    fromJSONString = function(FileManagementActionTypeJson) {
      FileManagementActionTypeObject <- jsonlite::fromJSON(FileManagementActionTypeJson)
    }
  )
)
