# ArgoCD Application Generator Helm Chart

## Usage

We feed the `applications.yaml` file from a cluster folder.

The Application Generator chart will iterate over apps and deploy AppProjects and Applications manifests.

Strongly coupled groups of Applications should all be bundled into a Project, and that Project should create a single Management Namespace that will hold all the ArgoCD Applications and any required Secrets to be created/injected for the successful deployment of actual workloads.

## Model

```mermaid
flowchart LR
  subgraph ARGOCD
  subgraph cluster-select
    kind-nibbler
    ocp-plaid
  end

  subgraph folder-mapping
    apps[Applications.yaml]
  end


    bootstrap


  bootstrap-->kind-nibbler-->apps

  subgraph generator ["Argo Generators"]
    iterator
    appproj1["Project 1"]
    appproj2["Project 2"]
    appproj3["Project 3"]
  end

  apps-->iterator

  end

  subgraph managementNS ["Management Namespaces"]
    subgraph projNS1 ["Project Namespace 1"]

      app1a
      app1b
      app1c

      appproj1-->app1a
      appproj1-->app1b
      appproj1-->app1c
    end
    subgraph projNS2 ["Project Namespace 2"]

      app2a
      app2b
      app2c

      appproj2-->app2a
      appproj2-->app2b
      appproj2-->app2c
    end
    subgraph projNS3 ["Project Namespace 3"]

      app3a
      app3b
      app3c

      appproj3-->app3a
      appproj3-->app3b
      appproj3-->app3c
    end
  end

  subgraph charts ["charts folder"]
    appChart1
    appChart2
    appChart3
  end

  subgraph kustomizations ["kustomizations folder"]
    manifest1
    manifest2
    manifest3
  end

  iterator--"Create Management Namespaces"-->managementNS


  iterator--"Create AppProject & Apps"-->appproj1
  iterator--"Create AppProject & Apps"-->appproj2
  iterator--"Create AppProject & Apps"-->appproj3

  app1a-->charts
  app1b-->kustomizations
  app1c-->kustomizations

  app2a-->charts
  app2b-->charts
  app2c-->charts

  app3a-->kustomizations
  app3b-->kustomizations
  app3c-->kustomizations

  workloadCluster((Workloads on Cluster))

  charts-->workloadCluster
  kustomizations-->workloadCluster


```
