#/bin/bash

export HOME_DIR="." #Current directory

export CUDA_VERSION="10.1"
export OS="ubuntu18.04"
export ARCH="x86_64" #`uname -m`
export IMAGE_NAME=${OS}


# 1. Add fenics base environment which is based on phusion/baseimage:0.11, a ubuntu18.04 optimized for Docker usage
export OS_BASE_IMAGE_TAG="${IMAGE_NAME}:${ARCH}-base"
docker build -t "${OS_BASE_IMAGE_TAG}" "${HOME_DIR}/dockerfiles/base"

# 2. Extend previous image with nvidia/cuda base image which receives ARG=PREV_IMAGE_TAG
export OS_BASE_CUDA_IMAGE_TAG="${OS_BASE_IMAGE_TAG}-cuda-${CUDA_VERSION}"
docker build -t "${OS_BASE_CUDA_IMAGE_TAG}" --build-arg "PREV_IMAGE_TAG=${OS_BASE_IMAGE_TAG}" "${HOME_DIR}/dockerfiles/${CUDA_VERSION}/${OS}-${ARCH}/base"

# 3. Extend previous image with nvidia/cuda runtime image which receives ARG=PREV_IMAGE_TAG
export OS_BASE_CUDA_RUNTIME_IMAGE_TAG="${OS_BASE_CUDA_IMAGE_TAG}-runtime"
docker build -t "${OS_BASE_CUDA_RUNTIME_IMAGE_TAG}" --build-arg "PREV_IMAGE_TAG=${OS_BASE_CUDA_IMAGE_TAG}" "${HOME_DIR}/dockerfiles/${CUDA_VERSION}/${OS}-${ARCH}/runtime"

# 4. Extend previous image with nvidia/cuda devel image which receives ARG=PREV_IMAGE_TAG
export OS_BASE_CUDA_RUNTIME_DEVEL_IMAGE_TAG="${OS_BASE_CUDA_RUNTIME_IMAGE_TAG}-devel"
docker build -t "${OS_BASE_CUDA_RUNTIME_DEVEL_IMAGE_TAG}" --build-arg "PREV_IMAGE_TAG=${OS_BASE_CUDA_RUNTIME_IMAGE_TAG}" "${HOME_DIR}/dockerfiles/${CUDA_VERSION}/${OS}-${ARCH}/devel"

# 5. Extend previous image with PETSc + cuda support using a modified fenics dev-env Dockerfile which receives ARG=PREV_IMAGE_TAG
export OS_BASE_CUDA_RUNTIME_DEVEL_PETSC_IMAGE_TAG=${OS_BASE_CUDA_RUNTIME_DEVEL_IMAGE_TAG}-PETSc
docker build -t "${OS_BASE_CUDA_RUNTIME_DEVEL_PETSC_IMAGE_TAG}" --build-arg "PREV_IMAGE_TAG=${OS_BASE_CUDA_RUNTIME_DEVEL_IMAGE_TAG}" "${HOME_DIR}/dockerfiles/dev-env"

# 6. Extend previous image with fenics using a modified fenics stable Dockerfile which receives ARG=PREV_IMAGE_TAG
export OS_BASE_CUDA_RUNTIME_DEVEL_PETSC_FENICS_IMAGE_TAG=${OS_BASE_CUDA_RUNTIME_DEVEL_PETSC_IMAGE_TAG}-fenics
docker build -t "${OS_BASE_CUDA_RUNTIME_DEVEL_PETSC_FENICS_IMAGE_TAG}" --build-arg "PREV_IMAGE_TAG=${OS_BASE_CUDA_RUNTIME_DEVEL_PETSC_IMAGE_TAG}" "${HOME_DIR}/dockerfiles/stable"