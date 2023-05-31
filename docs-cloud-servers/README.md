# Rackspace Cloud Servers API documentation

[![Netlify Status](https://api.netlify.com/api/v1/badges/6a4423f5-26fa-4efb-9284-01a89efe98db/deploy-status)](https://app.netlify.com/sites/docs-cloud-servers/deploys)

This repository contains the source files that generate the following Cloud Servers API documentation:

* [Quickstart Guide](https://docs-ospc.rackspace.com/cloud-servers/v2/developer-guide/#document-quickstart-guide)
* [Developer Guide](https://docs-ospc.rackspace.com/cloud-servers/v2/developer-guide/#document-developer-guide)
* [API Reference](https://docs-ospc.rackspace.com/cloud-servers/v2/developer-guide/#api-reference)

When you commit changes to the master branch of this repository, the
[Strider CI/CD build job](https://build.developer.rackspace.com/rackerlabs/docs-cloud-servers/)
builds the documentation. Successful builds are deployed to production.

## Local Setup

`npm i -g netlify-cli`
`netlify init`
`netlify build`
`netlify dev`
`netlify deploy`

### Support and feedback

We welcome feedback, comments, and bug reports. Follow the [contributor guidelines](CONTRIBUTING.md)
to propose a source file change, or [submit a GitHub issue](https://github.com/rackerlabs/docs-cloud-servers/issues/new)
to request an update or to provide feedback.

You can also contact the [Rackspace documentation team](mailto:devdoc@rackspace.com) directly for general
issues or questions about the content.
