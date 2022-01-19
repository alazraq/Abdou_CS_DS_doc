# More advanced K8s concepts

## Secrets

### Complete doc

A complete reference for K8s secrets can be found [here](https://kubernetes.io/docs/concepts/configuration/secret/).

### What are secrets?

A Secret is an object that contains a small amount of sensitive data such as a password, a token, or a key.
Kubernetes Secrets let you store and manage this **sensitive information** in a **safer** and more flexible manner, rather than putting it directly in a Pod definition or in a container image.

## Persistent Volumes

- A **PersistentVolume (PV)** is a piece of storage in the cluster that has been provisioned by an administrator or dynamically provisioned using Storage Classes. It is a resource in the cluster just like a node is a cluster resource. PVs are volume plugins like Volumes, but have a lifecycle independent of any individual Pod that uses the PV. 
- A **PersistentVolumeClaim (PVC)** is a request for storage by a user. It is similar to a Pod. Pods consume node resources and PVCs consume PV resources. Pods can request specific levels of resources (CPU and Memory). Claims can request specific size and access modes (e.g., they can be mounted ReadWriteOnce, ReadOnlyMany or ReadWriteMany, see AccessModes).





