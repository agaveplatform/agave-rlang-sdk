# Agave Platform Science API
# 
# Power your digital lab and reduce the time from theory to discovery using the Agave Science-as-a-Service API Platform. Agave provides hosted services that allow researchers to manage data, conduct experiments, and publish and share results from anywhere at any time.
# 
# OpenAPI spec version: 2.1.11
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git


#' AgaveCache Class
#'
#' Handles access to the authentication cache including reading, 
#' writing from default system locations.
#'
#' NOTE: This class is NOT generated by the swagger code generator program.
#' 
#' @title Agave Cache utility class
#' @description rAgave.AgaveCache
#'
#' @section Methods:
#' \describe{
#'
#' load
#' 
#' write
#' 
#' getClient
#' 
#' setClient
#' 
#' getToken
#' 
#' setToken
#' 
#' getTenant
#' 
#' setTenant
#' 
#' getProperty
#' 
#' }
#'
#' @export
AgaveCache  <- R6::R6Class(
  'AuthCache',
  private = list(
    config = NULL,
    cacheDir = NULL,
    cacheFilePath = NULL
  ),
  active = list(
    dump = function(value) {
      jsonlite::toJSON(private$config, auto_unbox=TRUE, null="null", na="null")
    }
  ),
  public = list(
    initialize = function(cacheDir){
      if (!(missing(cacheDir) || is.null(cacheDir))) {
        private$cacheDir = cacheDir
      }
      else if (is.null(Sys.getenv("AGAVE_CACHE_DIR"))) {
        private$cacheDir = Sys.getenv("AGAVE_CACHE_DIR");
      }
      else {
        private$cacheDir = paste(c(Sys.getenv("HOME"),"/.agave"), collapse = "");
      }
      
      private$cacheFilePath <- paste(c(private$cacheDir,"/current"),collapse =  "")
      
      self$load(private$cacheFilePath)
    },
    
    load = function(cacheFilePath) {
      # verify the argument was passed in or use the default
      # location set on init 
      if (missing(cacheFilePath) || is.null(cacheFilePath)) {
        cacheFilePath = private$cacheFilePath
      }
      
      
      # check that the file is not a directory 
      if (file.exists(cacheFilePath) && is.character(list.files(cacheFilePath))) {
        private$config <- jsonlite::read_json(private$cacheFilePath, simplifyVector = FALSE)
      }
      # otherwise, set the config to NULL
      else {
        private$config <- NULL
      }
    },
    
    write = function(cacheFilePath) {
      # if the argument was passed in, use that
      if (missing(cacheFilePath) || is.null(cacheFilePath)) {
        cacheFilePath <- private$cacheFilePath
      }
      
      # if the file exists, load it as JSON
      if (!dir.exists(dirname(cacheFilePath))) {
        dir.create(path = dirname(cacheFilePath), recursive=TRUE, mode="770")
      }
      
      sjson <- sprintf('{"tenantid": %s,"baseurl": %s,"devurl": %s,"apisecret": %s,"apikey": %s,"username": %s,"access_token": %s,"refresh_token": %s,"created_at": %s,"expires_in": %s,"expires_at": %s,"client_name": %s}',
                       ifelse(is.null(private$config$tenantid), "null", paste(c('"',private$config$tenantid,'"'),collapse = '')),
                       ifelse(is.null(private$config$baseurl), "null", paste(c('"',private$config$baseurl,'"'),collapse = '')),
                       ifelse(is.null(private$config$devurl), "null", paste(c('"',private$config$devurl,'"'),collapse = '')),
                       ifelse(is.null(private$config$apisecret), "null", paste(c('"',private$config$apisecret,'"'),collapse = '')),
                       ifelse(is.null(private$config$apikey), "null", paste(c('"',private$config$apikey,'"'),collapse = '')),
                       ifelse(is.null(private$config$username), "null", paste(c('"',private$config$username,'"'),collapse = '')),
                       ifelse(is.null(private$config$access_token), "null", paste(c('"',private$config$access_token,'"'),collapse = '')),
                       ifelse(is.null(private$config$refresh_token), "null", paste(c('"',private$config$refresh_token,'"'),collapse = '')),
                       ifelse(is.null(private$config$created_at), "null", paste(c('"',private$config$created_at,'"'),collapse = '')),
                       ifelse(is.null(private$config$expires_in), "null", paste(c('"',private$config$expires_in,'"'),collapse = '')),
                       ifelse(is.null(private$config$expires_at), "null", paste(c('"',private$config$expires_at,'"'),collapse = '')),
                       ifelse(is.null(private$config$client_name), "null", paste(c('"',private$config$client_name,'"'),collapse = ''))
      )
      
      #jsonlite::write_json(private$config, cacheFilePath, auto_unbox=TRUE, null="null", na="null")
      
      fileConn<-file(cacheFilePath)
      writeLines(sjson, fileConn)
      close(fileConn)
    },
    
    getClient = function() {
      
      client <- Client$new()
      
      if (! is.null(private$config)) {
        client$key = private$config$`apikey`
        client$secret = private$config$`apisecret`
      }
      
      client
    },
    
    setClient = function(client) {
      # if the client is not provided, this is essentially just a write() operation
      if (! (missing(client) || is.null(client))) {
        # set the client config we perisist to disk
        private$config$apikey = client$`key`
        private$config$apisecret = client$`secret`
        private$config$name = client$`clientName`
      }
      
      self$write()
    },
    
    getToken = function() {
      
      token <- Token$new()
      
      if (! is.null(private$config)) {
        token$access_token = private$config$access_token
        token$refresh_token = private$config$refresh_token
        token$created_at = private$config$created_at
        token$expires_in = private$config$expires_in
        token$expires_at = private$config$expires_at  
        token$username = private$config$username  
      }
      
      token
    },
    
    setToken = function(token) {
      # if the token is not provided, this is essentially just a write() operation
      if (! (missing(token) || is.null(token))) {
        
        # set the token config we perisist to disk
        private$config$access_token = token$`access_token`
        private$config$refresh_token = token$`refresh_token`
        private$config$created_at = token$`created_at`
        private$config$expires_in = token$`expires_in`
        private$config$expires_at = token$`expires_at`
        private$config$username = token$username
      }
      
      self$write()
    },
    
    getTenant = function() {
      
      tenant <- Tenant$new()
      
      if (! is.null(private$config)) {
        tenant$baseUrl = private$config$baseurl
        tenant$code = private$config$tenantid
      }
      
      tenant
    },
    
    setTenant = function(tenant) {
      
      # if the tenant is not provided, this is essentially just a write() operation
      if (! (missing(tenant) || is.null(tenant))) {
        
        # set the token config we perisist to disk
        private$config$tenantid = tenant$code
        private$config$baseurl = tenant$baseUrl
      }
      
      self$write()
    },
    
    getProperty = function(propertyName) {
     getElement(private$config, propertyName)
    }
  )
)
