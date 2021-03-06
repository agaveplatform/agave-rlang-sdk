# Agave Platform Science API
#
# Power your digital lab and reduce the time from theory to discovery using the Agave Science-as-a-Service API Platform. Agave provides hosted services that allow researchers to manage data, conduct experiments, and publish and share results from anywhere at any time.
#
# Agave Platform version: 2.2.14
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git


#' FileAction Class
#'
#' A generic action to take on a file item
#'
#' @field action 
#' @field path Name of new directory or target file or folder.
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
FileAction <- R6::R6Class(
  'FileAction',
  public = list(
    `action` = NULL,
    `path` = NULL,
    initialize = function(`action`, `path`){
      if (!missing(`action`)) {
        stopifnot(R6::is.R6(`action`))
        self$`action` <- `action`
      }
      if (!missing(`path`)) {
        stopifnot(is.character(`path`), length(`path`) == 1)
        self$`path` <- `path`
      }
    },
    asJSON = function() {
      self$toJSON()
    },
    toJSON = function() {
      FileActionObject <- list()
      if (!is.null(self$`action`)) {
        FileActionObject[['action']] <- self$`action`$toJSON()
      }
      else {
        FileActionObject[['action']] <- NULL
      }
      if (!is.null(self$`path`)) {
        FileActionObject[['path']] <- self$`path`
      }
      else {
        FileActionObject[['path']] <- NULL
      }

      FileActionObject
    },
    fromJSON = function(FileActionObject) {
      if (is.character(FileActionObject)) {
        FileActionObject <- jsonlite::fromJSON(FileActionJson)
      }

      if ("result" %in% names(FileActionObject)) {
        FileActionObject <- FileActionObject$result
      }

      if (!is.null(FileActionObject$`action`)) {
        actionObject <- FileManagementActionType$new()
        actionObject$fromJSON(jsonlite::toJSON(FileActionObject$action, auto_unbox = TRUE))
        self$`action` <- actionObject
      }
      if (!is.null(FileActionObject$`path`)) {
        self$`path` <- FileActionObject$`path`
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "action": %s,
           "path": %s
        }',
        self$`action`$toJSON(),
        ifelse( is.null(self$`path`),"null",paste0(c('"', self$`path`, '"')))
      )
    },
    fromJSONString = function(FileActionJson) {
      FileActionObject <- jsonlite::fromJSON(FileActionJson)
      self::fromJSON(FileActionObject)

    }
  )
)
