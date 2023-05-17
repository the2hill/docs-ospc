# Rackspace Cloud Networks API documentation

[![Netlify Status](https://api.netlify.com/api/v1/badges/5c121c98-c498-43e1-9bd5-ec93d9282a7b/deploy-status)](https://app.netlify.com/sites/docs-cloud-networks/deploys)

This repository contains the source files that generate the following Cloud Servers API
documentation:

* |Getting Started Guide| [getting-started.rst](https://github.com/rackerlabs/docs-cloud-networks/blob/master/api-docs/getting-started.rst)
* |Developer Guide|[developer-guide.rst](https://github.com/rackerlabs/docs-cloud-networks/blob/master/api-docs/developer-guide.rst)
* |API Reference|[api-reference.rst](https://github.com/rackerlabs/docs-cloud-networks/blob/master/api-docs/api-reference.rst)

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
to propose a source file change, or [submit a GitHub issue](https://github.com/rackerlabs/docs-cloud-networks/issues/new)
to request an update or to provide feedback.

You can also contact the [Rackspace documentation team](mailto:devdoc@rackspace.com)
directly for general issues or questions about the content.
