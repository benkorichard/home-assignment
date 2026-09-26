# Exercise 3: Local Kubernetes Service

Deploy the provided Go REST application to Minikube and access it at `http://localhost:8080/hello-world`.

## Prerequisites

- The current stable Minikube release, installed using the [official installation guide](https://minikube.sigs.k8s.io/docs/start/), and a supported local container driver installed and running.
- `kubectl` installed and available on `PATH`.
- Internet access for the first image build to download the supplied application archive from GitHub.

Docker is the recommended driver. On Windows, start Docker Desktop with Linux containers enabled before running the PowerShell script. From WSL, configure Docker Desktop's WSL integration and ensure the `docker` CLI can reach its daemon. Package-manager versions may lag behind the current Minikube release; follow the official guide if the installed command does not support the workflow below.

## Run

From this directory, run one of:

```sh
bash ./scripts/run.sh
```

```powershell
./scripts/run.ps1
```

The script starts Minikube if needed, builds the application image directly into the Minikube cluster, applies the Kubernetes manifests, waits for the Deployment, and forwards the Service to localhost. No external container registry is used. Keep the script running while using the endpoint; press Ctrl-C to stop port forwarding. The cluster and Deployment remain available.

Test the endpoint in another terminal:

```sh
curl http://localhost:8080/hello-world
```

Expected response:

```json
{"message":"Hello World!"}
```

The supplied binary returns `{"message":"Hello World!"}` with an exclamation mark, which differs from the example response in the brief.

To stop the local cluster, run `minikube stop`. To remove the Deployment and Service, run `kubectl delete -f k8s/hello-world.yaml`.
