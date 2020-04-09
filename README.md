<a style="background-color:black;color:white;text-decoration:none;padding:4px 6px;font-family:-apple-system, BlinkMacSystemFont, &quot;San Francisco&quot;, &quot;Helvetica Neue&quot;, Helvetica, Ubuntu, Roboto, Noto, &quot;Segoe UI&quot;, Arial, sans-serif;font-size:12px;font-weight:bold;line-height:1.2;display:inline-block;border-radius:3px" href="https://unsplash.com/@swimr?utm_medium=referral&amp;utm_campaign=photographer-credit&amp;utm_content=creditBadge" target="_blank" rel="noopener noreferrer" title="Download free do whatever you want high-resolution photos from Andrew Bain"><span style="display:inline-block;padding:2px 3px"><svg xmlns="http://www.w3.org/2000/svg" style="height:12px;width:auto;position:relative;vertical-align:middle;top:-2px;fill:white" viewBox="0 0 32 32"><title>unsplash-logo</title><path d="M10 9V0h12v9H10zm12 5h10v18H0V14h10v9h12v-9z"></path></svg></span><span style="display:inline-block;padding:2px 3px">Andrew Bain</span></a>

# Docker images for the GLS Master course
These Docker files and images are used to build the computational environments of the Green Life Sciences Master course. 



## Phylogeny
The `phylogeny/` folder contains the Docker file used to build the image.   

The Docker image contains:
* ncbi-blast 


To use it locally on your machine:
1. Install [docker desktop](https://www.docker.com/products/docker-desktop)
2. Open a Shell window (command-line interface). 
3. Navigate to your working directory where you have the files you want to work on for instance. 
3. Type `docker run --rm -it `

__Explanations:__
The `--rm` removes the container when it has been run. No need to store it into your computer after use.  
The `--it` starts an interactive session (so you enter the shell directly)



## Microbiome
An RStudio server 

## RNA-seq
* 

# References

## Useful links
* Docker run reference: https://docs.docker.com/engine/reference/commandline/run/
* A collection of Docker images for bioinformatics: [https://pegi3s.github.io/dockerfiles/](https://pegi3s.github.io/dockerfiles/)

## Picture credit
Photo by Andrew Bain on Unsplash.