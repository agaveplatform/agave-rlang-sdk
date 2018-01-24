# Agave Platform Science API
# 
# Power your digital lab and reduce the time from theory to discovery using the Agave Science-as-a-Service API Platform. Agave provides hosted services that allow researchers to manage data, conduct experiments, and publish and share results from anywhere at any time.
# 
# OpenAPI spec version: 2.1.11
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git


#' TransformDecoder Class
#'
#' @field description 
#' @field name 
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
TransformDecoder <- R6::R6Class(
  'TransformDecoder',
  public = list(
    `description` = NULL,
    `name` = NULL,
    initialize = function(`description`, `name`){
      if (!missing(`description`)) {
        stopifnot(is.character(`description`), length(`description`) == 1)
        self$`description` <- `description`
      }
      if (!missing(`name`)) {
        stopifnot(is.character(`name`), length(`name`) == 1)
        self$`name` <- `name`
      }
    },
    toJSON = function() {
      TransformDecoderObject <- list()
      if (!is.null(self$`description`)) {
        TransformDecoderObject[['description']] <- self$`description`
      }
      if (!is.null(self$`name`)) {
        TransformDecoderObject[['name']] <- self$`name`
      }

      TransformDecoderObject
    },
    fromJSON = function(TransformDecoderJson) {
      TransformDecoderObject <- jsonlite::fromJSON(TransformDecoderJson)
      if (!is.null(TransformDecoderObject$`description`)) {
        self$`description` <- TransformDecoderObject$`description`
      }
      if (!is.null(TransformDecoderObject$`name`)) {
        self$`name` <- TransformDecoderObject$`name`
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "description": %s,
           "name": %s
        }',
        self$`description`,
        self$`name`
      )
    },
    fromJSONString = function(TransformDecoderJson) {
      TransformDecoderObject <- jsonlite::fromJSON(TransformDecoderJson)
      self$`description` <- TransformDecoderObject$`description`
      self$`name` <- TransformDecoderObject$`name`
    }
  )
)