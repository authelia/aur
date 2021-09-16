#!/usr/bin/env bash
set -u

REPOSITORY="authelia/aurpackager"
TAG="latest"

cat << EOF
steps:
  - label: ":docker: Build and Deploy"
    commands:
      - "docker build --tag ${REPOSITORY}:${TAG} --no-cache=true --pull=true --push ."
    concurrency: 1
    concurrency_group: "aurpackager-deployments"
    agents:
      upload: "fast"

  - wait

  - label: ":docker: Update README.md"
    command: "curl \"https://ci.nerv.com.au/readmesync/update?github_repo=${REPOSITORY}&dockerhub_repo=${REPOSITORY}\""
    agents:
      upload: "fast"
EOF