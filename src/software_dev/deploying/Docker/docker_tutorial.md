# Docker Tutorial

## Outline

1. Docker concepts
2. Setup of Docker environment
3. Define a container with Dockerfile
4. Build and test your image
5. Run your image as a container

## Docker concepts

Docker is a platform for developers to build, run, and share applications with containers. The use of containers to deploy applications is called **containerization**. 

1. Docker container:
    > Fundamentally, a container is nothing but a running process, with some added encapsulation features applied to it in order to keep it isolated from the host and from other containers. It is a runtime instance of a docker image. 

2. Docker image:
    > One of the most important aspects of container isolation is that each container interacts with its own private filesystem; this filesystem is provided by a Docker image. **An image includes everything needed to run an application** - the code or binary, runtimes, dependencies, and any other filesystem objects required: you need to create an image that contains just what your application needs to run. Containers, which are instances of the image, share the resources defined by this image (since this is read-only access there are no concurrency issues).

3. Docker Hub:
    - Enable sharing and collaboration of Docker Images
    - Private and public repositories of images
    - To push an image to docker hyb:
        - First ``docker login -u myusername`` to connect to docker hub
        - Then ``docker tag local-image:tagname myusername/new-repo:tagname``, if tagname is not specified ( ``docker tag local-image new-repo``) the default tag is latest.
        - Finally ``docker push new-repo:tagname``

## Containers vs virtual machines 

- A container runs natively on Linux and shares the kernel of the host machine with other containers. It runs a discrete process, taking no more memory than any other executable, making it **lightweight**.
- By contrast, a virtual machine (VM) runs a full-blown “guest” **operating system** with virtual access to host resources through a hypervisor.
- Docker key advantages over VMs:
    - Better resources utilization: CPU, RAM
    - Faster to start and stop applications (seconds)
- For ex: Containerization with Docker vs Virtualization with VMWare.

## Setup of Docker environment

Procedure to Check your installation:

- Check docker version
    > docker --version
- Test Docker installation, list all images and all containers, stop and remove a container:
    > docker run hello-world

    > docker image ls
    
    > docker ps -a

    > docker run <image_id>

    > docker stop <container_id>

    > docker rm <container_id>


## Development workflow of a containerized application

In general, the development workflow looks like this:

- Create and test individual containers for each component of your application by first creating Docker images.
- Assemble your containers and supporting infrastructure into a complete application.
- Test, share, and deploy your complete containerized application.

Here we focus on step 1 of this workflow: creating the images that your containers will be based on.

### Define an image for your container with Dockerfile - Build and test your image

The following link contains a nice and easy example of writing a DockerFile, please check it out:
https://docs.docker.com/get-started/part2/#define-a-container-with-dockerfile

### Persist our DB - Multi-container applications (skipped)

We will skip these two part (part 5 and 7 of the guetting started tutorial in the official docker doc) because in Kubernetes, there is:
- A way to persist data 
- A way to link containers between them 

### Docker Compose

TODO