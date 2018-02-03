# Agave Platform Science API
#
# Power your digital lab and reduce the time from theory to discovery using the Agave Science-as-a-Service API Platform. Agave provides hosted services that allow researchers to manage data, conduct experiments, and publish and share results from anywhere at any time.
#
# Agave Platform version: 2.2.14
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git


#' The Agave Monitors API provides a familiar paradigm for monitoring the use ability and accessibility of storage and execution systems you registered with Agave. Similar to services like Pingdom, Pagerduty, and WebCron, the Monitors API allows you to to create regular health checks on a registered system. Unlike standard uptime services, Agave will check that your system is responsive and accessible by performing proactive tests on availability (ping), accessibility (authentication), and functionality (listing or echo). Each check result is persisted and the check history of a given monitor is queryable through the API. As with all resources in the Agave Platform, a full event model is available so you can subscribe to event you care about such as failed checks, restored system availability, and system disablement.
#'
#' Read more about the Monitors API in the [Agave Developer's Guide](http://docs.agaveplatform.org/#/monitors)
#'
#' @title Agave Monitors API operations
#' @description
#' MonitorsApi Class
#'
#' @section Arguments:
#' \describe{
#'
#' `apiClient` a [rAgave::ApiClient] instance preconfigured to speak to the Agave Platform.
#'
#' `cache` an [rAgave::AgaveCache] instance pointing to the persistent auth cache file on disk.
#'
#' `responseType` the default object type methods of this class should return. Valid values are:
#' * **raw**: the raw JSON string response from the API. You may optionally include
#'   `pretty=TRUE` in the method call to receive pretty printed JSON.
#' * **list**: a standard R list object. This is the default value.
#' * **dt**: a data table
#'
#' }
#'
#' @usage
#' monitors <- MonitorsApi$new( apiClient = ApiClient$new(), cache = AgaveCache$new() )
#'
#' @importFrom R6 R6Class
#'
#' @section Methods:
#' \describe{
#'
#' `$addMonitoringTasks()` Add a new monitoring task
#'
#' **Usage**
#'
#' ```
#' monitors$addMonitoringTasks$listMonitors(body, naked, )
#' ```
#'
#'
#' `$deleteMonitoringTask()` Deletes a monitor.
#'
#' **Usage**
#'
#' ```
#' monitors$deleteMonitoringTask$listMonitors(monitorId, naked, )
#' ```
#'
#'
#' `$forceMonitoringTaskCheck()` Forces a monitor check to run.
#'
#' **Usage**
#'
#' ```
#' monitors$forceMonitoringTaskCheck$listMonitors(monitorId, naked, )
#' ```
#'
#'
#' `$getMonitoringTask()` Retrieve a specific monitor.
#'
#' **Usage**
#'
#' ```
#' monitors$getMonitoringTask$listMonitors(monitorId, naked, search, )
#' monitors$getMonitoringTask$listMonitors(search=list("foo"="bar"))
#' ```
#'
#'
#' `$getMonitoringTaskCheck()` Retrieve a specific monitor check
#'
#' **Usage**
#'
#' ```
#' monitors$getMonitoringTaskCheck$listMonitors(monitorId, checkId, naked, search, )
#' monitors$getMonitoringTaskCheck$listMonitors(search=list("foo"="bar"))
#' ```
#'
#'
#' `$listMonitoringTaskChecks()` Retrieve checks for a specific monitor
#'
#' **Usage**
#'
#' ```
#' monitors$listMonitoringTaskChecks$listMonitors(monitorId, naked, startDate, endDate, result, limit, offset, search, )
#' monitors$listMonitoringTaskChecks$listMonitors(search=list("foo"="bar"))
#' ```
#'
#'
#' `$listMonitoringTasks()` Retrieve Monitor for a specific resource.
#'
#' **Usage**
#'
#' ```
#' monitors$listMonitoringTasks$listMonitors(naked, target, active, limit, offset, search, )
#' monitors$listMonitoringTasks$listMonitors(search=list("foo"="bar"))
#' ```
#'
#'
#' `$updateMonitoringTask()` Updates an existing monitor.
#'
#' **Usage**
#'
#' ```
#' monitors$updateMonitoringTask$listMonitors(body, naked, monitorId, )
#' ```
#'
#' }
#'
#' @name MonitorsApi
#' @seealso  [rAgave::ApiClient] [rAgave::Agave] [rAgave::MonitoringTaskCheck][rAgave::MonitoringTaskDetails][rAgave::MonitoringTaskSummary]
#' @export
MonitorsApi <- R6::R6Class(
  'MonitorsApi',
  private = list(
    userAgent = "Agave-SDK/0.2.0/r",
    apiClient = NULL,
    responseType = "list",
    formatResponse = function(resp, args=list()) {

      # read the args from the unnamed request args
      if ("responseType" %in% names(args)) {
        responseType = args$responseType
      }
      else {
        responseType = NULL
      }

      if (is.null(responseType) || nchar(responseType) == 0) {
        responseType = private$responseType
      }

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        logger.debug(jsonlite::toJSON(httr::content(resp,stringsAsFactors = FALSE), auto_unbox=TRUE, null="null", na="null"))

        if (responseType == "raw") {
          # check for the undeclared pretty attibute to pretty-print the json response
          prettyPrint <- ("pretty" %in% names(args) && isTRUE(args$pretty))
          jsonlite::toJSON(httr::content(resp, stringsAsFactors = FALSE), auto_unbox=TRUE, null="null", na="null", pretty=prettyPrint)
        }
        else {
          jsonResp <- httr::content(resp)
          if ("result" %in% names(jsonResp)) {
            jsonResp <- jsonResp$result
          }

          if ((responseType == "df" || responseType == "dataframe") && length(jsonResp) > 0) {
            # lookup properties of object. if null, it's a list. if not null, it's an object
            colNames <- names(jsonResp)
            if (is.null(colNames)) {
              # convert to a list of dataframes
              do.call("rbind", lapply(jsonResp, as.data.frame, col.names=factor(names(jsonResp[[1]]))))
            }
            else {
              # convert object to single data frame
              as.data.frame(jsonResp)
            }
          }
          else {
            jsonResp
          }
        }
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        logger.warn(jsonlite::toJSON(httr::content(resp, "text", encoding="UTF-8"), auto_unbox=TRUE, null="null", na="null"))
        httr::content(resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        logger.warn(jsonlite::toJSON(httr::content(resp, "text", encoding="UTF-8"), auto_unbox=TRUE, null="null", na="null"))
        httr::content(resp)
      }
    }
  ),
  public = list(
    initialize = function(apiClient, responseType){
      if (!missing(apiClient)) {
        private$apiClient <- apiClient
      }
      else {
        private$apiClient <- ApiClient$new()
      }

      # user can override the global representation in which resources
      # responses from this API are returned in when calling methods of
      # this class. The same responseType attribute may be passed to any
      # public method to override individual calls as well.
      if (missing(responseType) || is.null(responseType) || nchar(responseType) == 0) {
        # we ignore and use the default
      }
      else if (responseType != "raw" && responseType != "list" && responseType != "df") {
        stop("Invalid responseType. Please specify one of: raw, list, df")
      }
      else {
        # set the response type to the class default to be used
        # whenever it is not explicitly set on a request
        private$responseType = responseType
      }
    },
    addMonitoringTasks = function(body, naked,  ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if (!missing(`naked`)) {
        queryParams['naked'] <- naked
      }

      if (!missing(`body`)) {
        if (!is.list(`body`)) {
          body <- `body`$toJSON()
        }
      } else {
        body <- NULL
      }

      urlPath <- "/monitors/v2/"
      resp <- private$apiClient$callApi(url = paste0(private$apiClient$basePath, urlPath),
                                 method = "POST",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      # Send the response to the common filtering method to marshal the
      # response into the format requested by the user in the Agave global
      # configuration, API class instance, or individual method invocation.
      private$formatResponse(resp, args);

    },
    deleteMonitoringTask = function(monitorId, naked,  ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if (!missing(`naked`)) {
        queryParams['naked'] <- naked
      }

      urlPath <- "/monitors/v2/{monitorId}"
      if (!missing(`monitorId`)) {
        urlPath <- gsub(paste0("\\{", "monitorId", "\\}"), `monitorId`, urlPath)
      }

      resp <- private$apiClient$callApi(url = paste0(private$apiClient$basePath, urlPath),
                                 method = "DELETE",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      # Send the response to the common filtering method to marshal the
      # response into the format requested by the user in the Agave global
      # configuration, API class instance, or individual method invocation.
      private$formatResponse(resp, args);

    },
    forceMonitoringTaskCheck = function(monitorId, naked,  ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if (!missing(`naked`)) {
        queryParams['naked'] <- naked
      }

      urlPath <- "/monitors/v2/{monitorId}/checks"
      if (!missing(`monitorId`)) {
        urlPath <- gsub(paste0("\\{", "monitorId", "\\}"), `monitorId`, urlPath)
      }

      resp <- private$apiClient$callApi(url = paste0(private$apiClient$basePath, urlPath),
                                 method = "POST",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      # Send the response to the common filtering method to marshal the
      # response into the format requested by the user in the Agave global
      # configuration, API class instance, or individual method invocation.
      private$formatResponse(resp, args);

    },
    getMonitoringTask = function(monitorId, naked, search,  ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if (!missing(search)) {
        queryParams <- search
      }

      if (!missing(`naked`)) {
        queryParams['naked'] <- naked
      }

      urlPath <- "/monitors/v2/{monitorId}"
      if (!missing(`monitorId`)) {
        urlPath <- gsub(paste0("\\{", "monitorId", "\\}"), `monitorId`, urlPath)
      }

      resp <- private$apiClient$callApi(url = paste0(private$apiClient$basePath, urlPath),
                                 method = "GET",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      # Send the response to the common filtering method to marshal the
      # response into the format requested by the user in the Agave global
      # configuration, API class instance, or individual method invocation.
      private$formatResponse(resp, args);

    },
    getMonitoringTaskCheck = function(monitorId, checkId, naked, search,  ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if (!missing(search)) {
        queryParams <- search
      }

      if (!missing(`naked`)) {
        queryParams['naked'] <- naked
      }

      urlPath <- "/monitors/v2/{monitorId}/checks/{checkId}"
      if (!missing(`monitorId`)) {
        urlPath <- gsub(paste0("\\{", "monitorId", "\\}"), `monitorId`, urlPath)
      }

      if (!missing(`checkId`)) {
        urlPath <- gsub(paste0("\\{", "checkId", "\\}"), `checkId`, urlPath)
      }

      resp <- private$apiClient$callApi(url = paste0(private$apiClient$basePath, urlPath),
                                 method = "GET",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      # Send the response to the common filtering method to marshal the
      # response into the format requested by the user in the Agave global
      # configuration, API class instance, or individual method invocation.
      private$formatResponse(resp, args);

    },
    listMonitoringTaskChecks = function(monitorId, naked, startDate, endDate, result, limit, offset, search,  ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if (!missing(search)) {
        queryParams <- search
      }

      if (!missing(`startDate`)) {
        queryParams['startDate'] <- startDate
      }

      if (!missing(`endDate`)) {
        queryParams['endDate'] <- endDate
      }

      if (!missing(`result`)) {
        queryParams['result'] <- result
      }

      if (!missing(`limit`)) {
        queryParams['limit'] <- limit
      }

      if (!missing(`offset`)) {
        queryParams['offset'] <- offset
      }

      if (!missing(`naked`)) {
        queryParams['naked'] <- naked
      }

      urlPath <- "/monitors/v2/{monitorId}/checks"
      if (!missing(`monitorId`)) {
        urlPath <- gsub(paste0("\\{", "monitorId", "\\}"), `monitorId`, urlPath)
      }

      resp <- private$apiClient$callApi(url = paste0(private$apiClient$basePath, urlPath),
                                 method = "GET",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      # Send the response to the common filtering method to marshal the
      # response into the format requested by the user in the Agave global
      # configuration, API class instance, or individual method invocation.
      private$formatResponse(resp, args);

    },
    listMonitoringTasks = function(naked, target, active, limit, offset, search,  ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if (!missing(search)) {
        queryParams <- search
      }

      if (!missing(`target`)) {
        queryParams['target'] <- target
      }

      if (!missing(`active`)) {
        queryParams['active'] <- active
      }

      if (!missing(`naked`)) {
        queryParams['naked'] <- naked
      }

      if (!missing(`limit`)) {
        queryParams['limit'] <- limit
      }

      if (!missing(`offset`)) {
        queryParams['offset'] <- offset
      }

      urlPath <- "/monitors/v2/"
      resp <- private$apiClient$callApi(url = paste0(private$apiClient$basePath, urlPath),
                                 method = "GET",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      # Send the response to the common filtering method to marshal the
      # response into the format requested by the user in the Agave global
      # configuration, API class instance, or individual method invocation.
      private$formatResponse(resp, args);

    },
    updateMonitoringTask = function(body, naked, monitorId,  ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if (!missing(`naked`)) {
        queryParams['naked'] <- naked
      }

      if (!missing(`body`)) {
        if (!is.list(`body`)) {
          body <- `body`$toJSON()
        }
      } else {
        body <- NULL
      }

      urlPath <- "/monitors/v2/{monitorId}"
      if (!missing(`monitorId`)) {
        urlPath <- gsub(paste0("\\{", "monitorId", "\\}"), `monitorId`, urlPath)
      }

      resp <- private$apiClient$callApi(url = paste0(private$apiClient$basePath, urlPath),
                                 method = "POST",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      # Send the response to the common filtering method to marshal the
      # response into the format requested by the user in the Agave global
      # configuration, API class instance, or individual method invocation.
      private$formatResponse(resp, args);

    }
  )
)
