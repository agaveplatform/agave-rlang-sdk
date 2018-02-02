# Agave Platform Science API
# 
# Power your digital lab and reduce the time from theory to discovery using the Agave Science-as-a-Service API Platform. Agave provides hosted services that allow researchers to manage data, conduct experiments, and publish and share results from anywhere at any time.
# 
# Agave Platform version: 2.2.14
# 

#' Token Class
#'
#' @field access_token 
#' @field refresh_token 
#' @field created_at 
#' @field expires_in 
#' @field expires_at 
#' @field username 
#' @field password
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
Token <- R6::R6Class(
  'Token',
  public = list(
    `access_token` = NULL,
    `refresh_token` = NULL,
    `created_at` = NULL,
    `expires_in` = NULL,
    `expires_at` = NULL,
    `username` = NULL,
    `password` = NULL,
    initialize = function(`access_token`, `refresh_token`, `created_at`, `expires_in`, `expires_at`, `username`, `password`){
      if (!missing(`access_token`)) {
        stopifnot(is.character(`access_token`), length(`access_token`) == 1)
        self$`access_token` <- `access_token`
      }
      if (!missing(`refresh_token`)) {
        stopifnot(is.character(`refresh_token`), length(`refresh_token`) == 1)
        self$`refresh_token` <- `refresh_token`
      }
      if (!missing(`created_at`)) {
        stopifnot(is.character(`created_at`), length(`created_at`) == 1)
        self$`created_at` <- `created_at`
      }
      if (!missing(`expires_in`)) {
        stopifnot(is.character(`expires_in`), length(`expires_in`) == 1)
        self$`expires_in` <- `expires_in`
      }
      if (!missing(`expires_at`)) {
        stopifnot(is.character(`expires_at`), length(`expires_at`) == 1)
        self$`expires_at` <- `expires_at`
      }
      if (!missing(`username`)) {
        stopifnot(is.character(`username`), length(`username`) == 1)
        self$`username` <- `username`
      }
      if (!missing(`password`)) {
        stopifnot(is.character(`password`), length(`password`) == 1)
        self$`password` <- `password`
      }
    },
    toJSON = function() {
      TokenObject <- list()
      if (!is.null(self$`access_token`)) {
        TokenObject[['access_token']] <- self$`access_token`
      }
      if (!is.null(self$`refresh_token`)) {
        TokenObject[['refresh_token']] <- self$`refresh_token`
      }
      if (!is.null(self$`created_at`)) {
        TokenObject[['created_at']] <- self$`created_at`
      }
      if (!is.null(self$`expires_in`)) {
        TokenObject[['expires_in']] <- self$`expires_in`
      }
      if (!is.null(self$`expires_at`)) {
        TokenObject[['expires_at']] <- self$`expires_at`
      }
      if (!is.null(self$`username`)) {
        TokenObject[['username']] <- self$`username`
      }
      
      TokenObject
    },
    fromJSON = function(TokenObject) {
      if (!is.null(TokenObject$`access_token`)) {
        self$`access_token` <- TokenObject$`access_token`
      }
      if (!is.null(TokenObject$`refresh_token`)) {
        self$`refresh_token` <- TokenObject$`refresh_token`
      }
      if (!is.null(TokenObject$`created_at`)) {
        self$`created_at` <- TokenObject$`created_at`
      }
      if (!is.null(TokenObject$`expires_in`)) {
        self$`expires_in` <- TokenObject$`expires_in`
      }
      if (!is.null(TokenObject$`expires_at`)) {
        self$`expires_at` <- TokenObject$`expires_at`
      }
      if (!is.null(TokenObject$`username`)) {
        self$`username` <- TokenObject$`username`
      }
      if (!is.null(TokenObject$`password`)) {
        self$`password` <- TokenObject$`password`
      }
    },
    toJSONString = function() {
      sprintf(
        '{
           "access_token": %s,
           "refresh_token": %s,
           "created_at": %s,
           "expires_in": %d,
           "expires_at": %s,
           "username": %s
        }',
        private$enquote(self$`access_token`),
        private$enquote(self$`refresh_token`),
        private$enquote(self$`created_at`),
        private$enquote(self$`expires_in`),
        private$enquote(self$`expires_at`),
        private$enquote(self$`username`)
      )
    },
    fromJSONString = function(TokenJson) {
      TokenObject <- jsonlite::fromJSON(TokenJson)
      self$`access_token` <- TokenObject$`access_token`
      self$`refresh_token` <- TokenObject$`refresh_token`
      self$`created_at` <- TokenObject$`created_at`
      self$`expires_in` <- TokenObject$`expires_in`
      self$`expires_at` <- TokenObject$`expires_at`
      self$`username` <- TokenObject$`username`
      self$`password` <- TokenObject$`password`
    }
  ),
  private = list(
    enquote = function(val) {
      if (is.null(val)) {
        "null"
      }
      else if (is.numeric(val)) {
        val
      }
      else {
        paste0(c('"',self$`access_token`,'"'),collapse = '')
      }
    }
  )
)
