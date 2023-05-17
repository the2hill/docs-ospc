#!/bin/sh
set -e
pwd
# Clean the build dir which is base for all ospc projects..
rm -rf ospc/docs/*

# Build the individual ospc sphinx projects
make html -C ./docs-cloud-cdn/api-docs/
make html -C ./docs-cloud-block-storage/api-docs/
make html -C ./docs-cloud-orchestration/api-docs/
make html -C ./docs-cloud-networks/api-docs/
make html -C ./docs-cloud-servers/api-docs/
make html -C ./docs-cloud-databases/api-docs
make html -C ./docs-cloud-files/api-docs
make html -C ./docs-cloud-load-balancers/api-docs/cloud-load-balancers-v1
make html -C ./docs-cloud-rackconnect/api-docs

# Copy the landing page to the build dir
cp index.html ospc/docs
:
