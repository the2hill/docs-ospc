.. code-block:: csharp

  IPage<Subnet> subnets = networkService.ListSubnetsAsync();

.. code-block:: go

  err := subnets.List(client, osSubnets.ListOpts{}).EachPage(func(page pagination.Page) (bool, error) {
    subnetList, err := osSubnets.ExtractSubnets(page)

    for _, subnet := range subnetList {

    }

    return true, nil
  })

.. code-block:: java

  List<Subnet> subnets = subnetApi.list().concat().toList();

.. code-block:: javascript

  client.getSubnets(function(err, subnets) {
    if (err) {
      // TODO handle as appropriate
      return;
    }

    // TODO use your subnets here
  });

.. code-block:: php

  $subnets = $networkingService->listSubnets();

.. code-block:: python

  // Not currently supported by this SDK

.. code-block:: ruby

  @client.subnets

.. code-block:: sh

  curl -X "GET" "https://dfw.networks.api.rackspacecloud.com/v2.0/subnets" \
    -H "X-Auth-Token: $TOKEN" \
    -H "Content-type: application/json" \
    -H "Accept: application/json" | python -m json.tool
