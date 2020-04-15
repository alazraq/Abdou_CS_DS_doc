# Docker Tutorial:

## Outline
1. Docker concepts
2. Setup of Docker environment
3. Define a container with Dockerfile
4. Build and test your image
5. Run your image as a container

## Docker concepts
Docker is a platform for developers to build, run, and share applications with containers. The use of containers to deploy applications is called **containerization**. 

1. Docker container:
> Fundamentally, a container is nothing but a running process, with some added encapsulation features applied to it in order to keep it isolated from the host and from other containers. 

PS: Containers vs virtual machines: 
- A container runs natively on Linux and shares the kernel of the host machine with other containers. It runs a discrete process, taking no more memory than any other executable, making it **lightweight**.
- By contrast, a virtual machine (VM) runs a full-blown “guest” **operating system** with virtual access to host resources through a hypervisor.

2. Docker image:
> One of the most important aspects of container isolation is that each container interacts with its own private filesystem; this filesystem is provided by a Docker image. **An image includes everything needed to run an applicatio**n - the code or binary, runtimes, dependencies, and any other filesystem objects required: you need to create an image that contains just what your application needs to run.


## Setup of Docker environment

1. Check your installation:
- Check docker version
    > docker --version
- Test Docker installation, list all images and all containers, remove a container:
    > docker run hello-world

    > docker image ls
    
    > docker ps -a

    > docker rm <container_id>




Development workflow of a containerized application:

    In general, the development workflow looks like this:
    - Create and test individual containers for each component of your application by first creating Docker images.
    - Assemble your containers and supporting infrastructure into a complete application.
    - Test, share, and deploy your complete containerized application.

    Here we focus on step 1 of this workflow: creating the images that your containers will be based on.

## Define an image for your container with Dockerfile - Build and test your image
The following link contains a nice and easy example of writing a DockerFile, please check it out:
https://docs.docker.com/get-started/part2/#define-a-container-with-dockerfile
