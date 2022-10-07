# Download base image with R
FROM rocker/rstudio

# LABEL about the custom image
LABEL version="0.1"
LABEL description="This image intends to install RServer, R and the package sedMicro and all its complicated dependencies"

# Update Ubuntu Software repository
RUN apt-get update

# Install required packages for compiling required dependencies for sdcMicro
RUN apt-get install libcairo2-dev libmagick++-dev libudunits2-dev libharfbuzz-dev libfribidi-dev cargo libgeos-dev r-base-dev libgdal-dev gfortran cmake -y

# Set the default repository to CRAN. rocker/r-ver may have set a past CRAN snapshot as the default repository. This is determined by the options set in the Rprofile
RUN echo 'options(repos = c(CRAN = "https://cloud.r-project.org"))' >>"${R_HOME}/etc/Rprofile.site"

# Install sdcMicro using latest repo version
RUN R -e 'install.packages("sdcMicro")'
