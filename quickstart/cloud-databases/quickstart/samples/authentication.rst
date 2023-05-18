.. code-block:: csharp

  CloudIdentity cloudIdentity = new CloudIdentity()
  {
      APIKey = "{apiKey}",
      Username = "{username}"
  };
  CloudIdentityProvider cloudIdentityProvider = new CloudIdentityProvider(cloudIdentity);
  UserAccess userAccess = cloudIdentityProvider.Authenticate(cloudIdentity);
  CloudDatabasesProvider cloudDatabasesProvider = new CloudDatabasesProvider(
    cloudIdentity,
    "{region}",
    null
  );

.. code-block:: go

  import (
  "github.com/rackspace/gophercloud"
  "github.com/rackspace/gophercloud/rackspace"
  osDatabases "github.com/rackspace/gophercloud/openstack/db/v1/databases"
  osUsers "github.com/rackspace/gophercloud/openstack/db/v1/users"
  "github.com/rackspace/gophercloud/rackspace/db/v1/backups"
  "github.com/rackspace/gophercloud/rackspace/db/v1/databases"
  "github.com/rackspace/gophercloud/rackspace/db/v1/flavors"
  "github.com/rackspace/gophercloud/rackspace/db/v1/instances"
  "github.com/rackspace/gophercloud/rackspace/db/v1/users"
  )

  ao := gophercloud.AuthOptions{
  Username: "{username}",
  APIKey: "{apiKey}",
  }
  provider, err := rackspace.AuthenticatedClient(ao)

  serviceClient, err := rackspace.NewDBV1(provider, gophercloud.EndpointOpts{
  Region: "{region}",
  })

.. code-block:: java

  // Authentication in jclouds is lazy and happens on the first call to the cloud.
  TroveApi troveApi = ContextBuilder.newBuilder("rackspace-clouddatabases-us")
      .credentials("{username}", "{apiKey}")
      .buildApi(TroveApi.class);

.. code-block:: javascript

  pkgcloud = require('pkgcloud');

  var rackspace = pkgcloud.database.createClient({
    provider: 'rackspace',
    username: '{username}',
    apiKey: '{apiKey}',
    region: '{region}'
  });

.. code-block:: php

  require 'vendor/autoload.php';

  use OpenCloud\Rackspace;

  $client = new Rackspace(Rackspace::US_IDENTITY_ENDPOINT, array(
      'username' => '{username}',
      'apiKey'   => '{apiKey}'
  ));

.. code-block:: python

  import pyrax

  pyrax.set_credentials('{username}', '{apiKey}', region='{region}')
  cdb = pyrax.cloud_databases

.. code-block:: ruby

  require 'fog'

  @client = Fog::Rackspace::Databases.new(
    :rackspace_username => '{username}',
    :rackspace_api_key => '{apiKey}',
    :rackspace_region => '{region}'
  )

.. code-block:: sh

  # {username}, {apiKey} below are placeholders, do not enclose '{}' when you replace them with actual credentials.

  curl -s -X POST https://identity.api.rackspacecloud.com/v2.0/tokens \
    -H "Content-Type: application/json" \
    -d '{
      "auth": {
        "RAX-KSKEY:apiKeyCredentials": {
          "username": "{username}",
          "apiKey": "{apiKey}"
        }
      }
    }' | python -m json.tool

  # From the resulting json, set two environment variables: TOKEN and ENDPOINT.

  export TOKEN="{tokenId}"
  export ENDPOINT="{publicUrl}" # For the Cloud Databases service
