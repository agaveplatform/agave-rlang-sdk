# R client SDK for the Agave Platform

Power your digital lab and reduce the time from theory to discovery using the Agave Science-as-a-Service API Platform. Agave provides hosted services that allow researchers to manage data, conduct experiments, and publish and share results from anywhere at any time.

## Overview
The Agave R client SDK is based off the vanilla REST API client code generated by the [swagger-codegen](https://github.com/swagger-api/swagger-codegen) project. Additional scripts were added to ease authentication and authorization, session management, serialization, and improve syntax.

- API version: 2.2.14
- Package version: 1.0.0
- Build package: io.swagger.codegen.languages.RClientCodegen

## Installation
You'll need the `devtools` package in order to build the API.
Make sure you have a proper CRAN repository from which you can download packages.

### Prerequisites
Install the `devtools` package with the following command.
```R
> if(!require(devtools)) { install.packages("devtools") }
> if(!require(devtools)) { install.packages("plyr") }
```
If you would like to rebuild the documentation, you will need to install
roxygen2.  

```R
> if(!require(roxygen2)) { install.packages("roxygen2") }
```  

### Installation from Github
To install the package directly from the master branch in Github  
```R
> library(devtools)
> install_github("agaveplatform/r-sdk")
```

### Installation from source
Make sure you set the working directory to the repository home directory.
Then execute
```R
> library(devtools)
> install(".")
```

## Using rAgave in Docker
========================

This repository includes a `Dockerfile` and a `docker-compose.yml`
file, which allows a zero installation version of `rAgave` in [RStudio](https://www.rstudio.com/).

The only requirement is [Docker](https://docs.docker.com/engine/installation/) and [Docker Compose](https://docs.docker.com/compose/install/). Please consult the official Docker website for installation instructions for your system.

To bring up your development environment, clone this repository and execute `docker-compose` as follows:

```bash
$ git clone https://github.com/agaveplatform/r-sdk.git agave-r-sdk
$ cd agave-r-sdk
$ docker-compose build
$ docker-compose up
```  

Navigate to http://localhost:8787 and access the RStudio server
with username and password _"rstudio"_.  The notebook `R-example.Rmd`
contains a full example of use.


## Quickstart

Import the library into your current session namespace.

```R
> library(rAgave)
```  

Now we can create an ``Agave`` instance pointing to your tenant:


```R
> library(rAgave)
> api = Agave$new(baseUrl="https://public.agaveapi.org",
                  username="myusername",
                  password="mypassword")
```

Once the object is instantiated, interact with it according to the
methods in the API documentation.

For example, create a new client with:

```R
> clientData <- Client$new(clientName="my_client")
> api$clientInfo <- api$clients$create(body=clientData)
> api$store()
```  

You may also pass in a list, if preferred, over the object model  

```R  
> api$clientInfo <- api$clients$create(body=list(clientName="my_client"))
> api$store()
```

Access any endpoint with:

```R
> api$systems$listSystems()
> api$jobs$submitJob(body=Job$new(appId="head-1.0u1"))
```  

Once a client is created, it is used by default to access the API.

To make use of an existing client, pass the client's credentials into the Agave constructor:

```R
> library("rAgave")
> api = Agave$new(baseUrl="https://public.agaveapi.co",
              username="myusername", password="mypassword",
              clientKey="123", clientSecret="abc")
```  

If you do not pass in any client, credential, token, or tenant information in your constructor, the SDK will look for those values in your runtime environment. The following table lists the environment variables corresponding to each constructor argument in the SDK.

| Argument     | Environment Variable                  |
|--------------|---------------------------------------|
| baseUrl      | AGAVE_BASE_URL, AGAVE_TENANT_BASE_URL |
| username     | AGAVE_USERNAME                        |
| password     | AGAVE_PASSWORD                        |
| clientKey    | AGAVE_CLIENT_KEY                      |
| clientSecret | AGAVE_CLIENT_SECRET                   |
| tenant       | AGAVE_TENANT                          |
| cacheDir     | AGAVE_CACHE_DIR                       |
| accessToken  | AGAVE_ACCESS_TOKEN                    |
| refreshToken | AGAVE_REFRESH_TOKEN                   |  


The following code would produce the identical result as the previous example.

```R
> library("rAgave")
> Sys.setenv(AGAVE_BASE_URL = "https://public.agaveapi.co",
+            AGAVE_USERNAME = "myusername",
+            AGAVE_PASSWORD = "mypassword",
+            AGAVE_CLIENT_KEY = "123",
+            AGAVE_CLIENT_SECRET = "abc")
> api = Agave$new()
```
If you do not know the `baseUrl` of your tenant, you can simply provide the tenant code. The following example will initialize instances of the SDK for the Agave Public tenant, Cyverse Tenant, and DesignSafe tenants respectively.

```{R}
> library("rAgave")
> api = Agave$new(tenant="agave.prod")
> api = Agave$new(tenant="iplantc.org")
> api = Agave$new(tenant="designsafe")
```

If you do not know the code or url of your tenant, you can query the Tenants API to find a list of all the available tenants.

```{R}
> library("rAgave")
> api <- Agave$new()
> tenants <- api$tenants$list(responseType="df")
> tenants$code
 [1] agave.prod    araport.org   designsafe    iplantc.org   irec         
 [6] irmacs        sd2e          sgci          tacc.prod     vdjserver.org
> api$tenantInfo <- tenants[[1]]
```

Alternatively, the SDK will attempt to recover the client credentials from a predictable location disk. The default cache directory is `$HOME/.agave`. You can configure the location of the cache directory when instantiating a new `Agave` object:

```R  
> library("rAgave")
> api = Agave$new(cacheDir="/Dropbox/agave/cache")
```  

> The format of the cache file is recognized by all Agave SDK, so you can freely move across multiple SDK without having to reauthenticate each time.

> Your password will never be written to the cache file.

rAgave will automatically update the cache file any time you create or update your client or authenticate. Thus, subsequent instantiations can be streamlined to use the no-arg constructor as rAgave will automatically refresh your access token for you.  

```R
> api = Agave$new()
```  

rAgave leverages the `futile.logger` package to provide a custom logging output similar to log4j. You can enabled logging at runtime by specifying the `logLevel` parameter in the constructor. The following log levels are predefined as constants: TRACE, DEBUG, INFO, WARN, FATAL. The log level is set to FATAL by default.

```R
> api = Agave$new(logLevel = INFO)
```  

You can also change the log level at runtime by upating the `logLevel` attibute of an Agave class instance.  

```R
> api = Agave$new()
> api$logLevel <- TRACE
> profile <- api$profiles$getDetails()
> api$logLevel <- DEBUG
> profile <- api$jobs$listJobs()
> api$logLevel <- FATAL
```  

When enabled, logs will be written to `agave.log` in the currrent directory (`getwd()`). You can specify an alternative location by specifying the `logFilePath` parameter in the constructor.

```R
> api = Agave$new(logFilePath = "/var/log/rAgave.log", logLevel = INFO)
```  

## References  

* [Agave Platform](https://agaveapi.co/)  
* [Official RStudio Docker image](https://hub.docker.com/r/agaveplatform/jupyter-notebook/)  
* [Preconfigured Jupyter Docker image](https://hub.docker.com/r/agaveplatform/jupyter-notebook/)  


## License

The Agave Platform and rAgave are licensed under the [BSD 3-Clause license](LICENSE).
