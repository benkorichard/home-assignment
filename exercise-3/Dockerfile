# syntax=docker/dockerfile:1
FROM alpine:3.22 AS app

ARG TARGETOS
ARG TARGETARCH

RUN apk add --no-cache ca-certificates unzip

RUN set -eux; \
    wget -qO /tmp/rest.zip https://github.com/DawiX/rest-hw-dwnld/raw/1029c8fe3b6b60514596e0ff793aaed28e732b42/rest_1.0.zip; \
    echo "8747ca75c4deea2d4a14c3d217e69b7d430a43bedd734d7eb65b7f3f15564deb  /tmp/rest.zip" | sha256sum -c -; \
    case "$TARGETOS/$TARGETARCH" in \
      linux/amd64) binary=rest_1.0_linux_amd64 ;; \
      linux/arm64) binary=rest_1.0_linux_arm64 ;; \
      *) echo "Unsupported target platform: $TARGETOS/$TARGETARCH" >&2; exit 1 ;; \
    esac; \
    unzip -p /tmp/rest.zip "$binary" > /rest; \
    chmod 0555 /rest

FROM scratch

COPY --from=app /rest /rest

EXPOSE 8080
ENTRYPOINT ["/rest"]
