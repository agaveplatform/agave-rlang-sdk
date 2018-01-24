# Agave Platform Science API
# 
# Power your digital lab and reduce the time from theory to discovery using the Agave Science-as-a-Service API Platform. Agave provides hosted services that allow researchers to manage data, conduct experiments, and publish and share results from anywhere at any time.
# 
# OpenAPI spec version: 2.1.11
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git


#' BatchQueue Class
#'
#' @field customDirectives 
#' @field isDefault 
#' @field maxJobs 
#' @field maxUserJobs 
#' @field maxNodes 
#' @field maxMemoryPerNode 
#' @field maxProcessorsPerNode 
#' @field maxRequestedTime 
#' @field name 
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
BatchQueue <- R6::R6Class(
  'BatchQueue',
  public = list(
    `customDirectives` = NULL,
    `isDefault` = NULL,
    `maxJobs` = NULL,
    `maxUserJobs` = NULL,
    `maxNodes` = NULL,
    `maxMemoryPerNode` = NULL,
    `maxProcessorsPerNode` = NULL,
    `maxRequestedTime` = NULL,
    `name` = NULL,
    initialize = function(`customDirectives`, `isDefault`, `maxJobs`, `maxUserJobs`, `maxNodes`, `maxMemoryPerNode`, `maxProcessorsPerNode`, `maxRequestedTime`, `name`){
      if (!missing(`customDirectives`)) {
        stopifnot(is.character(`customDirectives`), length(`customDirectives`) == 1)
        self$`customDirectives` <- `customDirectives`
      }
      if (!missing(`isDefault`)) {
        self$`isDefault` <- `isDefault`
      }
      if (!missing(`maxJobs`)) {
        stopifnot(is.numeric(`maxJobs`), length(`maxJobs`) == 1)
        self$`maxJobs` <- `maxJobs`
      }
      if (!missing(`maxUserJobs`)) {
        stopifnot(is.numeric(`maxUserJobs`), length(`maxUserJobs`) == 1)
        self$`maxUserJobs` <- `maxUserJobs`
      }
      if (!missing(`maxNodes`)) {
        stopifnot(is.character(`maxNodes`), length(`maxNodes`) == 1)
        self$`maxNodes` <- `maxNodes`
      }
      if (!missing(`maxMemoryPerNode`)) {
        stopifnot(is.character(`maxMemoryPerNode`), length(`maxMemoryPerNode`) == 1)
        self$`maxMemoryPerNode` <- `maxMemoryPerNode`
      }
      if (!missing(`maxProcessorsPerNode`)) {
        stopifnot(is.numeric(`maxProcessorsPerNode`), length(`maxProcessorsPerNode`) == 1)
        self$`maxProcessorsPerNode` <- `maxProcessorsPerNode`
      }
      if (!missing(`maxRequestedTime`)) {
        stopifnot(is.character(`maxRequestedTime`), length(`maxRequestedTime`) == 1)
        self$`maxRequestedTime` <- `maxRequestedTime`
      }
      if (!missing(`name`)) {
        stopifnot(is.character(`name`), length(`name`) == 1)
        self$`name` <- `name`
      }
    },
    toJSON = function() {
      BatchQueueObject <- list()
      if (!is.null(self$`customDirectives`)) {
        BatchQueueObject[['customDirectives']] <- self$`customDirectives`
      }
      if (!is.null(self$`isDefault`)) {
        BatchQueueObject[['isDefault']] <- self$`isDefault`
      }
      if (!is.null(self$`maxJobs`)) {
        BatchQueueObject[['maxJobs']] <- self$`maxJobs`
      }
      if (!is.null(self$`maxUserJobs`)) {
        BatchQueueObject[['maxUserJobs']] <- self$`maxUserJobs`
      }
      if (!is.null(self$`maxNodes`)) {
        BatchQueueObject[['maxNodes']] <- self$`maxNodes`
      }
      if (!is.null(self$`maxMemoryPerNode`)) {
        BatchQueueObject[['maxMemoryPerNode']] <- self$`maxMemoryPerNode`
      }
      if (!is.null(self$`maxProcessorsPerNode`)) {
        BatchQueueObject[['maxProcessorsPerNode']] <- self$`maxProcessorsPerNode`
      }
      if (!is.null(self$`maxRequestedTime`)) {
        BatchQueueObject[['maxRequestedTime']] <- self$`maxRequestedTime`
      }
      if (!is.null(self$`name`)) {
        BatchQueueObject[['name']] <- self$`name`
      }

      BatchQueueObject
    },
    fromJSON = function(BatchQueueJson) {
      BatchQueueObject <- jsonlite::fromJSON(BatchQueueJson)
      if (!is.null(BatchQueueObject$`customDirectives`)) {
        self$`customDirectives` <- BatchQueueObject$`customDirectives`
      }
      if (!is.null(BatchQueueObject$`isDefault`)) {
        self$`isDefault` <- BatchQueueObject$`isDefault`
      }
      if (!is.null(BatchQueueObject$`maxJobs`)) {
        self$`maxJobs` <- BatchQueueObject$`maxJobs`
      }
      if (!is.null(BatchQueueObject$`maxUserJobs`)) {
        self$`maxUserJobs` <- BatchQueueObject$`maxUserJobs`
      }
      if (!is.null(BatchQueueObject$`maxNodes`)) {
        self$`maxNodes` <- BatchQueueObject$`maxNodes`
      }
      if (!is.null(BatchQueueObject$`maxMemoryPerNode`)) {
        self$`maxMemoryPerNode` <- BatchQueueObject$`maxMemoryPerNode`
      }
      if (!is.null(BatchQueueObject$`maxProcessorsPerNode`)) {
        self$`maxProcessorsPerNode` <- BatchQueueObject$`maxProcessorsPerNode`
      }
      if (!is.null(BatchQueueObject$`maxRequestedTime`)) {
        self$`maxRequestedTime` <- BatchQueueObject$`maxRequestedTime`
      }
      if (!is.null(BatchQueueObject$`name`)) {
        self$`name` <- BatchQueueObject$`name`
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "customDirectives": %s,
           "isDefault": %s,
           "maxJobs": %d,
           "maxUserJobs": %d,
           "maxNodes": %s,
           "maxMemoryPerNode": %s,
           "maxProcessorsPerNode": %d,
           "maxRequestedTime": %s,
           "name": %s
        }',
        self$`customDirectives`,
        self$`isDefault`,
        self$`maxJobs`,
        self$`maxUserJobs`,
        self$`maxNodes`,
        self$`maxMemoryPerNode`,
        self$`maxProcessorsPerNode`,
        self$`maxRequestedTime`,
        self$`name`
      )
    },
    fromJSONString = function(BatchQueueJson) {
      BatchQueueObject <- jsonlite::fromJSON(BatchQueueJson)
      self$`customDirectives` <- BatchQueueObject$`customDirectives`
      self$`isDefault` <- BatchQueueObject$`isDefault`
      self$`maxJobs` <- BatchQueueObject$`maxJobs`
      self$`maxUserJobs` <- BatchQueueObject$`maxUserJobs`
      self$`maxNodes` <- BatchQueueObject$`maxNodes`
      self$`maxMemoryPerNode` <- BatchQueueObject$`maxMemoryPerNode`
      self$`maxProcessorsPerNode` <- BatchQueueObject$`maxProcessorsPerNode`
      self$`maxRequestedTime` <- BatchQueueObject$`maxRequestedTime`
      self$`name` <- BatchQueueObject$`name`
    }
  )
)