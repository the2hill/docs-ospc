#!/bin/sh
set -e
pwd
# Clean the build dir which is base for all ospc projects..
rm -rf ospc/docs/*

# Build the individual ospc sphinx projects
make html -C ./rs-heat-docs
make html -C ./heat-resource-ref
make html -C ./docs-cloud-backup/api-docs/cloud-backup-v1
make html -C ./docs-core-infra-user-guide
make html -C ./quickstart
make html -C ./docs-cloud-autoscale/api-docs/rst/dev-guide
make html -C ./docs-cloud-queues/api-docs
make html -C ./docs-cloud-images/api-docs
make html -C ./docs-cloud-cdn/api-docs
make html -C ./docs-cloud-block-storage/api-docs
make html -C ./docs-cloud-orchestration/api-docs
make html -C ./docs-cloud-networks/api-docs
make html -C ./docs-cloud-servers/api-docs
make html -C ./docs-cloud-databases/api-docs
make html -C ./docs-cloud-files/api-docs
make html -C ./docs-cloud-load-balancers/api-docs/cloud-load-balancers-v1
make html -C ./docs-cloud-rackconnect/api-docs
make html -C ./support-how-to/content

# Copy the landing page to the build dir
cp index.html ospc/docs

# Copy assets folder to the build dir
cp -r assets ospc/docs
:
