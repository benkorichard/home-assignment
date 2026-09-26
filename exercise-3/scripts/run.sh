#!/bin/bash

APP_SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
APP_BASE_DIR="$(cd -- "${APP_SCRIPT_DIR}/.." && pwd)"
APP_MANIFEST_DIR="${APP_BASE_DIR}/k8s"

check_requirements() {
    for cmd in docker minikube; do
        if ! command -v "${cmd}" >/dev/null 2>&1; then
            printf 'Required command not found: %s\n' "${cmd}" >&2
            exit 1
        fi
    done
}

cleanup() {
    pushd "${APP_BASE_DIR}"

    minikube kubectl -- delete -f "${APP_MANIFEST_DIR}/"
    minikube stop

    popd
}

deploy() {
    pushd "${APP_BASE_DIR}"

    minikube start
    minikube image build --tag hello-world:local .
    minikube kubectl -- apply -f "${APP_MANIFEST_DIR}/"
    minikube kubectl -- rollout status deployment/hello-world --timeout=120s

    printf '\nServing http://localhost:8080/hello-world \nPress Ctrl-C to stop port-forwarding.\n'
    minikube kubectl -- port-forward --address 127.0.0.1 service/hello-world 8080:8080

    popd
}

help() {
    printf 'Usage: %s [deploy|cleanup|help]\n' "${0##*/}"
}

main() {
    check_requirements

    case "${1:-}" in
        deploy)
            deploy
            ;;
        cleanup)
            cleanup
            ;;
        *)
            help
            exit 1
            ;;
    esac
}

main "$@"
