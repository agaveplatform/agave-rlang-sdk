# Agave Platform Science API
#
# Power your digital lab and reduce the time from theory to discovery using the Agave Science-as-a-Service API Platform. Agave provides hosted services that allow researchers to manage data, conduct experiments, and publish and share results from anywhere at any time.
#
# Agave Platform version: 2.2.14
#
# Generated by: https://github.com/swagger-api/swagger-codegen.git

#' Create an Agave object pointing to your tenant:
#' ```
#' library(rAgave)
#' api = Agave$new(baseUrl="https://public.agaveapi.org",
#'                 username="myusername",
#'                 password="mypassword")
#' ```
#'
#' Once the object is instantiated, interact with it according to the
#' methods in the API documentation.
#'
#' For example, create a new client with:
#'
#' ```
#' clientData <- Client$new(clientName="my_client")
#' > api$clients$add_client(body=clientData)$content
#' ```
#'
#' You may also pass in a list, if preferred, over the object model
#'
#' ```
#' api$clients$create(body=list(clientName="my_client"))
#' ```
#'
#' Access any endpoint with:
#'
#' ```
#' api$systems$list_systems()
#' api$jobs$submit_job(body=Job$new(appId="head-1.0u1"))
#' ```
#'
#' Once a client is created, it is used by default to access the API.
#'
#' To make use of an existing client, pass the client's credentials into the Agave constructor:
#'
#' ```
#' api = Agave$new(baseUrl="https://public.agaveapi.co",
#'                 username="myusername", password="mypassword",
#'                 clientKey="123", clientSecret="abc")
#' ```
#'
#' Alternatively, the SDK will attempt to recover the client credentials from a predictable location disk. The default cache directory is `$HOME/.agave`. You can configure the location of the cache directory when instantiating a new `Agave` object:
#'
#' ```
#' api = Agave$new(baseUrl="https://public.agaveapi.co",
#'                 username="myusername", password="mypassword",
#'                 cacheDir="/Dropbox/agave/cache")
#' ```
#'
#' > The format of the cache file is recognized by all Agave SDK, so you can freely move across multiple SDK without having to reauthenticate each time.
#'
#' > Your password will never be written to the cache file.
#'
#' rAgave will automatically update the cache file any time you create or update your client or authenticate. Thus, subsequent instantiations can be streamlined to use the no-arg constructor as rAgave will automatically refresh your access token for you.
#'
#' ```
#' api = Agave$new()
#' ```
#'
#' rAgave leverages the [futile.logger](https://github.com/zatonovo/futile.logger) package to provide a custom logging output similar to log4j. You can enabled logging at runtime by specifying the `logLevel` parameter in the constructor. The following log levels are predefined as constants: TRACE, DEBUG, INFO, WARN, FATAL. The log level is set to FATAL by default.
#'
#' ```
#' api = Agave$new(logLevel = INFO)
#' ```
#'
#' You can also change the log level at runtime by upating the `logLevel` attibute of an Agave class instance.
#'
#' ```
#' api = Agave$new()
#' api$logLevel <- TRACE
#' profile <- api$profiles$getDetails()
#' api$logLevel <- DEBUG
#' profile <- api$jobs$listJobs()
#' api$logLevel <- FATAL
#' ```
#'
#' When enabled, logs will be written to ***agave.log*** in the currrent directory (`getwd()`). You can specify an alternative location by specifying the `logFilePath` parameter in the constructor.
#'
#' ```R
#' api = Agave$new(logFilePath = "/var/log/rAgave.log", logLevel = INFO)
#' ```
#'
#' @title Agave API parent class
#' @description
#' Agave Class
#'
#' Singleton utility class to ease auth, api client instantiation, and
#' session management.
#'
#' > Note: This class is NOT created as part of the R Swagger client
#' generation.
#'
#' @usage
#' api = Agave$new(baseUrl="https://public.agaveapi.org",
#'                 username="myusername",
#'                 password="mypassword")
#'
#' @field apps instace of [rAgave::AppsAPI]preconfigured to interact with the current auth configuration.
#'
#'   See [rAgave::AppsApi], [rAgave::Application]
#'
#'   **Usage**
#'
#'   ```
#'   api$apps$listApps(limit=10)
#'   api$apps$getAppDetails(id="fork-0.1.0", responseType="raw", pretty=TRUE)
#'   ```
#' @field clients [rAgave::ClientsApi] preconfigured to interact with the current auth configuration.
#'
#'   See [rAgave::ClientsApi], [rAgave::Client]
#'
#'   **Usage**
#'
#'   ```
#'   api$clients$listClients()
#'   api$clients$addClient(clientName="my_client")
#'   ```
#' @field jobs [rAgave::JobsApi] preconfigured to interact with the current auth configuration.
#'
#'   See [rAgave::JobsApi], [Job]
#'
#'   **Usage**
#'
#'   ```
#'   api$jobs$listJobs(limit=10)
#'   api$jobs$getJobDetails(id="4083976443515834856-242ac113-0001-007", responseType="dt")
#'   ```
#' @field files [rAgave::FilesApi] preconfigured to interact with the current auth configuration.
#'
#'   See [rAgave::FilesApi], [rAgave::FileItem]
#'
#'   **Usage**
#'
#'   ```
#'   api$files$list(path=".", systemId="linux.example.com", responseType="dt")
#'   api$files$download(path="agave.png", systemId="linux.example.com", filename="agave-logo.png")
#'   api$files$upload(destSystemId="linux.example.com", destFilePath=".", filename="agave-logo.png")
#'   ```
#' @field meta [rAgave::MetaApi] preconfigured to interact with the current auth configuration.
#'
#'   See [rAgave::MetaApi], [rAgave::Metadata], [rAgave::MetadataSchema]
#'
#'   **Usage**
#'
#'   ```
#'   api$meta$listMetadata(q=list("value.history.date"="2012-01-01T01:11:06-0600), limit=50)
#'   ```
#' @field monitors [rAgave::MonitorsApi] preconfigured to interact with the current auth configuration.
#'
#'   See [rAgave::MonitorsApi], [rAgave::Monitor]
#'
#'   **Usage**
#'
#'   ```
#'   api$monitors$listMonitors(limit=10)
#'   api$monitors$getMonitorDetails(id="3725843997056232985-242ac11e-0001-014")
#'   ```
#' @field notifications [rAgave::NotificationsApi] preconfigured to interact with the current auth configuration.
#'
#'   See [rAgave::NotificationsApi], [rAgave::Notification]
#'
#'   **Usage**
#'
#'   ```
#'   api$notifications$listNotifications(limit=10)
#'   api$notifications$getNotificationDetails(id="5952569791667432985-242ac119-0001-011")
#'   ```
#' @field profiles [rAgave::ProfilesApi] preconfigured to interact with the current auth configuration.
#'
#'   See [rAgave::ProfilesApi], [rAgave::Profile]
#'
#'   **Usage**
#'
#'   ```
#'   api$profiles$listProfiles(limit=10)
#'   api$profiles$getProfile()
#'   api$profiles$getProfile(username="nryan")
#'   ```
#' @field systems [rAgave::SystemsApi] preconfigured to interact with the current auth configuration.
#'
#'   See [rAgave::SystemsApi], [rAgave::Systems]
#'
#'   **Usage**
#'
#'   ```
#'   api$systems$listSystems(limit=10)
#'   api$systems$getSystemDetails(id="compute.example.com")
#'   ```
#' @field tags [rAgave::TagApi] preconfigured to interact with the current auth configuration.
#'
#'   See [rAgave::TagApi], [rAgave::Tag]
#'
#'   **Usage**
#'
#'   ```
#'   api$apps$listTags(limit=10)
#'   api$apps$getTagDetails(id="docker", responseType="raw", pretty=TRUE)
#'   ```
#' @field tenants [rAgave::TenantsApi] preconfigured to interact with the current auth configuration.
#'
#'   See [rAgave::TenantsApi], [rAgave::Tenant]
#'
#'   **Usage**
#'
#'   ```
#'   api$tenants$listTenants()
#'   api$tenants$getTenantDetails(id="agave.prod")
#'   ```
#' @field tokens [rAgave::TokensApi] preconfigured to interact with the current auth configuration.
#'
#'   See [rAgave::TokensApi], [rAgave::Tokens]
#'
#'   **Usage**
#'
#'   ```
#'   api$tokens$create()
#'   api$tokens$refresh()
#'   ```
#' @field transforms [rAgave::TransformsApi] preconfigured to interact with the current auth configuration.
#'
#'   See [rAgave::TransformsApi], [rAgave::Transform]
#'
#'   **Usage**
#'
#'   ```
#'   api$transforms$listTransforms(limit=10)
#'   api$transforms$getTransformDetails(id="zip-1.0")
#'   ```
#' @field uuids [rAgave::UuidsApi] preconfigured to interact with the current auth configuration.
#'
#'   See [rAgave::UuidsApi], [rAgave::Uuid]
#'
#'   **Usage**
#'
#'   ```
#'   api$uuids$lookup(uuid="4083976443515834856-242ac113-0001-007")
#'   api$uuids$resolve(uuid="4083976443515834856-242ac113-0001-007")
#'   ```
#' @field cache Instance of the [rAgave::AgaveCache currently in use
#' @field tokenInfo The current [rAgave::Token] object
#' @field clientInfo The active [rAgave::Client] application
#' @field tenantInfo The active [rAgave::Tenant] object`
#'
#' @section ManualMethods:
#' \describe{
#'
#' `$store()` persists the current token, tenant, and client info to disk in the auth cache file.
#'
#' **Usage**
#'
#' ```
#' api$store()
#' ```
#'
#' `$restore(client, token, tenant)` refreshes the client, token and tenant currently being used by the instance by reloading If any parameters are passed into the call, they will override the current values and be persisted to disk.
#'
#' **Usage**
#'
#' ```
#' api$restore()
#' api$restore(token=myToken)
#' ```
#'
#' }
#'
#' @seealso [rAgave::ClientsAPI], [rAgave::JobsAPI], [rAgave::FilesAPI], [rAgave::MetaAPI], [rAgave::MonitorsAPI], [rAgave::NotificationsAPI], [rAgave::ProfilesAPI], [rAgave::SystemsAPI], [rAgave::TagAPI], [rAgave::TenantsAPI], [rAgave::TokensAPI], [rAgave::TransformsAPI], [rAgave::UuidsApi], [rAgave::AgaveCache], [rAgave::Token], [rAgave::Client], [rAgave::Tenant]
#' @importFrom R6 R6Class
#'
#' @export
Agave <- R6::R6Class(
  "Agave",
  private = list(
    cacheDir = NULL,
    authCache = NULL,
    client = NULL,
    token = NULL,
    tenant = NULL,
    baseUrl = "https://public.agaveapi.co",
    defaultResponseType = "list",
    defaultTenant = NULL,
    initLogging = function(logLevel, logFilePath) {
      # Define the log file that will optionally be written by Agave
      # If the file does not exist, the logger will try to delete it anyway,
      # so we need to touch it if it's not present.
      if (!file.exists(logFilePath)) {
        file.create(logFilePath)
      }

      # init pylogger with files for each log level
      logger.setup(
        debugLog = logFilePath,
        infoLog = logFilePath,
        warnLog = logFilePath,
        errorLog = logFilePath,
        fatalLog = logFilePath,
        traceLog = logFilePath
      )

      # If the user provided a default log level, set that.
      if (!missing(logLevel)) {
        logger.setLevel(logLevel)
      }
    },

    initDefaultResponseType = function(responseType) {
      # user can override the global representation in which resources
      # responses from this API are returned in when calling methods of
      # this class. The same responseType attribute may be passed to any
      # public method to override individual calls as well.
      if (missing(responseType) || is.null(responseType) || nchar(responseType) == 0) {
        # we ignore and use the default
      }
      else if (responseType != "raw" && responseType != "list" && responseType != "df") {
        stop("Invalid default response type. Please specify one of: raw, list, df")
      }
      else {
        # set the response type to the class default to be used
        # whenever it is not explicitly set on a request
        private$defaultResponseType <- responseType
      }
    },

    resolveTenantCode = function(tenantCode=NULL) {
      tenantsApi <- TenantsApi$new(responseType="list")
      resolvedTenant <- NULL

      # resolve the tenant code, falling back on the cache file and the
      # AGAVE_TENANT evironment variable if no code is provided
      tenantCode <- private$resolveConfigurationProperty(explicitValue = tenantCode, configPropertyName = "tenantid", envPropertyName = "AGAVE_TENANT")
      # if found, lookup the base url for the tenant code given
      if (!is.null(tenantCode) && nchar(tenantCode) > 0) {
        tenantDetails <- tenantsApi$getDetails(codeOrUuid=tenantCode)
        if (!is.null(tenantDetails$baseUrl)) {
          resolvedTenant <- Tenant$new()
          resolvedTenant$fromJSON(tenantDetails)
        }
        else {
          logger.warn(paste0(c("Unable to resolve tenant code ",tenantCode)))
        }
      }
      else {
        logger.debug("Unable to locate tenant in the cache or environment.")
      }

      resolvedTenant
    },

    resolveTenantBaseUrl = function(baseUrl=NULL) {
      tenantsApi <- TenantsApi$new(responseType="list")
      resolvedTenant <- NULL

      # resolve the tenant base url, falling back on the cache file and the
      tenantBaseUrl <- private$resolveConfigurationProperty(explicitValue = baseUrl, configPropertyName = "baseurl", envPropertyName = "AGAVE_BASE_URL")
      # if not found, move on and return NULL
      if (is.null(tenantBaseUrl) || nchar(tenantBaseUrl) == 0) {
        logger.debug("No base url provided explicitly or found in the config file or environment.")
      }
      # if found, lookup the base url for the tenant code given
      else {
        #
        if (endsWith(tenantBaseUrl, "/")) {
          tenantBaseUrl<- substr(tenantBaseUrl, 1, nchar(tenantBaseUrl)-1)
        }

        # look up the tenants
        resp <- tenantsApi$list(responseType="list")

        # iterate looking for a matching URL
        for (t in resp) {
          if (endsWith(t$baseUrl, "/")) {
            t$baseUrl <- substr(t$baseUrl, 1, nchar(t$baseUrl)-1)
          }

          if (t$baseUrl == tenantBaseUrl) {
            resolvedTenant <- Tenant$new()
            resolvedTenant$fromJSON(t)
            break
          }
        }

        # if nothing matched, warn and return a tenant with the identified
        # base url configured. This is helpful behavior when an unregistered
        # tenant is being used
        if (is.null(resolvedTenant)) {
          logger.warn(paste0(c("Unable to resolve base url ",
                               tenantBaseUrl,
                               " to a valid tenant. No tenant code will be configured.")
                             ,collapse = ''))
          resolvedTenant <- Tenant$new(baseUrl=tenantBaseUrl)
        }
      }

      resolvedTenant
    },

    initTenant = function(baseUrl, tenant) {
      resolvedTenant <- NULL
      private$defaultTenant <- Tenant$new(code="agave.prod", baseUrl="https://public.agaveapi.co" )

      if (!missing(tenant)) {

        # if tenant is present, but null, check the environment for values
        if (is.null(tenant) || (is.list(tenant) && len(tenant) == 0)) {
          ## check the cache file and the AGAVE_TENANT evironment variable
          #tenantCode <- private$resolveConfigurationProperty(configPropertyName = "tenantid", envPropertyName = "AGAVE_TENANT")
          # lookupthe base url for the tenant code given. Null will return null
          resolvedTenant <- private$resolveTenantCode(tenantCode=NULL)
        }
        # tenant is a non null
        else if (is.list(tenant)) {
          # if no code is given in the tenant, look for a base url
          if (is.null(tenant$code) || nchar(tenant$code) == 0) {
            # if no base url is given in the tenant, look for a code in the env
            if (is.null(tenant$baseUrl) || nchar(tenant$baseUrl) == 0) {
              t <- private$resolveTenantCode(tenantCode=tenant$code)
              if (is.null(t)) {
                # nothing given in tenant or found in environment that
                # we can use. will fall back on default here
                resolvedTenant <- private$defaultTenant
              }
              else {
                resolvedTenant <- t
              }
            }
            # if a base url is given, resolve that
            else {
              # this will always return a Tenant object when any non-empty
              # value is provided
              resolvedTenant <- private$resolveTenantBaseUrl(baseUrl=tenant$baseUrl)
            }
          }
          else {
            # if the code is given, resolve it. We accept whatever we are
            # given because a null value indicates we need to fall back
            # on looking up a base url based on user input and environment
            # returning null here allows us to check for that.
            resolvedTenant <- private$resolveTenantCode(tenantCode=tenant$code)
          }
        }
        # tenant is a non-null of type string, resolve it
        else if (is.character(tenant)) {
          # We accept whatever we are
          # given because a null value indicates we need to fall back
          # on looking up a base url based on user input and environment
          # returning null here allows us to check for that.
          resolvedTenant <- private$resolveTenantCode(tenantCode=tenant)
        }
        else {
          # if some off the wall value was provided for the tenant field,
          # stop, since we don't know what to do with it.
          stop("Unknown value provided for tenant")
        }
      }

      # if a baseUrl was provided, that will trump the tenant info provided
      if (!missing(baseUrl)) {
        # if the baseurl is empty, fall back on tenant
        if (is.null(baseUrl) || nchar(baseUrl) == 0) {
          # if the tenant was not missing or is null, try to pull from the environment
          if (missing(tenant) || is.null(resolvedTenant)) {
            resolvedTenant <- private$resolveTenantFromDefaultConfiguration()
          }
          else {
            # tenant has already been resolved, so go with whatever
            # was returned from that effort
          }

        }
        # a valid baseUrl was provided, so we will will merge that
        # with whatever was returned from the existing tenant resolution
        else {
          # if tenant was not resolved, use the existing base url
          if (is.null(resolvedTenant)) {
            # resolvedTenant <- Tenant$new(baseUrl=baseUrl)
            resolvedTenant <- private$resolveTenantBaseUrl(baseUrl=baseUrl)
          }
          # if tenant was already resolved, this trumps the tenant url
          else {
            resolvedTenant$baseUrl <- baseUrl
          }
        }
      }

      # if neither tenant or baseUrl were provided, check the environment
      # and cache file.
      if (missing(tenant) && missing(baseUrl)) {
        resolvedTenant <- private$resolveTenantFromDefaultConfiguration()
      }

      if (!is.null(resolvedTenant)) {
        logger.debug(paste0(c("Tenant initialized to ",
                              resolvedTenant$code,
                             ". Base url will be ",
                             resolvedTenant$baseUrl)
                           ,collapse = ''))

      }

      private$tenant <- resolvedTenant


    },

    resolveTenantFromDefaultConfiguration = function() {
      resolvedTenant <- NULL
      # look for a tenant code to keep order of resolution in place
      t <- private$resolveTenantCode(tenantCode=NULL)

      # if that is null, we will try to resolve the base url from the environment
      if (is.null(t)) {
        logger.trace("No tenant code resolved, looking for baseUrl")
        t <- private$resolveTenantBaseUrl(baseUrl=NULL)

        # if this is null, we'll just use the default tenant
        if (is.null(t)) {
          logger.debug(paste0(c("No baseUrl found. Using default tenant, ",
                                private$defaultTenant$baseUrl), collapse = ''))
          resolvedTenant <- private$defaultTenant
        }
        else {
          logger.debug(paste0(c("Resolved baseUrl from system configuration to ",t$baseUrl), collapse = ''))
          resolvedTenant <- t
        }
      }
      # found a match, so use that
      else {
        logger.debug(paste0(c("Resolved tenant code, ",
                              t$code,
                              ". Base url will be ",
                              t$baseUrl), collapse = ''))
        resolvedTenant <- t
      }

      resolvedTenant
    },

    initClientAndAuth = function(accessToken, refreshToken, username, password, clientKey, clientSecret) {
      private$token <- private$authCache$getToken()
      private$client <- private$authCache$getClient()

      # use the provided client key or pull it from the environment or auth cache
      private$client$key <- private$resolveConfigurationProperty(explicitValue = clientKey, configPropertyName = "apikey", envPropertyName = "AGAVE_CLIENT_KEY")

      # use the provided client secret or pull it from the environment or auth cache
      private$client$secret <- private$resolveConfigurationProperty(explicitValue = clientSecret, configPropertyName = "apisecret", envPropertyName = "AGAVE_CLIENT_SECRET")

      # look for the username of the user in the environment and auth cache.
      # This will be used for interaction with the clients api and for token generation
      # as well as name resolution for auto-generated templates, etc.
      private$token$username <- private$resolveConfigurationProperty(explicitValue = username, configPropertyName = "username", envPropertyName = "AGAVE_USERNAME")

      # look for the password of the user in the environment and auth cache (should not be there).
      # This will be used for interaction with the clients api and for token generation
      # as well as name resolution for auto-generated templates, etc.
      private$token$password <- private$resolveConfigurationProperty(explicitValue = password, configPropertyName = "password", envPropertyName = "AGAVE_PASSWORD")

      # look for an access token explicitly provided for use in all authenticated api calls.
      # If present, this will be used for interaction with the clients api and for token generation
      private$token$access_token <- private$resolveConfigurationProperty(explicitValue = accessToken, configPropertyName = "access_token", envPropertyName = "AGAVE_ACCESS_TOKEN")

      # look for a refresh token explicitly provided for use in all authenticated api calls.
      # If present, this will be used to obtain a new access token when th previous one expires
      private$token$refresh_token <- private$resolveConfigurationProperty(explicitValue = refreshToken, configPropertyName = "refresh_token", envPropertyName = "AGAVE_REFRESH_TOKEN")
    },

    initResources = function() {

      # tenants api has no auth
      self$tenants <- TenantsApi$new(responseType = private$defaultResponseType)

      # init the ClientsApi api client with basic auth using the user's u/p
      if (!is.null(private$token) && !is.null(private$token$username) && !is.null(private$token$password)) {
        base64Hash <- jsonlite::base64_enc(paste(c(private$token$username, ":", private$token$password), collapse = ""))
        apiClient <- ApiClient$new(
          basePath = private$tenant$baseUrl,
          defaultHeaders = c(Authorization = paste(c("Basic", base64Hash), collapse = " "))
        )
        self$clients <- ClientsApi$new(
          apiClient = apiClient,
          cache = private$authCache,
          responseType = private$defaultResponseType
        )
      }
      # Null it out if no user credentials are set
      else {
        self$clients <- NULL
      }

      # init the TokensApi api client with basic auth using the client key and secret
      if (!is.null(private$client) && !is.null(private$client$key) && !is.null(private$client$secret)) {
        base64Hash <- jsonlite::base64_enc(paste(c(private$client$key, ":", private$client$secret), collapse = ""))
        apiClient <- ApiClient$new(
          basePath = private$tenant$baseUrl,
          defaultHeaders = c(Authorization = paste(c("Basic", base64Hash), collapse = " "))
        )
        self$tokens <- TokensApi$new(
          apiClient,
          client = private$client,
          username = private$token$username,
          password = private$token$password,
          cache = private$authCache,
          responseType = private$defaultResponseType
        )

        # refresh the token so they're ready to geaux
        logger.debug("Before initial check of auth cache")
        # logger.debug(str(private$token$toJSON()))

        resp <- NULL
        if (!is.null(private$token$refresh_token)) {
          resp <- self$tokens$refresh(refreshToken = private$token$refresh_token, responseType="list")
          if ("access_token" %in% names(resp)) {
            # logger.trace("After call to refresh token")
            # logger.trace(str(resp))
            token <- Token$new()
            token$fromJSON(resp)
            # logger.trace("After marshalling to object")
            # logger.trace(token$toJSONString())
            token$username <- private$token$username
            token$password <- private$token$password
            token$created_at <- as.integer(format(Sys.time(), "%s"))
            token$expires_at <- format(Sys.time() + token$expires_in, "%a %b %d %H:%M:%S %Y")
            private$token <- token
            logger.trace("After refresh token initialization")
            # logger.trace(str(private$token$toJSON()))

            logger.info("Successfully refreshed the existing token")
            self$store()
          }
          else {
            resp <- NULL
          }
        }

        # or pull a fresh token
        if (is.null(resp) && !is.null(private$token$username) && !is.null(private$token$password)) {
          resp <- self$tokens$create(responseType="list")
          if ("access_token" %in% names(resp)) {
            # logger.trace("After call to create token")
            # logger.trace(str(resp))
            token <- Token$new()
            token$fromJSON(resp)
            # logger.trace("After marshalling to object")
            # logger.trace(token$toJSONString())
            token$username <- private$token$username
            token$password <- private$token$password
            token$created_at <- as.integer(format(Sys.time(), "%s"))
            token$expires_at <- format(Sys.time() + token$expires_in, "%a %b %d %H:%M:%S %Y")
            private$token <- token
            # logger.trace("After new token initialization")
            # logger.trace(private$token$toJSONString())
            logger.info("Successfully obtained a fresh token")
            self$store()
          }
          else {
            # leave it be
          }
        }
        else if (is.null(resp)) {
          # nothing to do. they're not going to be able to auth any requests
          logger.warn("Unable to obtain a fresh token. No client credentials were found.")
        }
      }
      # Null it out if no client credentials are present
      else {
        self$tokens <- NULL
        logger.warn("Unable to obtain a fresh token. No client credentials were found.")
      }

      if (!is.null(private$token$access_token)) {
        # generate an api client for oauth2 authorization using the private$token$access_token previously
        # initialized
        oauthApiClient <- ApiClient$new(
          basePath = private$tenant$baseUrl,
          defaultHeaders = c(Authorization = paste("Bearer", private$token$access_token))
        )

        # init the remaining apis using bearer token auth
        self$apps <- AppsApi$new(oauthApiClient, responseType = private$defaultResponseType)
        self$meta <- MetaApi$new(oauthApiClient, responseType = private$defaultResponseType)
        self$profiles <- ProfilesApi$new(oauthApiClient, responseType = private$defaultResponseType)
        self$transforms <- TransformsApi$new(oauthApiClient, responseType = private$defaultResponseType)
        self$jobs <- JobsApi$new(oauthApiClient, responseType = private$defaultResponseType)
        self$files <- FilesApi$new(oauthApiClient, responseType = private$defaultResponseType)
        self$monitors <- MonitorsApi$new(oauthApiClient, responseType = private$defaultResponseType)
        self$systems <- SystemsApi$new(oauthApiClient, responseType = private$defaultResponseType)
        self$uuids <- UuidsApi$new(oauthApiClient, responseType = private$defaultResponseType)
        self$tags <- TagApi$new(oauthApiClient, responseType = private$defaultResponseType)
        self$notifications <- NotificationsApi$new(oauthApiClient, responseType = private$defaultResponseType)
      }
      # NULL out all oauth apis if no acces token is available
      else {
        self$apps <- NULL
        self$meta <- NULL
        self$profiles <- NULL
        self$transforms <- NULL
        self$jobs <- NULL
        self$files <- NULL
        self$monitors <- NULL
        self$systems <- NULL
        self$uuids <- NULL
        self$tags <- NULL
        self$notifications <- NULL
      }
    },

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
  ),
  public = list(
    apps = NULL,
    clients = NULL,
    jobs = NULL,
    files = NULL,
    meta = NULL,
    monitors = NULL,
    notifications = NULL,
    profiles = NULL,
    systems = NULL,
    tags = NULL,
    tenants = NULL,
    tokens = NULL,
    transforms = NULL,
    uuids = NULL,
    initialize = function(baseUrl, cacheDir=NULL, username=NULL, password=NULL, clientKey=NULL, clientSecret=NULL, accessToken=NULL, refreshToken=NULL, responseType="list", logLevel=FATAL, logFilePath="agave.log", verify=FALSE) {

      # disable ssl peer verification if requested
      if (!verify) {
        set_config( config( ssl_verifypeer = 0L ) )
      }

      # Configure logging based on user inputs, falling
      # back to silent defaults
      private$initLogging(logLevel, logFilePath)

      # set the default response type returned from individual
      # API client method invocations. Valid types are: list, df, and raw
      private$initDefaultResponseType(responseType)

      # init the auth cache object to manage our tenant, client, and credential cache
      private$authCache <- AgaveCache$new(cacheDir)

      # Configure the API endpoint to which this needs to connect.
      # This will be the base URL for all API calls. If not specified,
      # It will point to the Agave Public tenant.
      private$initTenant(baseUrl)

      # Set the user token using the passed in values. If an access token is
      # passed in, that is enough. A refresh token will automatically be
      # refreshed, regardless of age. Clients must be generated on their own.
      private$initClientAndAuth(accessToken, refreshToken, username, password, clientKey, clientSecret)

      # Finally, initialize all the Resource API classes using common
      # configuration options and shared ClientApi instances when possible.
      # If no valid auth is present, the clients will be null, indicating the
      # user needs to init their client and token before accessing the api.
      private$initResources()
    },

    restore = function(client, token, tenant) {
      "Refreshes the client, token and tenant currently being used by the instance by reloading If any parameters are passed into the call, they will override the current values and be persisted to disk."

      # if a token is provided, load that into the global cache
      if (!missing(token)) {
        if (is.list(token)) {
          private$token$fromJSON(token)
        }
        else {
          private$token$fromJSONString(token)
        }
      }
      else if (is.null(private$token)) {
        private$token <- private$authCache$getToken()
      }

      # if a client is provided, load that into the global cache
      # and use that in leu of the existing keys
      if (!missing(client)) {
        private$client <- Client$new()
        if (is.list(client)) {
          private$client$fromJSON(client)
        }
        else {
          private$client$fromJSONString(client)
        }
      }
      else if (is.null(private$client)) {
        private$client <- private$authCache$getClient()
      }

      # if a tenant has been provided, switch over to that in the
      # global config and update the baseurl, id, etc for all subsequent calls
      if (!missing(tenant)) {
        # TODO: validate tenant info and check for change of tenant
        # to auto invaliate the current token and client if not set above.
        private$tenant <- Tenant$new()
        if (is.list(tenant)) {
          logger.trace("Tenant provided is a list")
          private$tenant$fromJSON(tenant)
        }
        else {
          private$tenant$fromJSONString(tenant)
        }
      }
      else {
        private$tenant <- private$authCache$getTenant()
      }

      # Reinitialize all resource API clients with the new configs. This will
      # create new instances and reconfigure them from scratch.
      private$initResources()
    },

    store = function() {
      "Persists the current token, tenant, and client info to disk in the auth cache file."

      # write the current token, client, and tenant into the auth cache
      # file in the cache directory specified at initialization time
      private$authCache$setToken(private$token)
      private$authCache$setClient(private$client)
      private$authCache$setTenant(private$tenant)

      # force the auth cache to disk
      # private$authCache$write()
    }
  ),
  active = list(
    cache = function(value) {
      # This is the last copy of the cache read from disk.
      # It may have changed out of band.
      private$authCache$current
    },
    tenantInfo = function(tenant) {
      # The current tenant the SDK is configured to call
      if (!missing(tenant) && !is.null(tenant)) {
        tenantObject <- Tenant$new()
        tenantObject$fromJSON(tenant)
        private$tenant <- tenant
      }
      private$tenant
    },
    tokenInfo = function(token) {
      # The current token the SDK is configured to use in all
      # OAuth2 authenticated calls
      if (!missing(token) && !is.null(token)) {
        tokenObject <- Token$new()
        tokenObject$fromJSON(token)
        private$token <- token
      }

      private$token
    },
    clientInfo = function(client) {
      # The client used to perform token management against the
      # Agave OAuth2 server
      if (!missing(client) && !is.null(client)) {
        clientObject <- Client$new()
        clientObject$fromJSON(client)
        private$client <- clientObject
      }

      private$client
    },
    authCheck = function(value) {

      # flush the current session to disk to ensure
      # the cache copy is up to date
      self$store()

      # reload the cache from disk
      private$authCache$load()

      # print that info
      private$authCache$current
    },
    logLevel = function(value) {
      # The logging level to which the client will output info
      # beware TRACE logging, it prints to STDOUT and the log file
      logger.setLevel(value)
    }
  )
)
