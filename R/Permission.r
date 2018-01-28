# Agave Platform Science API
# 
# Power your digital lab and reduce the time from theory to discovery using the Agave Science-as-a-Service API Platform. Agave provides hosted services that allow researchers to manage data, conduct experiments, and publish and share results from anywhere at any time.
# 
# OpenAPI spec version: 2.1.11
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git


#' Permission Class
#'
#' @field username 
#' @field internalUsername 
#' @field permission 
#' @field created 
#' @field lastUpdated 
#' @field id 
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
Permission <- R6::R6Class(
  'Permission',
  public = list(
    `username` = NULL,
    `internalUsername` = NULL,
    `permission` = NULL,
    `created` = NULL,
    `lastUpdated` = NULL,
    `id` = NULL,
    initialize = function(`username`, `internalUsername`, `permission`, `created`, `lastUpdated`, `id`){
      if (!missing(`username`)) {
        stopifnot(is.character(`username`), length(`username`) == 1)
        self$`username` <- `username`
      }
      if (!missing(`internalUsername`)) {
        stopifnot(is.character(`internalUsername`), length(`internalUsername`) == 1)
        self$`internalUsername` <- `internalUsername`
      }
      if (!missing(`permission`)) {
        stopifnot(R6::is.R6(`permission`))
        self$`permission` <- `permission`
      }
      if (!missing(`created`)) {
        stopifnot(is.character(`created`), length(`created`) == 1)
        self$`created` <- `created`
      }
      if (!missing(`lastUpdated`)) {
        stopifnot(is.character(`lastUpdated`), length(`lastUpdated`) == 1)
        self$`lastUpdated` <- `lastUpdated`
      }
      if (!missing(`id`)) {
        stopifnot(is.character(`id`), length(`id`) == 1)
        self$`id` <- `id`
      }
    },
    toJSON = function() {
      PermissionObject <- list()
      if (!is.null(self$`username`)) {
        PermissionObject[['username']] <- self$`username`
      }
      if (!is.null(self$`internalUsername`)) {
        PermissionObject[['internalUsername']] <- self$`internalUsername`
      }
      if (!is.null(self$`permission`)) {
        PermissionObject[['permission']] <- self$`permission`$toJSON()
      }
      if (!is.null(self$`created`)) {
        PermissionObject[['created']] <- self$`created`
      }
      if (!is.null(self$`lastUpdated`)) {
        PermissionObject[['lastUpdated']] <- self$`lastUpdated`
      }
      if (!is.null(self$`id`)) {
        PermissionObject[['id']] <- self$`id`
      }

      PermissionObject
    },
    fromJSON = function(PermissionObject) {
      if (!is.null(PermissionObject$`username`)) {
        self$`username` <- PermissionObject$`username`
      }
      if (!is.null(PermissionObject$`internalUsername`)) {
        self$`internalUsername` <- PermissionObject$`internalUsername`
      }
      if (!is.null(PermissionObject$`permission`)) {
        permissionObject <- PermissionStanza$new()
        permissionObject$fromJSON(jsonlite::toJSON(PermissionObject$permission, auto_unbox = TRUE))
        self$`permission` <- permissionObject
      }
      if (!is.null(PermissionObject$`created`)) {
        self$`created` <- PermissionObject$`created`
      }
      if (!is.null(PermissionObject$`lastUpdated`)) {
        self$`lastUpdated` <- PermissionObject$`lastUpdated`
      }
      if (!is.null(PermissionObject$`id`)) {
        self$`id` <- PermissionObject$`id`
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "username": %s,
           "internalUsername": %s,
           "permission": %s,
           "created": %s,
           "lastUpdated": %s,
           "id": %s
        }',
        self$`username`,
        self$`internalUsername`,
        self$`permission`$toJSON(),
        self$`created`,
        self$`lastUpdated`,
        self$`id`
      )
    },
    fromJSONString = function(PermissionJson) {
      PermissionObject <- jsonlite::fromJSON(PermissionJson)
      self$`username` <- PermissionObject$`username`
      self$`internalUsername` <- PermissionObject$`internalUsername`
      PermissionStanzaObject <- PermissionStanza$new()
      self$`permission` <- PermissionStanzaObject$fromJSON(jsonlite::toJSON(PermissionObject$permission, auto_unbox = TRUE))
      self$`created` <- PermissionObject$`created`
      self$`lastUpdated` <- PermissionObject$`lastUpdated`
      self$`id` <- PermissionObject$`id`
    }
  )
)
