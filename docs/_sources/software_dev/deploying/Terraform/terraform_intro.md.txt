# Terraform basics

## What is Terraform?

Terraform takes as input configuration files containing the declaration of the resources to provide, then queries the world to learn what the current state is and finally issues the command required to change the current state of the world into the desired one. 
As the configuration changes, Terraform is able to determine what changed and create incremental execution plans which can be applied.

It features a full templating system with variables, tracks dependencies between resources and provision them in parallel while still respecting the dependency-graph.

There are multiple use cases for Terraform, here we focus on the **deployment of a Kubernetes cluster on GKE**, which comes from my team's experience using Terraform at Virtual Traffic Lights LLC.

## Terraform repo structure

If we choose to have a seperate repo hosting all Terraform config then the following architechture could be adopted:

```
src/
   resources/           The non-code resources like GCP credentials
   terraform/           Contains all Terraform code
      modules/          Terraform modules to be easily reused across multiple roots
      roots/            Terraform root modules
```

