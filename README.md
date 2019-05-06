# cegma-docker
Docker image to run CEGMA in Ubuntu 14.04

The image contains a full install of [CEGMA](https://github.com/KorfLab/CEGMA_v2), including all necessary dependencies. I am not part of the developer team - I just made this image.

In detail, the image is set up with:
 - Ubuntu 14.04
 - genewise 2.4.1
 - geneid 1.4.4 
 - ncbi-blast+ 2.2.28+
 - CEGMA 2.5

To run CEGMA you can do the following (this will mount the directory `/in` of the container to the current working directory on your local machine, and allow you to access files in this directory and any sub-directories):
```bash
$ docker run --rm -v $(pwd):/in -w /in chrishah/cegma:2.5 cegma -h
```

You can also enter the container environment and work within it. All executables should be in the `PATH`.
```bash
$ docker run -it --rm -v $(pwd):/in -w /in chrishah/cegma:2.5 /bin/bash
```
