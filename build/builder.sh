#!/bin/bash

declare -A image

for arch in amd64 arm64 ; do
    buildah bud -t vpetrigo/az-python-agent:${VER_TAG}-$arch --override-arch $arch --iidfile iid .
    image[$arch]=$(cat iid)
    rm iid
done

buildah manifest create vpetrigo/az-python-agent:${VER_TAG}

for arch in ${!image[@]} ; do
    flags=
    case $arch in
    arm64|aarch64)
        flags="--arch arm64 --variant v8"
    esac
    buildah manifest add vpetrigo/az-python-agent:${VER_TAG} $flags ${image[$arch]}
done

buildah manifest push --format v2s2 --all vpetrigo/az-python-agent:${VER_TAG} docker://vpetrigo/az-python-agent:${VER_TAG}
