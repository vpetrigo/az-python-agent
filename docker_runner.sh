#!/bin/bash

usage () {
    echo "runner.sh <container tag>"
}

if [[ $# -ne 1 ]]; then
    usage
    exit 1
fi

# Accept the container tag version as the first argument
TAG=$1

docker run -it -d --restart unless-stopped -e AZP_POOL="$AZP_POOL" -e AZP_URL="$AZP_URL" -e AZP_TOKEN="$AZP_TOKEN" -e AZP_AGENT_NAME="$AZP_AGENT_NAME" vpetrigo/az-python-agent:$TAG
