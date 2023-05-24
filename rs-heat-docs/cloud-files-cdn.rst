=====================================
 Rackspace Cloud Files CDN using Heat
=====================================

Brief summary
=============

A CDN-enabled container is a public container that is served by the Akamai
content delivery network. The files in a CDN-enabled container are publicly
accessible and do not require an authentication token for read access.
However uploading content into a CDN-enabled container is a secure operation
and does require a valid authentication token. (Private containers are not
CDN-enabled and the files in a private container are not publicly accessible.)

You can download the full template for this example from `this repository's
templates directory <https://github.com/rackerlabs/rs-heat-docs/blob/master/templates/cdn.yaml>`_.

Prerequisite(s):
================

You should be familiar with general Heat template authoring and resource usage.

Example Template
================

This is a simple template that will illustrate using the
`Rackspace::Cloud::CloudFilesCDN` resource to enable CDN functionality on a Cloud Files
container.

As always, we start with a basic template outline:

.. code:: yaml

  heat_template_version: 2015-10-15

  description: |
    Test Cloud Files CDN

  resources:

  outputs:

Resources section
-----------------

We only need two simple resources for this template:

.. code:: yaml

  resources:

    container:
      type: OS::Swift::Container
      properties:
        name: { get_param: "OS::stack_name" }

    container_cdn:
      type: Rackspace::Cloud::CloudFilesCDN
      properties:
        container: { get_resource: container }
        ttl: 3600

The ``container`` resource simply creates a new Cloud Files container while the
``container_cdn`` resource activates CDN functionality for that container. The
``container`` property defines the container to enable while the ``ttl`` property tells
the CDN service how long to cache objects.

Outputs section
---------------

We will use the ``outputs`` section to get relevant information from the CDN configuration:

.. code:: yaml

  outputs:

    show:
      value: { get_attr: [ container_cdn, show ] }
      description: |
        Show all attributes of the CDN configuration for the
        container.

    cdn_url:
      value: { get_attr: [ container_cdn, cdn_uri ] }
      description: |
        The URI for downloading the object over HTTP. This URI can be combined
        with any object name within the container to form the publicly
        accessible URI for that object for distribution over a CDN system.

    ssl_url:
      value: { get_attr: [ container_cdn, ssl_uri ] }
      description: The URI for downloading the object over HTTPS, using SSL.

    streaming_url:
      value: { get_attr: [ container_cdn, streaming_uri ] }
      description: |
        The URI for video streaming that uses HTTP Dynamic Streaming from Adobe.

    ios_url:
      value: { get_attr: [ container_cdn, ios_uri ] }
      description: |
        The URI for video streaming that uses HTTP Live Streaming from Apple.


Full example template
---------------------

.. code:: yaml

  heat_template_version: 2015-10-15

  description: |
    Test Cloud Files CDN

  resources:

    container:
      type: OS::Swift::Container
      properties:
        name: { get_param: "OS::stack_name" }

    container_cdn:
      type: Rackspace::Cloud::CloudFilesCDN
      properties:
        container: { get_resource: container }
        ttl: 3600

  outputs:

    show:
      value: { get_attr: [ container_cdn, show ] }
      description: |
        Show all attributes of the CDN configuration for the
        container.

    cdn_url:
      value: { get_attr: [ container_cdn, cdn_uri ] }
      description: |
        The URI for downloading the object over HTTP. This URI can be combined
        with any object name within the container to form the publicly
        accessible URI for that object for distribution over a CDN system.

    ssl_url:
      value: { get_attr: [ container_cdn, ssl_uri ] }
      description: The URI for downloading the object over HTTPS, using SSL.

    streaming_url:
      value: { get_attr: [ container_cdn, streaming_uri ] }
      description: |
        The URI for video streaming that uses HTTP Dynamic Streaming from Adobe.

    ios_url:
      value: { get_attr: [ container_cdn, ios_uri ] }
      description: |
        The URI for video streaming that uses HTTP Live Streaming from Apple.

Reference
=========

- `Cloud Files CDN API Documentation
  <https://developer.rackspace.com/docs/cloud-files/v1/developer-guide/#document-cdn-api-operations/api-operations-for-cdn-services>`_
- `Rackspace::Cloud::CloudFilesCDN Resource Documentation
  <http://orchestration.rackspace.com/raxdox/rackspace.html#Rackspace::Cloud::CloudFilesCDN>`_
