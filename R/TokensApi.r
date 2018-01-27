# Agave Platform Science API
# 
# Power your digital lab and reduce the time from theory to discovery using the Agave Science-as-a-Service API Platform. Agave provides hosted services that allow researchers to manage data, conduct experiments, and publish and share results from anywhere at any time.
# 
# OpenAPI spec version: 2.1.11
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git


#' TokensApi Class
#'
#' OAuth2 token api client to manage credentials and session caching. 
#'
#' NOTE: This class is NOT generated by the swagger code generator program.
#' 
#' @title Token API
#' @description rAgave.TokenApi
#'
#' @section Methods:
#' \describe{
#'
#' loadFromSystemConfiguration
#' 
#' impersonate
#' 
#' create
#' 
#' refresh
#' 
#' revoke
#' 
#' }
#'
#' @export
TokensApi  <- R6::R6Class(
  'TokensApi',
  public = list(
    apiClient = NULL,
    scope = "PRODUCTION",
    initialize = function(apiClient, cache, client, username, password) {
      if (missing(apiClient)) {
        apiClient = ApiClient$new()
      }
      
      self$apiClient = apiClient
      
      if (missing(cache)) {
        cache = AgaveCache$new()
      }
      
      if (missing(client)) {
        client = cache$getClient()
      }
      private$client = client
      
      if (!missing(username)) {
        private$username = username
      }
      
      if (!missing(password)) {
        private$password = password
      }
      
      private$authCache = cache
    },
    
    loadFromSystemConfiguration = function() {
      
      token = authCache$getToken();
      
      # look for the client api key of the user in the environment and auth cache. 
      # This will be used for interaction with the clients api and for token generation
      token$key = private$resolveConfigurationProperty(explicitValue = token$key, envPropertyName = "AGAVE_CLIENT_KEY")
      
      
      # look for the client secret key of the user in the environment and auth cache. 
      # This will be used for interaction with the clients api and for token generation
      token$secret = private$resolveConfigurationProperty(explicitValue = token$secret, envPropertyName = "AGAVE_CLIENT_SECRET")
      
      # look for the username of the user in the environment and auth cache. 
      # This will be used for interaction with the clients api and for token generation
      # as well as name resolution for auto-generated templates, etc.
      token$username <- private$resolveConfigurationProperty(configPropertyName = "username", envPropertyName = "AGAVE_USERNAME")
      
      # look for the password of the user in the environment and auth cache (should not be there). 
      # This will be used for interaction with the clients api and for token generation
      # as well as name resolution for auto-generated templates, etc.
      token$password <- private$resolveConfigurationProperty(configPropertyName = "password", envPropertyName = "AGAVE_PASSWORD")
      
      # look for an access token explicitly provided for use in all authenticated api calls.
      # If present, this will be used for interaction with the clients api and for token generation
      token$access_token <- private$resolveConfigurationProperty(configPropertyName = "access_token", envPropertyName = "AGAVE_ACCESS_TOKEN")
      
      # look for a refresh token explicitly provided for use in all authenticated api calls.
      # If present, this will be used to obtain a new access token when th previous one expires
      token$refreshToken <- private$resolveConfigurationProperty(configPropertyName = "refresh_token", envPropertyName = "AGAVE_REFRESH_TOKEN")
      
      #private$authCache$setToken(token)
      
      token
    },
    
    impersonate = function(updateCache, client, tokenUsername, username, password) {
      
      if (missing(updateCache)) {
        updateCache <- FALSE
      }
      else {
        updateCache <- isTRUE(updateCache)
      }
      
      # pull the client from the cache if not present
      if (missing(client)) {
        client <- private$authCache$getClient()
      }
      
      # valiate impersonated username is present
      if (!missing(tokenUsername)) {
        stopifnot(is.character(`tokenUsername`), length(`tokenUsername`) == 1)
      }
      else {
        stopifnot(!missing(tokenUsername))
      }
      
      # valiate username is present
      if (!missing(username)) {
        stopifnot(is.character(username), length(username) == 1)
      }
      else {
        username = private$username
      }
      
      # valiate password is present
      if (!missing(password)) {
        stopifnot(is.character(`password`), length(`password`) == 1)
      }
      else {
        password = private$password
      }
      
      urlPath <- "/token"
      
      body <- list(token_username = tokenUsername,
                   username = username, 
                   password = password, 
                   grant_type= "admin_password",
                   scope = self$scope)
      
      resp <- httr::POST(url = paste0(self$apiClient$basePath, urlPath),
                         httr::authenticate(client$key, client$secret),
                         body = body,
                         encode = "form")
      
      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        returnObject <- Token$new()
        result <- returnObject$fromJSON(httr::content(resp, "text", encoding = "UTF-8"))
        if (updateCache) {
          private$authCache$setToken(token)
        }
        Response$new(returnObject, resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        Response$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        Response$new("API server error", resp)
      }
    },
    
    create = function(updateCache, client, username, password) {
      if (missing(updateCache)) {
        updateCache <- FALSE
      }
      else {
        updateCache <- isTRUE(updateCache)
      }
      
      # pull the client from the cache if not present
      if (missing(client)) {
        client <- private$client
      }
      
      # valiate username is present
      if (!missing(username)) {
        stopifnot(is.character(username), length(username) == 1)
      }
      else {
        username = private$username
      }
      
      # valiate password is present
      if (!missing(password)) {
        stopifnot(is.character(`password`), length(`password`) == 1)
      }
      else {
        password = private$password
      }
      
      urlPath <- "/token"
      
      body <- list(username = username, 
                   password = password, 
                   grant_type = "password",
                   scope = self$scope)
      
      resp <- httr::POST(url = paste0(self$apiClient$basePath, urlPath),
                         httr::authenticate(client$key,client$secret),
                         body = body,
                         encode = "form")
      
      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        returnObject <- Token$new()
        result <- returnObject$fromJSONString(httr::content(resp, "text", encoding = "UTF-8"))
        if (updateCache) {
          private$authCache$setToken(returnObject)
        }
        Response$new(returnObject, resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        Response$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        Response$new("API server error", resp)
      }
    },
    
    refresh = function(updateCache, client, refreshToken) {
      if (missing(updateCache)) {
        updateCache <- FALSE
      }
      else {
        updateCache <- isTRUE(updateCache)
      }
      
      # pull the client from the cache if not present
      if (missing(client)) {
        client <- private$client
      }
      
      # pull the refreshToken from the cache if not present
      if (missing(refreshToken)) {
        refreshToken <- private$authCache$getToken()$refresh_token
      }
      
      urlPath <- "/token"
      
      body <- list(refresh_token = refreshToken, 
                   grant_type= "refresh_token",
                   scope = self$scope)
      
      # logger.info("Refreshing auth token..")
      # logger.trace("Refresh token: %s", body$refresh_token)
      # logger.trace("Grant type: %s", body$grant_type)
      # logger.trace("Scope: %s", body$scope)
      # logger.trace("Client key: %s", client$key)
      # logger.trace("Client secret: %s", client$secret)
      
      resp <- httr::POST(url = paste0(self$apiClient$basePath, urlPath),
                         httr::authenticate(client$key,client$secret),
                         body = body,
                         encode = "form")
      
      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        returnObject <- Token$new()
        result <- returnObject$fromJSON(httr::content(resp))
        if (updateCache) {
          private$authCache$setToken(returnObject)
        }
        Response$new(returnObject, resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        Response$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        Response$new("API server error", resp)
      }
    },
    
    revoke = function(updateCache, client, accessToken) {
      if (missing(updateCache)) {
        updateCache <- FALSE
      }
      else {
        updateCache <- isTRUE(updateCache)
      }
      
      # pull the client from the cache if not present
      if (missing(client)) {
        client <- private$authCache$getClient()
      }
      
      # pull the refreshToken from the cache if not present
      if (missing(accessToken)) {
        accessToken <- private$authCache$getToken()$access_token
      }
      
      urlPath <- "/revoke"
      
      body <- list(token = accessToken)
      
      resp <- httr::POST(url = paste0(self$apiClient$basePath, urlPath),
                         httr::authenticate(client$key,client$secret),
                         body = body,
                         encode = "form")
      
      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        if (updateCache) {
          private$authCache$setToken(Token$new())
        }
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        Response$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        Response$new("API server error", resp)
      }
    }
  ),
  private = list(
    authCache = NULL,
    username = NULL,
    password = NULL,
    client = NULL,
    resolveConfigurationProperty = function(explicitValue, configPropertyName, envPropertyName) {
      
      val <- NULL
      if (!missing(explicitValue) && !is.null(explicitValue) && nchar(explicitValue) > 1) {
        val <- explicitValue
      }
      
      if ((is.null(val) || nchar(val) == 0) && !missing(envPropertyName) && !is.null(envPropertyName)) {
        val <- Sys.getenv(envPropertyName)
      }
      
      if ((is.null(val) || nchar(val) == 0) && !missing(configPropertyName) && !is.null(configPropertyName)) {
        val <- private$authCache$getProperty(configPropertyName)
      }
      
      val
    }
  )
)
