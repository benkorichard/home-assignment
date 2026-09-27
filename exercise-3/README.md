# Exercise 3: Local Kubernetes Service

Deploy the provided Go REST application to Minikube and access it at `http://localhost:8080/hello-world`.

## Prerequisites

- Minikube installed using the [official installation guide](https://minikube.sigs.k8s.io/docs/start/)
- Container runtime (i.e. Docker)
- Internet access for the first image build to download the supplied application archive from GitHub.
- On Windows, install WSL and Minikube in the WSL distribution, then enable Docker Desktop's WSL integration so the WSL `docker` CLI can reach its daemon. Run the Bash launcher from PowerShell through `wsl`.

## Deploy

From Linux or MacOS, run the following script:

```sh
./run.sh deploy
```

From PowerShell on Windows, run:

```powershell
wsl bash ./run.sh deploy
```

The launcher starts Minikube if needed, builds the application image directly into the Minikube cluster, applies the Kubernetes manifests, waits for the Deployment, and forwards the Service to localhost. Keep the script running while using the endpoint; press Ctrl-C to stop port forwarding. The cluster and Deployment remain available.

Test the endpoint in another terminal:

```sh
curl http://localhost:8080/hello-world
```

Expected response:

```json
{"message":"Hello World!"}
```


## Cleanup

From Linux or MacOS, run the following script:

```sh
./run.sh cleanup
```

From PowerShell on Windows, run:

```powershell
wsl bash ./run.sh cleanup
```
