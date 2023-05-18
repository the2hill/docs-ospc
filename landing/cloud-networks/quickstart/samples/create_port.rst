.. code-block:: csharp

  var portDefinition = new PortCreateDefinition(network.Id)
  {
      DeviceId = "{device-id}",
      DeviceOwner = "{device-owner}"
  };
  var port = await networkService.CreatePortAsync(portDefinition);

.. code-block:: go

  opts := osPorts.CreateOpts{
    NetworkID: network.ID,
    Name: "MyNewPort",
  }

  port, err := ports.Create(client, opts).Extract()

.. code-block:: java

  PortApi portApi = neutronApi.getPortApi("{region}");
  Port port = portApi.create(Port.createBuilder(network.getId())
      .name("MyNewPort")
      .build());

.. code-block:: javascript

  client.createPort({
    name: 'MyNewPort',
    networkId: network.id
  }, function(err, port) {
    if (err) {
      // TODO handle as appropriate
      return;
    }

    // TODO use your port here
  });

.. code-block:: php

  $port = $networkingService->createPort(array(
      'name'      => 'MyNewPort',
      'networkId' => $network->getId()
  ));

.. code-block:: python

  // Not currently supported by this SDK

.. code-block:: ruby

  @port = @client.ports.new({:name => "MyNewPort", :network_id => @network.id}).save

.. code-block:: sh

  curl -X "POST" "https://dfw.networks.api.rackspacecloud.com/v2.0/ports" \
    -H "X-Auth-Token: $TOKEN" \
    -H "Content-type: application/json" \
    -d $'{"port": {"name": "NewPort"}, "network": "$NETWORK_ID"} ' \
    -H "Accept: application/json" | python -m json.tool
