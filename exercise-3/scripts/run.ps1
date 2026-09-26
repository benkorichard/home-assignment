$ErrorActionPreference = "Stop"

foreach ($commandName in @("minikube", "kubectl")) {
    if (-not (Get-Command $commandName -ErrorAction SilentlyContinue)) {
        throw "Required command not found: $commandName"
    }
}

$exerciseDirectory = Split-Path -Parent $PSScriptRoot
Push-Location $exerciseDirectory

try {
    & minikube start
    if ($LASTEXITCODE -ne 0) { throw "minikube start failed" }

    & minikube image build --tag hello-world:local .
    if ($LASTEXITCODE -ne 0) { throw "Minikube image build failed" }

    & kubectl apply -f k8s/hello-world.yaml
    if ($LASTEXITCODE -ne 0) { throw "Kubernetes apply failed" }

    & kubectl rollout status deployment/hello-world --timeout=120s
    if ($LASTEXITCODE -ne 0) { throw "Deployment did not become ready" }

    Write-Host "Serving http://localhost:8080/hello-world; press Ctrl-C to stop port-forwarding."
    & kubectl port-forward --address 127.0.0.1 service/hello-world 8080:8080
    if ($LASTEXITCODE -ne 0) { throw "Kubernetes port-forward failed" }
}
finally {
    Pop-Location
}
