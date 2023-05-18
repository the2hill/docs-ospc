# SDK Quickstart guides and Rackspace developer documentation menu

[![Netlify Status](https://api.netlify.com/api/v1/badges/08e519ae-d7f2-4a0e-a589-d5481b22563c/deploy-status)](https://app.netlify.com/sites/docs-quickstart/deploys)

This repository contains the source files that generate the following
Rackspace developer documentation:

* [SDK Quickstart guides](https://developer.rackspace.com/docs/#sdks)

* [Rackspace developer documentation menu](https://developer.rackspace.com/docs/)

When you commit changes to the master branch of this repository, the

[Strider CI/CD build job](https://build.developer.rackspace.com/rackerlabs/docs-quickstart/)
builds the documentation. Successful builds are deployed to production.

**Note:**
   For information about handling build failures, see the section about submitting changes in the
   [contributor guidelines](CONTRIBUTING.md).

## Local Setup

`npm i -g netlify-cli`
`netlify init`
`netlify build`
`netlify dev`
`netlify deploy`

### Support and feedback

We welcome feedback, comments, and bug reports. Follow the
[contributor guidelines](CONTRIBUTING.md)
to propose a source file change, or [submit a GitHub issue](https://github.com/rackerlabs/docs-quickstart/issues/new)
to request an update or to provide feedback.

You can also contact the [Rackspace Information Development team](mailto:infodev@rackspace.com:) directly for general issues
or questions about the content.
