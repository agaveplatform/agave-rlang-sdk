FROM rocker/rstudio:3.4.3

MAINTAINER Rion Dooley <deardooley@gmail.com>

USER root

# Install Agave Platform SDKs
RUN apt-get update && \
    apt-get install -y libssh2-1-dev zlib1g-dev && \
    Rscript -e 'if(!require(devtools)) { install.packages("devtools") }' -e 'library(devtools)' -e 'if(!require(rAgave)) { install_github("agaveplatform/r-sdk") }'

RUN echo '\n\
    \n# Add in devtools and rAgave SDK to the default environment \
    \nlibrary(devtools) \
    \nlibrary(rAgave) \
    \n' >> /usr/local/lib/R/etc/Rprofile.site

RUN apt-get install -y python-pip python3-pip && \
    pip install agavepy
    
ADD examples /home/rstudio/examples

RUN chown -R 755 /home/rstudio/examples

LABEL org.agaveplatform.devops.architecture="x86_64"                                \
      org.agaveplatform.devops.build-date="$BUILD_DATE"                             \
      org.agaveplatform.devops.license="BSD 3-clause"                               \
      org.agaveplatform.devops.name="agaveplatform/rstudio"                         \
      org.agaveplatform.devops.summary="RStudio datascience server with Agave CLI, Python & R SDK" \
      org.agaveplatform.devops.version="$VERSION"                                   \
      org.agaveplatform.devops.vcs-type="git"                                       \
      org.agaveplatform.devops.vcs-url="https://github.com/agaveplatform/rstudio"   \
      org.agaveplatform.devops.rstudio.version="3.4.2"                              \
      org.agaveplatform.devops.environment="training"                               \
      org.agaveplatform.training="rstudio"
