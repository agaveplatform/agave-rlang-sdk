# Agave Platform Science API
#
# Power your digital lab and reduce the time from theory to discovery using the Agave Science-as-a-Service API Platform. Agave provides hosted services that allow researchers to manage data, conduct experiments, and publish and share results from anywhere at any time.
#
# Agave Platform version: 2.2.14
#
# Generated by: https://github.com/swagger-api/swagger-codegen.git


#' TenantContact Class
#'
#' Tenant contact information
#'
#' @field name Full name of the contact
#' @field email The base url for all tenant requests. This should always be SSL enabled.
#' @field url The code by which this tenant is known, eg. agave.prod
#' @field type The type of contact this user represents.
#' @field primary Whether the contact is the primary contact for the tenant.
#' @field contact
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
TenantContact <- R6::R6Class(
  'TenantContact',
  public = list(
    `name` = NULL,
    `email` = NULL,
    `url` = NULL,
    `type` = NULL,
    `primary` = NULL,
    `contact` = NULL,
    initialize = function(`name`, `email`, `url`, `type`, `primary`, `contact`){
      if (!missing(`name`)) {
        stopifnot(is.character(`name`), length(`name`) == 1)
        self$`name` <- `name`
      }
      if (!missing(`email`)) {
        stopifnot(is.character(`email`), length(`email`) == 1)
        self$`email` <- `email`
      }
      if (!missing(`url`)) {
        stopifnot(is.character(`url`), length(`url`) == 1)
        self$`url` <- `url`
      }
      if (!missing(`type`)) {
        stopifnot(is.character(`type`), length(`type`) == 1)
        self$`type` <- `type`
      }
      if (!missing(`primary`)) {
        self$`primary` <- `primary`
      }
      if (!missing(`contact`)) {
        stopifnot(R6::is.R6(`contact`))
        self$`contact` <- `contact`
      }
    },
    asJSON = function() {
      self$toJSON()
    },
    toJSON = function() {
      TenantContactObject <- list()
      if (!is.null(self$`name`)) {
        TenantContactObject[['name']] <- self$`name`
      }
      else {
        TenantContactObject[['name']] <- NULL
      }
      if (!is.null(self$`email`)) {
        TenantContactObject[['email']] <- self$`email`
      }
      else {
        TenantContactObject[['email']] <- NULL
      }
      if (!is.null(self$`url`)) {
        TenantContactObject[['url']] <- self$`url`
      }
      else {
        TenantContactObject[['url']] <- NULL
      }
      if (!is.null(self$`type`)) {
        TenantContactObject[['type']] <- self$`type`
      }
      else {
        TenantContactObject[['type']] <- NULL
      }
      if (!is.null(self$`primary`)) {
        TenantContactObject[['primary']] <- self$`primary`
      }
      else {
        TenantContactObject[['primary']] <- NULL
      }
      if (!is.null(self$`contact`)) {
        TenantContactObject[['contact']] <- self$`contact`$toJSON()
      }
      else {
        TenantContactObject[['contact']] <- NULL
      }

      TenantContactObject
    },
    fromJSON = function(TenantContactObject) {
      if (is.character(TenantContactObject)) {
        TenantContactObject <- jsonlite::fromJSON(TenantContactObject)
      }

      if ("result" %in% names(TenantContactObject)) {
        TenantContactObject <- TenantContactObject$result
      }

      if (!is.null(TenantContactObject$`name`)) {
        self$`name` <- TenantContactObject$`name`
      }
      if (!is.null(TenantContactObject$`email`)) {
        self$`email` <- TenantContactObject$`email`
      }
      if (!is.null(TenantContactObject$`url`)) {
        self$`url` <- TenantContactObject$`url`
      }
      if (!is.null(TenantContactObject$`type`)) {
        self$`type` <- TenantContactObject$`type`
      }
      if (!is.null(TenantContactObject$`primary`)) {
        self$`primary` <- TenantContactObject$`primary`
      }
      if (!is.null(TenantContactObject$`contact`)) {
        contactObject <- TenantContact$new()
        contactObject$fromJSON(jsonlite::toJSON(TenantContactObject$contact, auto_unbox = TRUE))
        self$`contact` <- contactObject
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "name": %s,
           "email": %s,
           "url": %s,
           "type": %s,
           "primary": %s,
           "contact": %s
        }',
        ifelse( is.null(self$`name`),"null",paste0(c('"', self$`name`, '"'))),
        ifelse( is.null(self$`email`),"null",paste0(c('"', self$`email`, '"'))),
        ifelse( is.null(self$`url`),"null",paste0(c('"', self$`url`, '"'))),
        ifelse( is.null(self$`type`),"null",paste0(c('"', self$`type`, '"'))),
        ifelse( is.null(self$`primary`),"null",paste0(c('"', self$`primary`, '"'))),
        self$`contact`$toJSON()
      )
    },
    fromJSONString = function(TenantContactJson) {
      TenantContactObject <- jsonlite::fromJSON(TenantContactJson)
      self::fromJSON(TenantContactObject)

    }
  )
)
