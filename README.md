# Admiral

## What it is

A Kubernetes/OpenShift Multi-Cluster Workload Management System

## How it works

- First you deploy ArgoCD
- Then you configure projects and repos pointing here
- Then you have it pull a manifest list for the named cluster
- That manifest list is run through an app-of-apps app generator
- The app generator loads up apps into their respective ArgoCD Projects
- Apps deploy their manifests (kustomizations or helm charts) into the cluster

## What about secrets?

- They don't live here.
