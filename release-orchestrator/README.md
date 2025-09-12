# Release Orchestrator

This repo manages **release orchestration** for 30 microservices.

## Responsibilities
- GitHub Actions workflow with checkboxes for each microservice
- Release manifests (list of impacted services and versions)
- Automation to update GitOps repo (`argo-githubactions-appset`)

## Repo Structure
```
.github/workflows/release.yml   # GitHub Actions workflow
releases/                       # Release manifests
```

## Flow
1. Developer commits code to microservice repo → builds Docker image with tag.
2. Release manager triggers workflow here → selects impacted services + version + target environment.
3. Workflow updates GitOps repo manifests (`argo-githubactions-appset`).
4. ArgoCD syncs changes to Kubernetes cluster automatically.
```
