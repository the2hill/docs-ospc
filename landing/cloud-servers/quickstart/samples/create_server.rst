.. code-block:: csharp

  NewServer newServer = cloudServersProvider.CreateServer("{server_name}", "{image_id}", "{flavor_id}");

.. code-block:: go

  server, err := servers.Create(serviceClient, servers.CreateOpts{
    Name:      "My new server",
    ImageRef:  image.ID,
    FlavorRef: flavor.ID,
  }).Extract()

.. code-block:: java

  ServerApi serverApi = novaApi.getServerApi("{region}");

  ServerCreated serverCreated = serverApi.create("My new server", "{imageId}", "{flavorId}");

.. code-block:: javascript

  client.createServer({
    name: 'My new server',
    image: imageId,
    flavor: flavorId
  }, function(err, server) {
    if (err) {
      // TODO handle as appropriate
      return;
    }

    // TODO use your server here
  });

.. code-block:: php

  $server = $service->server();

  $response = $server->create(array(
      'name'     => 'My new server',
      'imageId'  => $image->getId(),
      'flavorId' => $flavor->getId()
  ));

.. code-block:: python

  server = cs.servers.create('bessie01', image.id, flavor.id)

.. code-block:: ruby

  server = @client.servers.create(
    :name => 'My new server',
    :image_id => image.id,
    :flavor_id => flavor.id
  )

.. code-block:: sh

  # Reminder: all {variableNames} are placeholders only. Must be replaced by actual and valid values
  curl -X POST $ENDPOINT/servers -d \
    '{
      "server" : {
          "name" : "My new server",
          "imageRef": "'"$IMAGE_ID"'",
          "flavorRef": '"$FLAVOR_ID"',
        }
      }' \
      -H "Content-Type: application/json" \
      -H "X-Auth-Token: $TOKEN" | python -m json.tool

  export SERVER_ID="{serverId}"
