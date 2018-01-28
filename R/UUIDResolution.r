# Agave Platform Science API
# 
# Power your digital lab and reduce the time from theory to discovery using the Agave Science-as-a-Service API Platform. Agave provides hosted services that allow researchers to manage data, conduct experiments, and publish and share results from anywhere at any time.
# 
# OpenAPI spec version: 2.1.11
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git


#' UUIDResolution Class
#'
#' @field uuid 
#' @field type 
#' @field representation 
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
UUIDResolution <- R6::R6Class(
  'UUIDResolution',
  public = list(
    `uuid` = NULL,
    `type` = NULL,
    `representation` = NULL,
    initialize = function(`uuid`, `type`, `representation`){
      if (!missing(`uuid`)) {
        stopifnot(is.character(`uuid`), length(`uuid`) == 1)
        self$`uuid` <- `uuid`
      }
      if (!missing(`type`)) {
        stopifnot(is.character(`type`), length(`type`) == 1)
        self$`type` <- `type`
      }
      if (!missing(`representation`)) {
        stopifnot(R6::is.R6(`representation`))
        self$`representation` <- `representation`
      }
    },
    toJSON = function() {
      UUIDResolutionObject <- list()
      if (!is.null(self$`uuid`)) {
        UUIDResolutionObject[['uuid']] <- self$`uuid`
      }
      if (!is.null(self$`type`)) {
        UUIDResolutionObject[['type']] <- self$`type`
      }
      if (!is.null(self$`representation`)) {
        UUIDResolutionObject[['representation']] <- self$`representation`$toJSON()
      }

      UUIDResolutionObject
    },
    fromJSON = function(UUIDResolutionObject) {
      if (!is.null(UUIDResolutionObject$`uuid`)) {
        self$`uuid` <- UUIDResolutionObject$`uuid`
      }
      if (!is.null(UUIDResolutionObject$`type`)) {
        self$`type` <- UUIDResolutionObject$`type`
      }
      if (!is.null(UUIDResolutionObject$`representation`)) {
        representationObject <- TODO_OBJECT_MAPPING$new()
        representationObject$fromJSON(jsonlite::toJSON(UUIDResolutionObject$representation, auto_unbox = TRUE))
        self$`representation` <- representationObject
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "uuid": %s,
           "type": %s,
           "representation": %s
        }',
        self$`uuid`,
        self$`type`,
        self$`representation`$toJSON()
      )
    },
    fromJSONString = function(UUIDResolutionJson) {
      UUIDResolutionObject <- jsonlite::fromJSON(UUIDResolutionJson)
      self$`uuid` <- UUIDResolutionObject$`uuid`
      self$`type` <- UUIDResolutionObject$`type`
      TODO_OBJECT_MAPPINGObject <- TODO_OBJECT_MAPPING$new()
      self$`representation` <- TODO_OBJECT_MAPPINGObject$fromJSON(jsonlite::toJSON(UUIDResolutionObject$representation, auto_unbox = TRUE))
    }
  )
)
