#!/bin/bash
set -e

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
exercise_dir="$(cd -- "$script_dir/.." && pwd)"

for command in minikube kubectl; do
  if ! command -v "$command" >/dev/null 2>&1; then
    printf 'Required command not found: %s\n' "$command" >&2
    exit 1
  fi
done

cd "$exercise_dir"
minikube start
minikube image build --tag hello-world:local .
kubectl apply -f k8s/hello-world.yaml
kubectl rollout status deployment/hello-world --timeout=120s

printf 'Serving http://localhost:8080/hello-world; press Ctrl-C to stop port-forwarding.\n'
kubectl port-forward --address 127.0.0.1 service/hello-world 8080:8080
