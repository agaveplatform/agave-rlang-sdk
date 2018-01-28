# Agave Platform Science API
# 
# Power your digital lab and reduce the time from theory to discovery using the Agave Science-as-a-Service API Platform. Agave provides hosted services that allow researchers to manage data, conduct experiments, and publish and share results from anywhere at any time.
# 
# OpenAPI spec version: 2.1.11
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git


#' TagSummary Class
#'
#' @field name 
#' @field created 
#' @field lastUpdated 
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
TagSummary <- R6::R6Class(
  'TagSummary',
  public = list(
    `name` = NULL,
    `created` = NULL,
    `lastUpdated` = NULL,
    initialize = function(`name`, `created`, `lastUpdated`){
      if (!missing(`name`)) {
        stopifnot(is.character(`name`), length(`name`) == 1)
        self$`name` <- `name`
      }
      if (!missing(`created`)) {
        stopifnot(is.character(`created`), length(`created`) == 1)
        self$`created` <- `created`
      }
      if (!missing(`lastUpdated`)) {
        stopifnot(is.character(`lastUpdated`), length(`lastUpdated`) == 1)
        self$`lastUpdated` <- `lastUpdated`
      }
    },
    toJSON = function() {
      TagSummaryObject <- list()
      if (!is.null(self$`name`)) {
        TagSummaryObject[['name']] <- self$`name`
      }
      if (!is.null(self$`created`)) {
        TagSummaryObject[['created']] <- self$`created`
      }
      if (!is.null(self$`lastUpdated`)) {
        TagSummaryObject[['lastUpdated']] <- self$`lastUpdated`
      }

      TagSummaryObject
    },
    fromJSON = function(TagSummaryObject) {
      if (!is.null(TagSummaryObject$`name`)) {
        self$`name` <- TagSummaryObject$`name`
      }
      if (!is.null(TagSummaryObject$`created`)) {
        self$`created` <- TagSummaryObject$`created`
      }
      if (!is.null(TagSummaryObject$`lastUpdated`)) {
        self$`lastUpdated` <- TagSummaryObject$`lastUpdated`
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "name": %s,
           "created": %s,
           "lastUpdated": %s
        }',
        self$`name`,
        self$`created`,
        self$`lastUpdated`
      )
    },
    fromJSONString = function(TagSummaryJson) {
      TagSummaryObject <- jsonlite::fromJSON(TagSummaryJson)
      self$`name` <- TagSummaryObject$`name`
      self$`created` <- TagSummaryObject$`created`
      self$`lastUpdated` <- TagSummaryObject$`lastUpdated`
    }
  )
)
