# rserver_and_sdcmicro
This docker image intends to install [RServer](https://www.rstudio.com/products/rstudio/#rstudio-server) (Open Source edition), R and the package sdcMicro and all its complicated dependencies. You can also install sdcMicro yourself on Ubuntu but make sure you have the required apt packages first, see the list in Dockerfile: [`apt-get install`](https://github.com/ArtificialTruth/rserver_and_sdcmicro/blob/main/Dockerfile#L12).  
Based on [rocker/rstudio](https://rocker-project.org/images/versioned/rstudio.html)


## How to use this image to run RStudio with sdcMicro
RStudio will be accesible through a browser. Internally, it connects to a local RServer instance.

1. [Install Docker Desktop](https://docs.docker.com/get-docker/)
1. Build docker image by writing: `docker build https://github.com/ArtificialTruth/rserver_and_sdcmicro.git#main`  
It took about ~40 minutes to download Ubuntu, and install all required dependencies on my machine.
1. Run the build Docker image to start a local RServer [with authentification disabled*](https://rocker-project.org/images/versioned/rstudio.html#disable_auth) by writing  
`docker run --rm -ti -e DISABLE_AUTH=true -p 127.0.0.1:8787:8787 ArtificialTruth/rserver_and_sdcmicro`  
1. Open `127.0.0.1:8787` in your browser and write some R code in RStudio. Load library with `require(sdcMicro)`.

***Warning:**
> Use this setting only in a secure environment. Without authentication, anyone who has access to that port can log in the RStudio Server.
> If you are using a container on your local computer, it is recommended that you configure the port publishing as -p 127.0.0.1:8787:8787, as in the example, so that it can only be accessed from the same computer.

**Disclaimer:**
> This image builds on top of the [Rocker Project's Docker images for R](https://rocker-project.org/images/#the-versioned-stack). Use at your own risk. No security audits were made. 
