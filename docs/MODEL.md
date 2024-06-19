# Admiral Usage Model

## Folders

- `base` contains everything used by code
  - `base\argocd`: Used to bootstrap a cluster with an ArgoCD instance with everything neccessary to start AppGeneration.
  - `base\cluster`: One-stop shop of AppGenerator and AppProjectGenerators that define what objects in `feature` are used to install things on a specific cluster.
  - `base\feature`: Generalized YAML Data that can configure an ArgoCD Application and AppProject, uses values from cluster.
  - `base\library`: Helm Charts and Kustomizations used by the feature folder
