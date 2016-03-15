# FEniCS dev-env with Trilinos image

This image provides a development environment for building the FEniCS
libraries, including Trilinos.  It does not provide an installation of
FEniCS.  It is intended for users who want to build their own version
of FEniCS with Trilinos for testing.

To launch the container:

    docker run -t -i quay.io/fenicsproject/dev-env-trilinos:latest

We do provide a helper script (fenics.conf) in this container to
compile FEniCS automatically:

    update_fenics

If you want to have access to the source code and build files in the
container on the host machine then run:

    docker run -v $(pwd)/build:/home/fenics/build -t -i quay.io/fenicsproject/dev-env-trilinos:latest

If you would like to have another directory on the host shared into the
container then run:

    docker run -v $(pwd)/shared:/home/fenics/shared -t -i quay.io/fenicsproject/dev-env-trilinos:latest