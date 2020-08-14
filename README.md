# Azure Pipelines Docker agent with Python

This image based on Fedora and provide all necessary packages
installed for running as a self-hosted Docker image

# Supported tags and respective `Dockerfile` links

- [0.1]

# Quick reference

- **Supported architectures**: `amd64`, `arm64v8`

# Running the agent

For using that with Azure Pipelines the container should be provided
with some environment variables:

- `AZP_POOL` - name of the Azure Pipelines pool you want to attach you container
- `AZP_URL` - URL of your project where pipelines are located
- `AZP_TOKEN` - token that allows the agent to register themself in a pool
and get access to pipelines
- `AZP_AGENT_NAME` - agent name to be assigned

Template of `.env` file available [here](templates/.env)

# Prerequisites for building manually

- `buildah` package required
- update `Dockerfile`
- update `build/builder.sh` to represent your image naming, etc.
- run `build/builder.sh`

[0.1]: https://github.com/vpetrigo/az-python-agent/releases/tag/0.1
