# Terraform Modules

A module is a container for multiple resources that are used together and used to describe your infrastructure in terms of its architecture.

There exists two types of Terraform modules: Re-usable modules referred to as modules here, and root modules simply referred to as roots.
A ``root`` is a Terraform config that is meant to be deployed in itself. 
A ``module`` is a Terraform configuration that is meant to be included in a root deployment.

## Terraform conventions for module files

The Terraform best-practices recommends the follwoing conventions for files defined inside each root/module:

``main.tf``

   The main code of the module/root

``variables.tf``

   Module variable definition.

``outputs.tf``

   Module output definition.