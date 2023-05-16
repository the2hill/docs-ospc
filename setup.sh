#!/bin/sh
set -e
pwd
# Clean the build dir which is base for all ospc projects..
make clean -C ./docs-cloud-files/api-docs
# Build the individual ospc sphinx projects
make clean html -C ./docs-cloud-files/api-docs
make clean html -C ./docs-cloud-load-balancers/api-docs/cloud-load-balancers-v1
# Copy the landing page to the build dir 
cp index.html ospc/docs
:
