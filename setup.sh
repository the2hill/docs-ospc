#!/bin/sh
set -e
pwd
# Clean the build dir which is base for all ospc projects..
rm -rf ospc/docs/*

# Build the individual ospc sphinx projects
make html -C ./docs-cloud-files/api-docs
make html -C ./docs-cloud-load-balancers/api-docs/cloud-load-balancers-v1

# Copy the landing page to the build dir
cp index.html ospc/docs
:
