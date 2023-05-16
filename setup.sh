#!/bin/sh
set -e
pwd
make clean html -C ./docs-cloud-files/api-docs
make clean html -C ./docs-cloud-load-balancers/api-docs/cloud-load-balancers-v1
cp index.html ospc/docs
:
