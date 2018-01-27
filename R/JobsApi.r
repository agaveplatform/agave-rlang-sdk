# Agave Platform Science API
# 
# Power your digital lab and reduce the time from theory to discovery using the Agave Science-as-a-Service API Platform. Agave provides hosted services that allow researchers to manage data, conduct experiments, and publish and share results from anywhere at any time.
# 
# OpenAPI spec version: 2.1.11
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git

#' @title Jobs operations
#' @description swagger.Jobs
#'
#' @field path Stores url path of the request.
#' @field apiClient Handles the client-server communication.
#' @field userAgent Set the user agent of the request.
#'
#' @importFrom R6 R6Class
#'
#' @section Methods:
#' \describe{
#'
#' add_job_permission 
#'
#'
#' clear_job_permissions 
#'
#'
#' delete_job 
#'
#'
#' delete_job_permission 
#'
#'
#' download_job_output 
#'
#'
#' get_job_details 
#'
#'
#' get_job_history 
#'
#'
#' get_job_permission 
#'
#'
#' get_job_status 
#'
#'
#' list_job_outputs 
#'
#'
#' list_job_permissions 
#'
#'
#' list_jobs 
#'
#'
#' resubmit_job 
#'
#'
#' submit_job 
#'
#'
#' update_job_permission 
#'
#' }
#'
#' @export
JobsApi <- R6::R6Class(
  'JobsApi',
  public = list(
    userAgent = "Swagger-Codegen/1.0.0/r",
    apiClient = NULL,
    initialize = function(apiClient){
      if (!missing(apiClient)) {
        self$apiClient <- apiClient
      }
      else {
        self$apiClient <- ApiClient$new()
      }
    },
    add_job_permission = function(job_id, body, naked, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if (!missing(`naked`)) {
        queryParams['naked'] <- naked
      }

      if (!missing(`body`)) {
        body <- `body`$toJSONString()
      } else {
        body <- NULL
      }

      urlPath <- "/jobs/v2/{jobId}/pems"
      if (!missing(`job_id`)) {
        urlPath <- gsub(paste0("\\{", "jobId", "\\}"), `job_id`, urlPath)
      }

      resp <- self$apiClient$callApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "POST",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        returnObject <- Permission$new()
        result <- returnObject$fromJSON(httr::content(resp, "text", encoding = "UTF-8"))
        Response$new(returnObject, resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        Response$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        Response$new("API server error", resp)
      }

    },
    clear_job_permissions = function(job_id, naked, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if (!missing(`naked`)) {
        queryParams['naked'] <- naked
      }

      urlPath <- "/jobs/v2/{jobId}/pems"
      if (!missing(`job_id`)) {
        urlPath <- gsub(paste0("\\{", "jobId", "\\}"), `job_id`, urlPath)
      }

      resp <- self$apiClient$callApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "DELETE",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        # void response, no need to return anything
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        Response$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        Response$new("API server error", resp)
      }

    },
    delete_job = function(job_id, naked, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if (!missing(`naked`)) {
        queryParams['naked'] <- naked
      }

      urlPath <- "/jobs/v2/{jobId}"
      if (!missing(`job_id`)) {
        urlPath <- gsub(paste0("\\{", "jobId", "\\}"), `job_id`, urlPath)
      }

      resp <- self$apiClient$callApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "DELETE",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        # void response, no need to return anything
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        Response$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        Response$new("API server error", resp)
      }

    },
    delete_job_permission = function(job_id, username, naked, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if (!missing(`naked`)) {
        queryParams['naked'] <- naked
      }

      urlPath <- "/jobs/v2/{jobId}/pems/{username}"
      if (!missing(`job_id`)) {
        urlPath <- gsub(paste0("\\{", "jobId", "\\}"), `job_id`, urlPath)
      }

      if (!missing(`username`)) {
        urlPath <- gsub(paste0("\\{", "username", "\\}"), `username`, urlPath)
      }

      resp <- self$apiClient$callApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "DELETE",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        # void response, no need to return anything
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        Response$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        Response$new("API server error", resp)
      }

    },
    download_job_output = function(job_id, file_path, force, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if (!missing(`force`)) {
        queryParams['force'] <- force
      }

      urlPath <- "/jobs/v2/{jobId}/outputs/media/{filePath}"
      if (!missing(`job_id`)) {
        urlPath <- gsub(paste0("\\{", "jobId", "\\}"), `job_id`, urlPath)
      }

      if (!missing(`file_path`)) {
        urlPath <- gsub(paste0("\\{", "filePath", "\\}"), `file_path`, urlPath)
      }

      resp <- self$apiClient$callApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "GET",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        # void response, no need to return anything
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        Response$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        Response$new("API server error", resp)
      }

    },
    get_job_details = function(job_id, naked, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if (!missing(`naked`)) {
        queryParams['naked'] <- naked
      }

      urlPath <- "/jobs/v2/{jobId}"
      if (!missing(`job_id`)) {
        urlPath <- gsub(paste0("\\{", "jobId", "\\}"), `job_id`, urlPath)
      }

      resp <- self$apiClient$callApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "GET",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        returnObject <- Job$new()
        result <- returnObject$fromJSON(httr::content(resp))
        Response$new(returnObject, resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        Response$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        Response$new("API server error", resp)
      }

    },
    get_job_history = function(job_id, naked, limit, offset, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if (!missing(`naked`)) {
        queryParams['naked'] <- naked
      }

      if (!missing(`limit`)) {
        queryParams['limit'] <- limit
      }

      if (!missing(`offset`)) {
        queryParams['offset'] <- offset
      }

      urlPath <- "/jobs/v2/{jobId}/history"
      if (!missing(`job_id`)) {
        urlPath <- gsub(paste0("\\{", "jobId", "\\}"), `job_id`, urlPath)
      }

      resp <- self$apiClient$callApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "GET",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        jsonResp <- jsonlite::fromJSON(httr::content(resp, "text", encoding = "UTF-8"), simplifyVector = FALSE)
        returnArray <- vector('list', length(jsonResp$result))
        i <- 1
        for (returnJsonObject in jsonResp$result){
          returnObject <- JobHistory$new()
          result <- returnObject$fromJSON(returnJsonObject)
          returnArray[[ i ]] <- returnObject
          i <- i + 1
        }

        Response$new(returnArray, resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        Response$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        Response$new("API server error", resp)
      }

    },
    get_job_permission = function(job_id, username, naked, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if (!missing(`naked`)) {
        queryParams['naked'] <- naked
      }

      urlPath <- "/jobs/v2/{jobId}/pems/{username}"
      if (!missing(`job_id`)) {
        urlPath <- gsub(paste0("\\{", "jobId", "\\}"), `job_id`, urlPath)
      }

      if (!missing(`username`)) {
        urlPath <- gsub(paste0("\\{", "username", "\\}"), `username`, urlPath)
      }

      resp <- self$apiClient$callApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "GET",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        returnObject <- Permission$new()
        result <- returnObject$fromJSON(httr::content(resp, "text", encoding = "UTF-8"))
        Response$new(returnObject, resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        Response$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        Response$new("API server error", resp)
      }

    },
    get_job_status = function(job_id, naked, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if (!missing(`naked`)) {
        queryParams['naked'] <- naked
      }

      urlPath <- "/jobs/v2/{jobId}/status"
      if (!missing(`job_id`)) {
        urlPath <- gsub(paste0("\\{", "jobId", "\\}"), `job_id`, urlPath)
      }

      resp <- self$apiClient$callApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "GET",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        returnObject <- JobStatusSummary$new()
        result <- returnObject$fromJSON(httr::content(resp, "text", encoding = "UTF-8"))
        Response$new(returnObject, resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        Response$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        Response$new("API server error", resp)
      }

    },
    list_job_outputs = function(job_id, file_path, naked, limit, offset, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if (!missing(`naked`)) {
        queryParams['naked'] <- naked
      }

      if (!missing(`limit`)) {
        queryParams['limit'] <- limit
      }

      if (!missing(`offset`)) {
        queryParams['offset'] <- offset
      }

      urlPath <- "/jobs/v2/{jobId}/outputs/listings/{filePath}"
      if (!missing(`job_id`)) {
        urlPath <- gsub(paste0("\\{", "jobId", "\\}"), `job_id`, urlPath)
      }

      if (!missing(`file_path`)) {
        urlPath <- gsub(paste0("\\{", "filePath", "\\}"), `file_path`, urlPath)
      }

      resp <- self$apiClient$callApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "GET",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        jsonResp <- jsonlite::fromJSON(httr::content(resp, "text", encoding = "UTF-8"), simplifyVector = FALSE)
        returnArray <- vector('list', length(jsonResp$result))
        i <- 1
        for (returnJsonObject in jsonResp$result){
          returnObject <- FileInfo$new()
          result <- returnObject$fromJSON(returnJsonObject)
          returnArray[[ i ]] <- returnObject
          i <- i + 1
        }

        Response$new(returnArray, resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        Response$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        Response$new("API server error", resp)
      }

    },
    list_job_permissions = function(job_id, naked, limit, offset, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if (!missing(`limit`)) {
        queryParams['limit'] <- limit
      }

      if (!missing(`offset`)) {
        queryParams['offset'] <- offset
      }

      if (!missing(`naked`)) {
        queryParams['naked'] <- naked
      }

      urlPath <- "/jobs/v2/{jobId}/pems"
      if (!missing(`job_id`)) {
        urlPath <- gsub(paste0("\\{", "jobId", "\\}"), `job_id`, urlPath)
      }

      resp <- self$apiClient$callApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "GET",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        jsonResp <- jsonlite::fromJSON(httr::content(resp, "text", encoding = "UTF-8"), simplifyVector = FALSE)
        returnArray <- vector('list', length(jsonResp$result))
        i <- 1
        for (returnJsonObject in jsonResp$result){
          returnObject <- Permission$new()
          result <- returnObject$fromJSON(returnJsonObject)
          returnArray[[ i ]] <- returnObject
          i <- i + 1
        }

        Response$new(returnArray, resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        Response$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        Response$new("API server error", resp)
      }

    },
    list_jobs = function(naked, app_id, archive, archive_path, archive_system, batch_queue, execution_system, id, inputs, local_id, max_runtime, memory_per_node, name, node_count, output_path, parameters, processors_per_node, retries, start_time, status, submit_time, visible, limit, offset, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if (!missing(`app_id`)) {
        queryParams['appId'] <- app_id
      }

      if (!missing(`archive`)) {
        queryParams['archive'] <- archive
      }

      if (!missing(`archive_path`)) {
        queryParams['archivePath'] <- archive_path
      }

      if (!missing(`archive_system`)) {
        queryParams['archiveSystem'] <- archive_system
      }

      if (!missing(`batch_queue`)) {
        queryParams['batchQueue'] <- batch_queue
      }

      if (!missing(`execution_system`)) {
        queryParams['executionSystem'] <- execution_system
      }

      if (!missing(`id`)) {
        queryParams['id'] <- id
      }

      if (!missing(`inputs`)) {
        queryParams['inputs'] <- inputs
      }

      if (!missing(`local_id`)) {
        queryParams['localId'] <- local_id
      }

      if (!missing(`max_runtime`)) {
        queryParams['maxRuntime'] <- max_runtime
      }

      if (!missing(`memory_per_node`)) {
        queryParams['memoryPerNode'] <- memory_per_node
      }

      if (!missing(`name`)) {
        queryParams['name'] <- name
      }

      if (!missing(`node_count`)) {
        queryParams['nodeCount'] <- node_count
      }

      if (!missing(`output_path`)) {
        queryParams['outputPath'] <- output_path
      }

      if (!missing(`parameters`)) {
        queryParams['parameters'] <- parameters
      }

      if (!missing(`processors_per_node`)) {
        queryParams['processorsPerNode'] <- processors_per_node
      }

      if (!missing(`retries`)) {
        queryParams['retries'] <- retries
      }

      if (!missing(`start_time`)) {
        queryParams['startTime'] <- start_time
      }

      if (!missing(`status`)) {
        queryParams['status'] <- status
      }

      if (!missing(`submit_time`)) {
        queryParams['submitTime'] <- submit_time
      }

      if (!missing(`visible`)) {
        queryParams['visible'] <- visible
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

      urlPath <- "/jobs/v2/"
      resp <- self$apiClient$callApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "GET",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        jsonResp <- jsonlite::fromJSON(httr::content(resp, "text", encoding = "UTF-8"), simplifyVector = FALSE)
        returnArray <- vector('list', length(jsonResp$result))
        i <- 1
        for (returnJsonObject in jsonResp$result){
          returnObject <- Job$new()
          result <- returnObject$fromJSON(returnJsonObject)
          returnArray[[ i ]] <- returnObject
          i <- i + 1
        }

        Response$new(returnArray, resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        Response$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        Response$new("API server error", resp)
      }

    },
    resubmit_job = function(job_id, body, naked, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if (!missing(`naked`)) {
        queryParams['naked'] <- naked
      }

      if (!missing(`body`)) {
        body <- `body`$toJSONString()
      } else {
        body <- NULL
      }

      urlPath <- "/jobs/v2/{jobId}"
      if (!missing(`job_id`)) {
        urlPath <- gsub(paste0("\\{", "jobId", "\\}"), `job_id`, urlPath)
      }

      resp <- self$apiClient$callApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "POST",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        returnObject <- Job$new()
        result <- returnObject$fromJSON(httr::content(resp, "text", encoding = "UTF-8"))
        Response$new(returnObject, resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        Response$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        Response$new("API server error", resp)
      }

    },
    submit_job = function(body, naked, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if (!missing(`naked`)) {
        queryParams['naked'] <- naked
      }

      if (!missing(`body`)) {
        body <- `body`$toJSONString()
      } else {
        body <- NULL
      }

      urlPath <- "/jobs/v2/"
      resp <- self$apiClient$callApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "POST",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        returnObject <- Job$new()
        result <- returnObject$fromJSON(httr::content(resp, "text", encoding = "UTF-8"))
        Response$new(returnObject, resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        Response$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        Response$new("API server error", resp)
      }

    },
    update_job_permission = function(job_id, username, body, naked, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if (!missing(`naked`)) {
        queryParams['naked'] <- naked
      }

      if (!missing(`body`)) {
        body <- `body`$toJSONString()
      } else {
        body <- NULL
      }

      urlPath <- "/jobs/v2/{jobId}/pems/{username}"
      if (!missing(`job_id`)) {
        urlPath <- gsub(paste0("\\{", "jobId", "\\}"), `job_id`, urlPath)
      }

      if (!missing(`username`)) {
        urlPath <- gsub(paste0("\\{", "username", "\\}"), `username`, urlPath)
      }

      resp <- self$apiClient$callApi(url = paste0(self$apiClient$basePath, urlPath),
                                 method = "POST",
                                 queryParams = queryParams,
                                 headerParams = headerParams,
                                 body = body,
                                 ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        returnObject <- Permission$new()
        result <- returnObject$fromJSON(httr::content(resp, "text", encoding = "UTF-8"))
        Response$new(returnObject, resp)
      } else if (httr::status_code(resp) >= 400 && httr::status_code(resp) <= 499) {
        Response$new("API client error", resp)
      } else if (httr::status_code(resp) >= 500 && httr::status_code(resp) <= 599) {
        Response$new("API server error", resp)
      }

    }
  )
)
