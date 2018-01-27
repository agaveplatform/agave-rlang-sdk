# Agave Platform Science API
# 
# Power your digital lab and reduce the time from theory to discovery using the Agave Science-as-a-Service API Platform. Agave provides hosted services that allow researchers to manage data, conduct experiments, and publish and share results from anywhere at any time.
# 
# OpenAPI spec version: 2.1.11
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git


#' ApplicationParameterNumericValue Class
#'
#' @field defaultValue 
#' @field enumValues 
#' @field enquote 
#' @field order 
#' @field required 
#' @field type 
#' @field validator 
#' @field visible 
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
ApplicationParameterNumericValue <- R6::R6Class(
  'ApplicationParameterNumericValue',
  public = list(
    `defaultValue` = NULL,
    `enumValues` = NULL,
    `enquote` = NULL,
    `order` = NULL,
    `required` = NULL,
    `type` = NULL,
    `validator` = NULL,
    `visible` = NULL,
    initialize = function(`defaultValue`, `enumValues`, `enquote`, `order`, `required`, `type`, `validator`, `visible`){
      if (!missing(`defaultValue`)) {
        stopifnot(is.character(`defaultValue`), length(`defaultValue`) == 1)
        self$`defaultValue` <- `defaultValue`
      }
      if (!missing(`enumValues`)) {
        stopifnot(is.character(`enumValues`), length(`enumValues`) == 1)
        self$`enumValues` <- `enumValues`
      }
      if (!missing(`enquote`)) {
        self$`enquote` <- `enquote`
      }
      if (!missing(`order`)) {
        stopifnot(is.numeric(`order`), length(`order`) == 1)
        self$`order` <- `order`
      }
      if (!missing(`required`)) {
        self$`required` <- `required`
      }
      if (!missing(`type`)) {
        stopifnot(is.character(`type`), length(`type`) == 1)
        self$`type` <- `type`
      }
      if (!missing(`validator`)) {
        stopifnot(is.character(`validator`), length(`validator`) == 1)
        self$`validator` <- `validator`
      }
      if (!missing(`visible`)) {
        self$`visible` <- `visible`
      }
    },
    toJSON = function() {
      ApplicationParameterNumericValueObject <- list()
      if (!is.null(self$`defaultValue`)) {
        ApplicationParameterNumericValueObject[['defaultValue']] <- self$`defaultValue`
      }
      if (!is.null(self$`enumValues`)) {
        ApplicationParameterNumericValueObject[['enumValues']] <- self$`enumValues`
      }
      if (!is.null(self$`enquote`)) {
        ApplicationParameterNumericValueObject[['enquote']] <- self$`enquote`
      }
      if (!is.null(self$`order`)) {
        ApplicationParameterNumericValueObject[['order']] <- self$`order`
      }
      if (!is.null(self$`required`)) {
        ApplicationParameterNumericValueObject[['required']] <- self$`required`
      }
      if (!is.null(self$`type`)) {
        ApplicationParameterNumericValueObject[['type']] <- self$`type`
      }
      if (!is.null(self$`validator`)) {
        ApplicationParameterNumericValueObject[['validator']] <- self$`validator`
      }
      if (!is.null(self$`visible`)) {
        ApplicationParameterNumericValueObject[['visible']] <- self$`visible`
      }

      ApplicationParameterNumericValueObject
    },
    fromJSON = function(ApplicationParameterNumericValueObject) {
      if (!is.null(ApplicationParameterNumericValueObject$`defaultValue`)) {
        self$`defaultValue` <- ApplicationParameterNumericValueObject$`defaultValue`
      }
      if (!is.null(ApplicationParameterNumericValueObject$`enumValues`)) {
        self$`enumValues` <- ApplicationParameterNumericValueObject$`enumValues`
      }
      if (!is.null(ApplicationParameterNumericValueObject$`enquote`)) {
        self$`enquote` <- ApplicationParameterNumericValueObject$`enquote`
      }
      if (!is.null(ApplicationParameterNumericValueObject$`order`)) {
        self$`order` <- ApplicationParameterNumericValueObject$`order`
      }
      if (!is.null(ApplicationParameterNumericValueObject$`required`)) {
        self$`required` <- ApplicationParameterNumericValueObject$`required`
      }
      if (!is.null(ApplicationParameterNumericValueObject$`type`)) {
        self$`type` <- ApplicationParameterNumericValueObject$`type`
      }
      if (!is.null(ApplicationParameterNumericValueObject$`validator`)) {
        self$`validator` <- ApplicationParameterNumericValueObject$`validator`
      }
      if (!is.null(ApplicationParameterNumericValueObject$`visible`)) {
        self$`visible` <- ApplicationParameterNumericValueObject$`visible`
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "defaultValue": %s,
           "enumValues": %s,
           "enquote": %s,
           "order": %d,
           "required": %s,
           "type": %s,
           "validator": %s,
           "visible": %s
        }',
        self$`defaultValue`,
        self$`enumValues`,
        self$`enquote`,
        self$`order`,
        self$`required`,
        self$`type`,
        self$`validator`,
        self$`visible`
      )
    },
    fromJSONString = function(ApplicationParameterNumericValueJson) {
      ApplicationParameterNumericValueObject <- jsonlite::fromJSON(ApplicationParameterNumericValueJson)
      self$`defaultValue` <- ApplicationParameterNumericValueObject$`defaultValue`
      self$`enumValues` <- ApplicationParameterNumericValueObject$`enumValues`
      self$`enquote` <- ApplicationParameterNumericValueObject$`enquote`
      self$`order` <- ApplicationParameterNumericValueObject$`order`
      self$`required` <- ApplicationParameterNumericValueObject$`required`
      self$`type` <- ApplicationParameterNumericValueObject$`type`
      self$`validator` <- ApplicationParameterNumericValueObject$`validator`
      self$`visible` <- ApplicationParameterNumericValueObject$`visible`
    }
  )
)
