# Exercise 3: Local Kubernetes Service

Deploy the provided Go REST application to Minikube and access it at `http://localhost:8080/hello-world`.

## Prerequisites

- [Minikube installed](https://minikube.sigs.k8s.io/docs/start/)
- [Docker installed](https://docs.docker.com/engine/install/)
- On Windows, install WSL and Minikube in the WSL distribution, then enable Docker Desktop's WSL integration so the WSL `docker` CLI can reach its daemon.

## Deploy

This starts Minikube if needed, builds the application image directly into the Minikube cluster, applies the Kubernetes manifests, and forwards the Service to localhost. Keep the script running while using the endpoint; press Ctrl-C to stop port forwarding. The cluster and Deployment remain available.

From Linux or MacOS, run the following script:

```sh
./run.sh deploy
```

From PowerShell on Windows, run:

```powershell
wsl bash ./run.sh deploy
```

Test the endpoint in another terminal:

```sh
curl http://localhost:8080/hello-world
```

Expected response:

```json
{"message":"Hello World!"}
```


## Cleanup

This
From Linux or MacOS, run the following script:

```sh
./run.sh cleanup
```

From PowerShell on Windows, run:

```powershell
wsl bash ./run.sh cleanup
```
