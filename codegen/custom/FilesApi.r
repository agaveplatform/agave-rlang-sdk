# Agave Platform Science API
#
# Power your digital lab and reduce the time from theory to discovery using the Agave Science-as-a-Service API Platform. Agave provides hosted services that allow researchers to manage data, conduct experiments, and publish and share results from anywhere at any time.
#
# Agave Platform version: 2.2.14
#
# Generated by: https://github.com/swagger-api/swagger-codegen.git

#' @title Files operations
#' @description rAgave.Files
#'
#' @importFrom R6 R6Class
#'
#' @section Methods:
#' \describe{
#'
#' clear_file_item_permissions
#'
#' `$delete
#'
#'
#' `$download(path, systemId, filename)` Downloads the file on th remote system
#'   to the local disk. The original remote filename is preserved if none is provied.`
#'
#'
#' `$readStream(path, systemId, callback)` Fetches the remote file as a byte
#'   stream an returns it to the callback function as an argument.
#'
#'
#' `transfer(path, systemId, source, body)` Initiate a transfer of a file from
#'   one location to another. For convenience, the `source` url can be provided.
#'   For detailed transfer requests including policy, notifications, permissions,
#'   etc, provide a valid body to pass on to the API.
#'
#'   ***If the transfer is within a single system, it is
#'   usually faster to use the copy action of a manage operation.***
#'
#'   The source URL may be given in the following forms:
#'   * _File path_: relative or absolute path on your default storage system
#'   * _Agave URL_: An internal Agave URL of the form `agave://<systemId>/<path>
#'   * _Public URL_: Any publicy accessible URL with a supported data protocol.
#'
#' `$upload(path, systemId, localPath, body)`  Upload a local file to the given
#'   system within the given directory path. The remote path must be a directory.
#'   If no body is provided, the local filename is preserved and will overwrite
#'   a remote file with the same name, if present.
#'
#'   For detailed transfer requests including policy, notifications, permissions,
#'   etc, provide a valid body to pass on to the API.
#'
#'
#'
#' `$manage(path, systemId, body)` Performs management actions on the file item
#'   on the given system at the given path
#'
#' `$history(path, systemId)` Lists history of the file item on the given system
#'   at the given path.
#'
#'  
#'
#' `$listPermissions()` List the permissions assigned to file item on the given
#'   system at the given path.
#'
#'
#' `$list()` List the file item at the given path on the given system.
#'
#'
#' `$updatePermissions(path, systemId, username, permission, recursive)` Add
#'   or update a user permission for the given file item on the given system.
#'
#' }
#'
#' @export
FilesApi <- R6::R6Class(
  'FilesApi',
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

          if (responseType == "df" && length(jsonResp) > 0) {
            # lookup properties of object. if null, it's a list. if not null, it's an object
            colNames <- names(jsonResp)
            if (is.null(colNames)) {
              # convert to a list of dataframes

              do.call("rbind.fill", lapply(jsonResp, as.data.frame, col.names=factor(names(jsonResp[[1]]))))
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
    delete = function(systemId, path, systemId...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if ("filter" %in% names(args)) {
        queryParams['filter'] <- args$filter
      }

      if (missing(systemId)) {
        urlPath <- "/files/v2/media/{filePath}"
      }
      else {
        urlPath <- "/files/v2/media/system/{systemId}/{filePath}"
        urlPath <- gsub(paste0("\\{", "systemId", "\\}"), `systemId`, urlPath)
      }

      if (!missing(`path`)) {
        urlPath <- gsub(paste0("\\{", "filePath", "\\}"), `path`, urlPath)
      }

      resp <- private$apiClient$callApi(url = paste0(private$apiClient$basePath, urlPath),
                                        method = "DELETE",
                                        queryParams = queryParams,
                                        headerParams = headerParams,
                                        body = body,
                                        ...)

      private$formatResponse(resp, args)
    },
    download = function(path, systemId, filename, overwrite=FALSE, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if (missing(filename)) {
        filename <- basename(path)
      }

      if (missing(systemId)) {
        urlPath <- "/files/v2/media/{filePath}"
      }
      else {
        urlPath <- "/files/v2/media/system/{systemId}/{filePath}"
        urlPath <- gsub(paste0("\\{", "systemId", "\\}"), `systemId`, urlPath)
      }

      if (!missing(`path`)) {
        urlPath <- gsub(paste0("\\{", "filePath", "\\}"), `path`, urlPath)
      }

      resp <- private$apiClient$callApi(url = paste0(private$apiClient$basePath, urlPath),
                                        method = "GET",
                                        queryParams = queryParams,
                                        headerParams = headerParams,
                                        body = body,
                                        httr::progress(),
                                        httr::write_disk(filename, overwrite=overwrite),
                                        ...)

      if (httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299) {
        normalizePath(filename)
      }
      else {
        private$formatResponse(resp, args)
      }
    },
    readStream = function(path, systemId, callback, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if (missing(callback)) {
        stop("No callback function provided. Please provide a callback function to receive the byte stream from the downloaded file")
      }
      # else if (!is.function(callback)) {
      #   stop("Callback is not a function. Please provide a callback function to receive the byte stream from the downloaded file")
      # }

      if (missing(filename)) {
        filename <- basename(path)
      }

      if (missing(systemId)) {
        urlPath <- "/files/v2/media/{filePath}"
      }
      else {
        urlPath <- "/files/v2/media/system/{systemId}/{filePath}"
        urlPath <- gsub(paste0("\\{", "systemId", "\\}"), `systemId`, urlPath)
      }

      if (!missing(`path`)) {
        urlPath <- gsub(paste0("\\{", "filePath", "\\}"), `path`, urlPath)
      }

      resp <- private$apiClient$callApi(url = paste0(private$apiClient$basePath, urlPath),
                                        method = "GET",
                                        queryParams = queryParams,
                                        headerParams = headerParams,
                                        body = body,
                                        httr::write_stream(callback),
                                        ...)

      if ( httr::status_code(resp) >= 200 && httr::status_code(resp) <= 299 ) {
        resp
      }
      else {
        private$formatResponse(resp, args)
      }
    },
    transfer = function(path, systemId, source, body, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if ("filter" %in% names(args)) {
        queryParams['filter'] <- args$filter
      }

      body <- list()

      if (missing(source)) {
        stop("No source URL provided. Please provide a valid source as a path on your default storage system, Agave URL, or publicly accessible URL")
      }
      else {
        body['fileToImport'] <- source
      }

      if (missing(systemId)) {
        urlPath <- "/files/v2/media/{filePath}"
      }
      else {
        urlPath <- "/files/v2/media/system/{systemId}/{filePath}"
        urlPath <- gsub(paste0("\\{", "systemId", "\\}"), `systemId`, urlPath)
      }

      if (!missing(`path`)) {
        urlPath <- gsub(paste0("\\{", "filePath", "\\}"), `path`, urlPath)
      }

      resp <- private$apiClient$callApi(url = paste0(private$apiClient$basePath, urlPath),
                                        method = "POST",
                                        queryParams = queryParams,
                                        headerParams = headerParams,
                                        body = body,
                                        ...)

      private$formatResponse(resp, args)
    },
    upload = function(path, systemId, filename, body, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if ("filter" %in% names(args)) {
        queryParams['filter'] <- args$filter
      }

      # validate the filename entry
      if (missing(filename)) {
        stop("No filename provided. Path to local file to upload is required")
      }
      else if (is.null(filename) || nchar(filename) == 0) {
        stop("Invalid filename provided. Path to local file to upload is required")
      }
      else if (!file.exists(filename)) {
        stop(paste0(c("No local file found at ", filename)))
      }

      if (!missing(`body`)) {
        if (!is.list(body)) {
          body$fileToUpload <- httr::upload_file(filename)
          body <- `body`$toJSONString()
        }
        else {
          body <- modifyList(list(fileToUpload = httr::upload_file(filename)), body)
        }
      } else {
        body <- list(fileToUpload = httr::upload_file(filename))
      }

      if (missing(systemId) || is.null(systemId)) {
        urlPath <- "/files/v2/media/{filePath}"
      }
      else {
        urlPath <- "/files/v2/media/system/{systemId}/{filePath}"
        urlPath <- gsub(paste0("\\{", "systemId", "\\}"), `systemId`, urlPath)
      }

      if (!missing(`path`)) {
        urlPath <- gsub(paste0("\\{", "filePath", "\\}"), `path`, urlPath)
      }

      resp <- private$apiClient$callApi(url = paste0(private$apiClient$basePath, urlPath),
                                        method = "POST",
                                        queryParams = queryParams,
                                        headerParams = headerParams,
                                        body = body,
                                        httr::progress(),
                                        ...)

      private$formatResponse(resp, args)
    },
    manage = function(path, systemId, body, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if ("limit" %in% names(args)) {
        queryParams['limit'] <- args$limit
      }

      if ("offset" %in% names(args)) {
        queryParams['offset'] <- args$offset
      }

      if ("filter" %in% names(args)) {
        queryParams['filter'] <- args$filter
      }

      if (!missing(`body`)) {
        if (!is.list(body)) {
          body <- `body`$toJSONString()
        }
      } else {
        body <- NULL
      }

      if (missing(`systemId`)) {
        urlPath <- "/files/v2/media/{filePath}"
      }
      else {
        urlPath <- "/files/v2/media/system/{systemId}/{filePath}"
        urlPath <- gsub(paste0("\\{", "systemId", "\\}"), `systemId`, urlPath)
      }

      if (!missing(`path`)) {
        urlPath <- gsub(paste0("\\{", "filePath", "\\}"), `path`, urlPath)
      }

      resp <- private$apiClient$callApi(url = paste0(private$apiClient$basePath, urlPath),
                                        method = "PUT",
                                        queryParams = queryParams,
                                        headerParams = headerParams,
                                        body = body,
                                        ...)

      private$formatResponse(resp, args)
    },
    listHistory = function(path, systemId, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if ("limit" %in% names(args)) {
        queryParams['limit'] <- args$limit
      }

      if ("offset" %in% names(args)) {
        queryParams['offset'] <- args$offset
      }

      if ("filter" %in% names(args)) {
        queryParams['filter'] <- args$filter
      }

      if (missing(`systemId`)) {
        urlPath <- "/files/v2/history/{filePath}"
      }
      else {
        urlPath <- "/files/v2/history/system/{systemId}/{filePath}"
        urlPath <- gsub(paste0("\\{", "systemId", "\\}"), `systemId`, urlPath)
      }

      if (!missing(`path`)) {
        urlPath <- gsub(paste0("\\{", "filePath", "\\}"), `path`, urlPath)
      }

      resp <- private$apiClient$callApi(url = paste0(private$apiClient$basePath, urlPath),
                                        method = "GET",
                                        queryParams = queryParams,
                                        headerParams = headerParams,
                                        body = body,
                                        ...)

      private$formatResponse(resp, args)
    },
    listPermissions = function(path, systemId){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if ("limit" %in% names(args)) {
        queryParams['limit'] <- args$limit
      }

      if ("offset" %in% names(args)) {
        queryParams['offset'] <- args$offset
      }

      if ("filter" %in% names(args)) {
        queryParams['filter'] <- args$filter
      }

      if (!missing(`limit`)) {
        queryParams['limit'] <- limit
      }

      if (!missing(`offset`)) {
        queryParams['offset'] <- offset
      }

      if (missing(`systemId`)) {
        urlPath <- "/files/v2/pems/{filePath}"
      }
      else {
        urlPath <- "/files/v2/pems/system/{systemId}/{filePath}"
        urlPath <- gsub(paste0("\\{", "systemId", "\\}"), `systemId`, urlPath)
      }

      if (!missing(`path`)) {
        urlPath <- gsub(paste0("\\{", "filePath", "\\}"), `path`, urlPath)
      }

      resp <- private$apiClient$callApi(url = paste0(private$apiClient$basePath, urlPath),
                                        method = "GET",
                                        queryParams = queryParams,
                                        headerParams = headerParams,
                                        body = body,
                                        ...)

      private$formatResponse(resp, args)
    },
    list = function(path, systemId, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if ("limit" %in% names(args)) {
        queryParams['limit'] <- args$limit
      }

      if ("offset" %in% names(args)) {
        queryParams['offset'] <- args$offset
      }

      if ("filter" %in% names(args)) {
        queryParams['filter'] <- args$filter
      }

      if (missing(`systemId`)) {
        urlPath <- "/files/v2/listings/{filePath}"
      }
      else {
        urlPath <- "/files/v2/listings/{systemId}/{filePath}"
        urlPath <- gsub(paste0("\\{", "systemId", "\\}"), `systemId`, urlPath)
      }

      if (!missing(`path`)) {
        urlPath <- gsub(paste0("\\{", "filePath", "\\}"), `path`, urlPath)
      }

      resp <- private$apiClient$callApi(url = paste0(private$apiClient$basePath, urlPath),
                                        method = "GET",
                                        queryParams = queryParams,
                                        headerParams = headerParams,
                                        body = body,
                                        ...)

      private$formatResponse(resp, args)
    },
    clearPermissions = function(path, systemId...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()

      if ("filter" %in% names(args)) {
        queryParams['filter'] <- args$filter
      }

      if (missing(`systemId`)) {
        urlPath <- "/files/v2/pems/{filePath}"
      }
      else {
        urlPath <- "/files/v2/pems/system/{systemId}/{filePath}"
        urlPath <- gsub(paste0("\\{", "systemId", "\\}"), `systemId`, urlPath)
      }

      if (!missing(`path`)) {
        urlPath <- gsub(paste0("\\{", "filePath", "\\}"), `path`, urlPath)
      }

      resp <- private$apiClient$callApi(url = paste0(private$apiClient$basePath, urlPath),
                                        method = "DELETE",
                                        queryParams = queryParams,
                                        headerParams = headerParams,
                                        body = body,
                                        ...)

      private$formatResponse(resp, args)
    },
    updatePermissions = function(path, systemId, username, permission = "NONE", recursive=FALSE, ...){
      args <- list(...)
      queryParams <- list()
      headerParams <- character()
      body <- list()

      if ("limit" %in% names(args)) {
        queryParams['limit'] <- args$limit
      }

      if ("offset" %in% names(args)) {
        queryParams['offset'] <- args$offset
      }

      if ("filter" %in% names(args)) {
        queryParams['filter'] <- args$filter
      }

      if (missing(`username`)) {
        stop("Username is required")
      } else {
        body['username'] <- username
      }

      if (missing(`permission`)) {
        body['pemission'] <- "NONE"
      } else {
        body['pemission'] <- permission
      }

      if (!missing(`recursive`)) {
        body['recursive'] <- "false"
      } else {
        body['recursive'] <- ifelse(isTRUE(recursive), "true", "false")
      }

      if (missing(`systemId`)) {
        urlPath <- "/files/v2/pems/{filePath}"
      }
      else {
        urlPath <- "/files/v2/pems/system/{systemId}/{filePath}"
        urlPath <- gsub(paste0("\\{", "systemId", "\\}"), `systemId`, urlPath)
      }

      if (!missing(`path`)) {
        urlPath <- gsub(paste0("\\{", "filePath", "\\}"), `path`, urlPath)
      }

      resp <- private$apiClient$callApi(url = paste0(private$apiClient$basePath, urlPath),
                                        method = "POST",
                                        queryParams = queryParams,
                                        headerParams = headerParams,
                                        body = body,
                                        ...)

      private$formatResponse(resp, args)
    }
  )
)
