#!/bin/bash

set -ex;

org='opencontainers'
proj='runc'

test() {
    local version=$(curl -s https://api.github.com/repos/${org}/${proj}/releases/latest | jq -r ".tag_name")
    local builder="${org}-${proj}-builder"
    local version=${version#v}
    docker build -t ${builder} .
    docker run --rm -v$(pwd):/workspace -e RUNC_VERSION=${version} ${builder}
    docker rmi ${builder}
}

test
