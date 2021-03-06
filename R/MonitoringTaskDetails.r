# Agave Platform Science API
#
# Power your digital lab and reduce the time from theory to discovery using the Agave Science-as-a-Service API Platform. Agave provides hosted services that allow researchers to manage data, conduct experiments, and publish and share results from anywhere at any time.
#
# Agave Platform version: 2.2.14
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git


#' MonitoringTaskDetails Class
#'
#' Detailed description of a monitoring task
#'
#' @field active Whether this monitor is currently active.
#' @field frequency The interval in minutes on which this monitor will run. Minimum is 5. Default is 720.
#' @field internalUsername Internal user account used to perform the check.
#' @field target The id of the sytem to be monitored. This must be an active system registered with the Systems service.
#' @field updateSystemStatus Whether this Monitor should update the system status when the results change. You must have the ADMIN role on the target system to use this feature.
#' @field id The unique id of the monitor
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
MonitoringTaskDetails <- R6::R6Class(
  'MonitoringTaskDetails',
  public = list(
    `active` = NULL,
    `frequency` = NULL,
    `internalUsername` = NULL,
    `target` = NULL,
    `updateSystemStatus` = NULL,
    `id` = NULL,
    initialize = function(`active`, `frequency`, `internalUsername`, `target`, `updateSystemStatus`, `id`){
      if (!missing(`active`)) {
        self$`active` <- `active`
      }
      if (!missing(`frequency`)) {
        stopifnot(is.numeric(`frequency`), length(`frequency`) == 1)
        self$`frequency` <- `frequency`
      }
      if (!missing(`internalUsername`)) {
        stopifnot(is.character(`internalUsername`), length(`internalUsername`) == 1)
        self$`internalUsername` <- `internalUsername`
      }
      if (!missing(`target`)) {
        stopifnot(is.character(`target`), length(`target`) == 1)
        self$`target` <- `target`
      }
      if (!missing(`updateSystemStatus`)) {
        self$`updateSystemStatus` <- `updateSystemStatus`
      }
      if (!missing(`id`)) {
        stopifnot(is.character(`id`), length(`id`) == 1)
        self$`id` <- `id`
      }
    },
    asJSON = function() {
      self$toJSON()
    },
    toJSON = function() {
      MonitoringTaskDetailsObject <- list()
      if (!is.null(self$`active`)) {
        MonitoringTaskDetailsObject[['active']] <- self$`active`
      }
      else {
        MonitoringTaskDetailsObject[['active']] <- NULL
      }
      if (!is.null(self$`frequency`)) {
        MonitoringTaskDetailsObject[['frequency']] <- self$`frequency`
      }
      else {
        MonitoringTaskDetailsObject[['frequency']] <- NULL
      }
      if (!is.null(self$`internalUsername`)) {
        MonitoringTaskDetailsObject[['internalUsername']] <- self$`internalUsername`
      }
      else {
        MonitoringTaskDetailsObject[['internalUsername']] <- NULL
      }
      if (!is.null(self$`target`)) {
        MonitoringTaskDetailsObject[['target']] <- self$`target`
      }
      else {
        MonitoringTaskDetailsObject[['target']] <- NULL
      }
      if (!is.null(self$`updateSystemStatus`)) {
        MonitoringTaskDetailsObject[['updateSystemStatus']] <- self$`updateSystemStatus`
      }
      else {
        MonitoringTaskDetailsObject[['updateSystemStatus']] <- NULL
      }
      if (!is.null(self$`id`)) {
        MonitoringTaskDetailsObject[['id']] <- self$`id`
      }
      else {
        MonitoringTaskDetailsObject[['id']] <- NULL
      }

      MonitoringTaskDetailsObject
    },
    fromJSON = function(MonitoringTaskDetailsObject) {
      if (is.character(MonitoringTaskDetailsObject)) {
        MonitoringTaskDetailsObject <- jsonlite::fromJSON(MonitoringTaskDetailsJson)
      }

      if ("result" %in% names(MonitoringTaskDetailsObject)) {
        MonitoringTaskDetailsObject <- MonitoringTaskDetailsObject$result
      }

      if (!is.null(MonitoringTaskDetailsObject$`active`)) {
        self$`active` <- MonitoringTaskDetailsObject$`active`
      }
      if (!is.null(MonitoringTaskDetailsObject$`frequency`)) {
        self$`frequency` <- MonitoringTaskDetailsObject$`frequency`
      }
      if (!is.null(MonitoringTaskDetailsObject$`internalUsername`)) {
        self$`internalUsername` <- MonitoringTaskDetailsObject$`internalUsername`
      }
      if (!is.null(MonitoringTaskDetailsObject$`target`)) {
        self$`target` <- MonitoringTaskDetailsObject$`target`
      }
      if (!is.null(MonitoringTaskDetailsObject$`updateSystemStatus`)) {
        self$`updateSystemStatus` <- MonitoringTaskDetailsObject$`updateSystemStatus`
      }
      if (!is.null(MonitoringTaskDetailsObject$`id`)) {
        self$`id` <- MonitoringTaskDetailsObject$`id`
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "active": %s,
           "frequency": %d,
           "internalUsername": %s,
           "target": %s,
           "updateSystemStatus": %s,
           "id": %s
        }',
        ifelse( is.null(self$`active`),"null",paste0(c('"', self$`active`, '"'))),
        ifelse( is.null(self$`frequency`),"null",paste0(c('"', self$`frequency`, '"'))),
        ifelse( is.null(self$`internalUsername`),"null",paste0(c('"', self$`internalUsername`, '"'))),
        ifelse( is.null(self$`target`),"null",paste0(c('"', self$`target`, '"'))),
        ifelse( is.null(self$`updateSystemStatus`),"null",paste0(c('"', self$`updateSystemStatus`, '"'))),
        ifelse( is.null(self$`id`),"null",paste0(c('"', self$`id`, '"')))
      )
    },
    fromJSONString = function(MonitoringTaskDetailsJson) {
      MonitoringTaskDetailsObject <- jsonlite::fromJSON(MonitoringTaskDetailsJson)
      self::fromJSON(MonitoringTaskDetailsObject)

    }
  )
)
