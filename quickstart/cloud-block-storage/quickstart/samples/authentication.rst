.. code-block:: csharp

  CloudIdentity cloudIdentity = new CloudIdentity()
  {
      APIKey = "{apiKey}",
      Username = "{username}"
  };
  CloudIdentityProvider cloudIdentityProvider = new CloudIdentityProvider(cloudIdentity);
  UserAccess userAccess = cloudIdentityProvider.Authenticate(cloudIdentity);

.. code-block:: go

  import (
    "github.com/rackspace/gophercloud"
    "github.com/rackspace/gophercloud/rackspace"
    "github.com/rackspace/gophercloud/rackspace/blockstorage/v1/snapshots"
    "github.com/rackspace/gophercloud/rackspace/blockstorage/v1/volumes"

    osvolumes "github.com/rackspace/gophercloud/openstack/blockstorage/v1/volumes"
  )

  ao := gophercloud.AuthOptions{
    Username: "{username}",
    APIKey: "{apiKey}",
  }
  provider, err := rackspace.AuthenticatedClient(ao)

  serviceClient, err := rackspace.NewBlockStorageV1(provider, gophercloud.EndpointOpts{
    Region: "{region}",
  })

.. code-block:: java

  // Authentication in jclouds is lazy and happens on the first call to the cloud.
  CinderApi cinderApi = ContextBuilder.newBuilder("rackspace-cloudblockstorage-us")
      .credentials("{username}", "{apiKey}")
      .buildApi(CinderApi.class);

.. code-block:: javascript

  pkgcloud = require('pkgcloud');

  // each client is bound to a specific service and provider
  var client = pkgcloud.blockstorage.createClient({
    provider: 'rackspace',
    username: '{username}',
    apiKey: '{apiKey}',
    region: '{region}'
  });

.. code-block:: php

  require 'vendor/autoload.php';

  use OpenCloud\Rackspace;

  // Instantiate a Rackspace client.
  $client = new Rackspace(Rackspace::US_IDENTITY_ENDPOINT, array(
      'username' => '{username}',
      'apiKey'   => '{apiKey}'
  ));

  $volumeService = $client->volumeService();

.. code-block:: python

  import pyrax
  pyrax.set_credentials("{username}", "{apiKey}", region="{region}")
  cbs = pyrax.cloud_blockstorage

.. code-block:: ruby

  require 'fog'

  @client = Fog::Rackspace::BlockStorage.new(
    :rackspace_username => '{username}',
    :rackspace_api_key => '{apiKey}',
    :rackspace_region => '{region}'
  )

.. code-block:: sh

  # {username}, {apiKey} below are placeholders, do not enclose '{}' when you replace them with actual credentials.

  $ curl -s https://identity.api.rackspacecloud.com/v2.0/tokens -X 'POST' \
    -d '{"auth":{"RAX-KSKEY:apiKeyCredentials":{"username":"{username}", "apiKey":"{apiKey}"}}}' \
    -H "Content-Type: application/json" | python -m json.tool

  # From the resulting json, set three environment variables: tenant, TOKEN and endpoint

  export TENANT="{tenantId}"
  export TOKEN="{tokenId}"
  export ENDPOINT="{publicUrl}" # For Block Storage service
