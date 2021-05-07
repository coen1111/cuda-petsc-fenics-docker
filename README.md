# NVIDIA CUDA powered Docker, PETSc for FEniCS

This repository contains the scripts for building a CUDA powered Docker image for [FEniCS](http://fenicsproject.org). This is done by using the original Docker files of the fenicsproject, which can be found at [fenics-project/docker](https://bitbucket.org/fenics-project/docker/) and expand these with the [NVIDIA CUDA Docker Images](https://gitlab.com/nvidia/container-images/cuda).


## Requirements on host PC
1. Nvidia GPU with CUDA support
2. [Docker](https://docs.docker.com/engine/install/)
3. [NVIDIA CUDA driver](https://github.com/NVIDIA/nvidia-docker/wiki/Frequently-Asked-Questions#how-do-i-install-the-nvidia-driver)
4. [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#setting-up-nvidia-container-toolkit)

![Implementation of CUDA in Docker containers, image from NVIDIA](https://cloud.githubusercontent.com/assets/3028125/12213714/5b208976-b632-11e5-8406-38d379ec46aa.png)

## Notes
1. Currently only tested on host pc with Ubuntu 20.04 x64_86

## Implementation
1. The [fenics-project/docker base](https://bitbucket.org/fenics-project/docker/src/master/dockerfiles/base/) image is build. This is an image based on Ubuntu 18.04 x86-64.
2. The previous image is expanded with an adjusted version of the [CUDA 10.1 base image for Ubuntu 18.04 x86_64](https://gitlab.com/nvidia/container-images/cuda/-/blob/master/dist/10.1/ubuntu18.04-x86_64/base/Dockerfile)
3. The previous image is expanded with an adjusted version of the [CUDA 10.1 runtime image for Ubuntu 18.04 x86_64](https://gitlab.com/nvidia/container-images/cuda/-/blob/master/dist/10.1/ubuntu18.04-x86_64/runtime/Dockerfile)
4. The previous image is expanded with an adjusted version of the [CUDA 10.1 devel image for Ubuntu 18.04 x86_64](https://gitlab.com/nvidia/container-images/cuda/-/blob/master/dist/10.1/ubuntu18.04-x86_64/devel/Dockerfile)
5. The previous image is expanded with an adjusted version of the [fenics-project/docker dev-env](https://bitbucket.org/fenics-project/docker/src/master/dockerfiles/dev-env/) image, which builds PETSc with CUDA support.
6. The previous image is expanded with an adjusted version of the [fenics-project/docker stable](https://bitbucket.org/fenics-project/docker/src/master/dockerfiles/stable/) image, which builds fenics.

## Propoperties of Docker image
* Ubuntu 18.04 x64_86
* CUDA 10.1
* PETSc X.XX with CUDA support
* SLEPc Y.YY with CUDA support
* fenics 2019
    
## Authors

* Jack S. Hale (<jack.hale@uni.lu>)
* Lizao Li (<lzlarryli@gmail.com>)
* Garth N. Wells (<gnw20@cam.ac.uk>)
* NVIDIA CORPORATION (<cudatools@nvidia.com>)
* Coen Bakker
