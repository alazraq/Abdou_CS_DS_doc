# Kubernetes Basics tutorial 


## What is Kubernetes

Kubernetes (abbreviated k8s) is a **cluster orchestration** platform for automating deployment, scaling, and operations of application containers across clusters of hosts. It was initially designed by Google and now maintained by the Cloud Native Computing Foundation.
- Kubernetes coordinates a highly available cluster of computers that are connected to work as a single unit.
- The goal is to be able to deploy **containerized** applications to a cluster without tying them specifically to individual machines.
- Kubernetes automates **the distribution, scaling and scheduling** of application containers across a cluster in a more efficient way.

## Goals of this tutorial

Learn to:
- Deploy a containerized application on a cluster.
- Scale the deployment.
- Update the containerized application with a new software version.
- Debug the containerized application.

## Create a Kubernetes cluster

### Kubernetes Clusters (and pods)

A Kubernetes cluster consists of two types of resources:

- The **Master** coordinates the cluster, it is composed of:
    - **API Server:** The API server is a component of the Kubernetes control plane that exposes the Kubernetes API.
    - **Controller:** which is also made of several components:
        - Node controller: Responsible for noticing and responding when nodes go down.
        - Replication controller: Responsible for maintaining the correct number of pods for every replication controller object in the system.
        - Endpoints controller: Populates the Endpoints object (that is, joins Services & Pods).
        - Service Account & Token controllers: Create default accounts and API access tokens for new namespaces
    - **Scheduler:** Control component that watches for newly created Pods with no assigned node, and selects a node for them to run on.
    - **ETCD:** Consistent and highly-available key value store used as Kubernetes' backing store for all cluster data.

- **Nodes** are VMs or physical computers that serve as a worker machines in a Kubernetes cluster. A Kubernetes cluster that handles production traffic should have a minimum of three nodes. Each node should have:
    - a **Kubelet**, which is an agent for managing the node and communicating with the Kubernetes master. 
    - a tool for handling container operations, such as **Docker or rkt**. (PS: rkt is containerization software by CoreOS deigned to be more secure than and in competition with Docker)

When you deploy applications on Kubernetes, you tell the master to start the application containers. The master schedules the containers to run on the cluster's nodes.

A **Kubernetes pod** is a group of containers that are deployed together on the same host with shared storage/network, and a specification for how to run the containers. 

    - 1 Pod runs on a single Node of the cluster (but a Node can host multiple Pods), and the containerized apps inside the same pod have a shared ip address and access the same storage volumes.
    - A pod is the smallest unit of deployment in k8s, if you want to deploy a container then a pod is created for this deployment.

### Minikube

Minikube is a lightweight Kubernetes implementation that creates a VM on your local machine and deploys a simple cluster containing only one node. 

Minikube is available for Linux, macOS, and Windows systems. 

The Minikube CLI provides basic operations for working with your cluster, including start, stop, status, and delete.

Commands:
```
# To check the version of minikube
minikube version  
# Start the local Kubernetes cluster with 1 node (running is a VM created by Minikube)
minikube start
```

## Deploy an app

### Kubernetes Deployments

Once you have a running Kubernetes cluster, you can deploy your containerized applications on top of it. To do so, you create a **Kubernetes Deployment configuration**. The Deployment instructs Kubernetes how to create and update instances of your application. 

Once you've created a Deployment, the Kubernetes master schedules the application instances included in that Deployment to run on individual Node in the cluster, with a self-healing mechanism to address machine failure or maintenance.

When you create a Deployment, you'll need to specify the container image for your application and the number of replicas that you want to run. You can change that information later by updating your Deployment.


### Command line interface kubectl

We use kubectl to interact with Kubernetes from the command line. Kubectl uses the Kubernetes API to interact with the cluster.

The common format of a kubectl command is: kubectl action resource. This performs the specified action (like create, describe) on the specified resource (like node, container).


The most common operations can be done with the following kubectl commands:

- kubectl get - list resources
- kubectl describe - show detailed information about a resource
- kubectl logs - print the logs from a container in a pod
- kubectl exec - execute a command on a container in a pod

Some useful commands:

```
# To check the version of kubectl
kubectl version
# View the cluster details
kubectl cluster-info
# Show all nodes that can be used to host our applications
kubectl get nodes
```


### Deploying the app with kubectl

```
# Deploy app (from gcr -google cloud registry- like this, include the full repository url for images hosted outside Docker hub)
kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1
# List your deployments
kubectl get deployments
```

The create deployment command does the following:

- search for a suitable node where an instance of the application could be run (we have only 1 available node)
- schedule the application to run on that Node
- configure the cluster to reschedule the instance on a new Node when needed

## Explore your app: Viewing Pods and Nodes

### Kubernetes Pods

A Pod is a Kubernetes abstraction that represents a group of one or more application containers, and some shared resources for those containers. Those resources include:

- Shared storage, as Volumes
- Networking, as a unique cluster IP address
- Information about how to run each container, such as the container image version or specific ports to use

Pods are the **atomic unit** on the Kubernetes platform. When we create a Deployment on Kubernetes, that Deployment creates Pods with containers inside them (as opposed to creating containers directly). Each Pod is tied to the Node where it is scheduled (a Pod runs on a single node), and remains there until termination (according to restart policy) or deletion. In case of a Node failure, identical Pods are scheduled on other available Nodes in the cluster.

**Important remark**: Containers should only be scheduled together in a single Pod if they are tightly coupled and need to share resources such as disk.

### Nodes

A Pod always runs on a Node. A Node is a **worker machine** in Kubernetes and may be either a virtual or a physical machine, depending on the cluster. Each Node is managed by the Master. A Node can have multiple pods, and the Kubernetes master automatically handles scheduling the pods across the Nodes in the cluster based on their available resources. 

Each Node should run at least two components, Kubelet for communication with the kubernetes master and node management, and Docker (or rkt) to handle containerization.

### Troubleshooting Kubernetes applications using the kubectl get, describe, logs and exec commands.

- Extensive description of the running pods: IP address, the ports used and a list of events related to the lifecycle of the Pod

    Note: the describe command can be used to get detailed information about most of the kubernetes primitives: node, pods, deployments.
    ```
    kubectl describe pods
    ```
- Creating a proxy for the pod: 

    Pods that are running inside Kubernetes are running on a private, isolated network. By default they are visible from other pods and services within the same kubernetes cluster, but not outside that network. When we use kubectl, we're interacting through an API endpoint to communicate with our application.

    More on this on the next section

    The kubectl command can create a proxy that will forward communications into the cluster-wide, private network. The proxy can be terminated by pressing control-C and won't show any output while its running.
    curl http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME/proxy/

    ```
    # Create a proxy for the pod to be accessed from
    kubectl proxy

    # Export pod name 
    export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
    echo Name of the Pod: $POD_NAME

    # Curl request to see the content of the app
    curl http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME/proxy/
    ```

- Retreive container logs: (everything printed to STDOUT)

    Note: We don’t need to specify the container name, because we only have one container inside the pod.

    ```
    kubectl logs $POD_NAME
    ```
- Executing commands inside a container (container name omitted if 1 container inside the pod)

    ```
    # Executing a command inside a container
    kubectl exec $POD_NAME env
    # Or starting a bash session inside the container and running commands
    kubectl exec -ti $POD_NAME bash
    cat server.js
    # Exit the bash session 
    exit
    ```


## Expose your app publicly using a service

### Goals

- Learn about a Service in Kubernetes
- Understand how labels and LabelSelector objects relate to a Service
- Expose an application outside a Kubernetes cluster using a Service

### Overview of Kubernetes Services


## Scale up your app

## Update your app
