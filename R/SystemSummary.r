# Agave Platform Science API
# 
# Power your digital lab and reduce the time from theory to discovery using the Agave Science-as-a-Service API Platform. Agave provides hosted services that allow researchers to manage data, conduct experiments, and publish and share results from anywhere at any time.
# 
# OpenAPI spec version: 2.1.11
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git


#' SystemSummary Class
#'
#' @field description 
#' @field id 
#' @field isDefault 
#' @field isPublic 
#' @field name 
#' @field status 
#' @field type 
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
SystemSummary <- R6::R6Class(
  'SystemSummary',
  public = list(
    `description` = NULL,
    `id` = NULL,
    `isDefault` = NULL,
    `isPublic` = NULL,
    `name` = NULL,
    `status` = NULL,
    `type` = NULL,
    initialize = function(`description`, `id`, `isDefault`, `isPublic`, `name`, `status`, `type`){
      if (!missing(`description`)) {
        stopifnot(is.character(`description`), length(`description`) == 1)
        self$`description` <- `description`
      }
      if (!missing(`id`)) {
        stopifnot(is.character(`id`), length(`id`) == 1)
        self$`id` <- `id`
      }
      if (!missing(`isDefault`)) {
        self$`isDefault` <- `isDefault`
      }
      if (!missing(`isPublic`)) {
        self$`isPublic` <- `isPublic`
      }
      if (!missing(`name`)) {
        stopifnot(is.character(`name`), length(`name`) == 1)
        self$`name` <- `name`
      }
      if (!missing(`status`)) {
        stopifnot(R6::is.R6(`status`))
        self$`status` <- `status`
      }
      if (!missing(`type`)) {
        stopifnot(R6::is.R6(`type`))
        self$`type` <- `type`
      }
    },
    toJSON = function() {
      SystemSummaryObject <- list()
      if (!is.null(self$`description`)) {
        SystemSummaryObject[['description']] <- self$`description`
      }
      if (!is.null(self$`id`)) {
        SystemSummaryObject[['id']] <- self$`id`
      }
      if (!is.null(self$`isDefault`)) {
        SystemSummaryObject[['isDefault']] <- self$`isDefault`
      }
      if (!is.null(self$`isPublic`)) {
        SystemSummaryObject[['isPublic']] <- self$`isPublic`
      }
      if (!is.null(self$`name`)) {
        SystemSummaryObject[['name']] <- self$`name`
      }
      if (!is.null(self$`status`)) {
        SystemSummaryObject[['status']] <- self$`status`$toJSON()
      }
      if (!is.null(self$`type`)) {
        SystemSummaryObject[['type']] <- self$`type`$toJSON()
      }

      SystemSummaryObject
    },
    fromJSON = function(SystemSummaryObject) {
      if (!is.null(SystemSummaryObject$`description`)) {
        self$`description` <- SystemSummaryObject$`description`
      }
      if (!is.null(SystemSummaryObject$`id`)) {
        self$`id` <- SystemSummaryObject$`id`
      }
      if (!is.null(SystemSummaryObject$`isDefault`)) {
        self$`isDefault` <- SystemSummaryObject$`isDefault`
      }
      if (!is.null(SystemSummaryObject$`isPublic`)) {
        self$`isPublic` <- SystemSummaryObject$`isPublic`
      }
      if (!is.null(SystemSummaryObject$`name`)) {
        self$`name` <- SystemSummaryObject$`name`
      }
      if (!is.null(SystemSummaryObject$`status`)) {
        statusObject <- SystemStatusType$new()
        statusObject$fromJSON(jsonlite::toJSON(SystemSummaryObject$status, auto_unbox = TRUE))
        self$`status` <- statusObject
      }
      if (!is.null(SystemSummaryObject$`type`)) {
        typeObject <- SystemType$new()
        typeObject$fromJSON(jsonlite::toJSON(SystemSummaryObject$type, auto_unbox = TRUE))
        self$`type` <- typeObject
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "description": %s,
           "id": %s,
           "isDefault": %s,
           "isPublic": %s,
           "name": %s,
           "status": %s,
           "type": %s
        }',
        self$`description`,
        self$`id`,
        self$`isDefault`,
        self$`isPublic`,
        self$`name`,
        self$`status`$toJSON(),
        self$`type`$toJSON()
      )
    },
    fromJSONString = function(SystemSummaryJson) {
      SystemSummaryObject <- jsonlite::fromJSON(SystemSummaryJson)
      self$`description` <- SystemSummaryObject$`description`
      self$`id` <- SystemSummaryObject$`id`
      self$`isDefault` <- SystemSummaryObject$`isDefault`
      self$`isPublic` <- SystemSummaryObject$`isPublic`
      self$`name` <- SystemSummaryObject$`name`
      SystemStatusTypeObject <- SystemStatusType$new()
      self$`status` <- SystemStatusTypeObject$fromJSON(jsonlite::toJSON(SystemSummaryObject$status, auto_unbox = TRUE))
      SystemTypeObject <- SystemType$new()
      self$`type` <- SystemTypeObject$fromJSON(jsonlite::toJSON(SystemSummaryObject$type, auto_unbox = TRUE))
    }
  )
)
