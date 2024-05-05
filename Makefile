CONTAINER_NAME ?= antora
PORT ?= 8500

default: run

run:
	@podman kill antora || echo not running
	podman run --rm --detach --name "${CONTAINER_NAME}" \
		--volume "${PWD}:/antora" \
	   	--publish "${PORT}:8080" \
		--replace \
	   	ghcr.io/juliaaano/antora-viewer

stop:
	podman kill "${CONTAINER_NAME}"
