.. code-block:: csharp

  IEnumerable<LoadBalancingProtocol> protocols =
	await cloudLoadBalancerProvider.ListProtocolsAsync(CancellationToken.None);
  LoadBalancingProtocol httpProtocol =
	protocols.First(i => i.Name.Equals("HTTP", StringComparison.OrdinalIgnoreCase));
  LoadBalancerConfiguration configuration = new LoadBalancerConfiguration(
      name: "{load_balancer_name}",
      nodes: null,
      protocol: httpProtocol,
      virtualAddresses: new[] { new LoadBalancerVirtualAddress(
		LoadBalancerVirtualAddressType.ServiceNet) },
      algorithm: LoadBalancingAlgorithm.RoundRobin);
  LoadBalancer tempLoadBalancer =
	await cloudLoadBalancerProvider.CreateLoadBalancerAsync(
		configuration,
		AsyncCompletionOption.RequestCompleted,
		CancellationToken.None, null);

.. code-block:: go

  opts := lbs.CreateOpts{
    Name:     "My Load Balancer",
    Port:     80,
    Protocol: "HTTP",
    VIPs: []vips.VIP{
      vips.VIP{Type: vips.PUBLIC},
    },
    Nodes: []nodes.Node{
      nodes.Node{Address: "10.1.1.1", Port: 80, Condition: nodes.ENABLED},
    },
  }

  lb, err := lbs.Create(client, opts).Extract()

.. code-block:: java

  LoadBalancerApi lbApi = clbApi.getLoadBalancerApi("{region}");

  CreateLoadBalancer createLB = CreateLoadBalancer.builder()
      .name("My Load Balancer")
      .protocol("HTTP")
      .port(80)
      .algorithm(BaseLoadBalancer.Algorithm.RANDOM)
      .virtualIPType(VirtualIP.Type.PUBLIC)
      .build();

  LoadBalancer loadBalancer = lbApi.create(createLB);

.. code-block:: javascript

  client.createLoadBalancer({
    name: 'My Load Balancer',
    protocol: pkgcloud.providers.rackspace.loadbalancer.Protocols.HTTP,
    virtualIps: [
      {
        type: pkgcloud.providers.rackspace.loadbalancer.VirtualIpTypes.PUBLIC
      }]
  }, function(err, lb) {
    if (err) {
      // TODO handle as appropriate
      return;
    }

    // TODO use your load balancer
  });

.. code-block:: php

  // Get an empty Load Balancer object
  $loadBalancer = $service->loadBalancer();

  // Add the IP types that your Load Balancer will support
  $loadBalancer->addVirtualIp('PUBLIC', 4);

  // Add a node, specifying IP address and port
  $loadBalancer->addNode('192.168.0.2', 80);

  // Send to the API
  $loadBalancer->create(array(
      'name'     => 'My Load Balancer',
      'port'     => 80,
      'protocol' => 'HTTP'
  ));

.. code-block:: python

  clb = pyrax.cloud_loadbalancers
  virtual_ipv4 = clb.VirtualIP(type="PUBLIC", ipVersion='IPV4')

  load_balancer = clb.create("balanced", port=80, protocol="HTTP",
                             virtual_ips=[virtual_ipv4])

.. code-block:: ruby

  @balancer = @client.load_balancers.create(
    :name => 'balanced',
    :protocol => 'HTTP',
    :port => 8080,
    :virtual_ips => [{ :type => 'PUBLIC' }],
    :nodes => []
  )

.. code-block:: sh

  curl -s -X POST $ENDPOINT/loadbalancers \
    -H "X-Auth-Token: $TOKEN" \
    -H "Content-Type: application/json" \
    -d \
      '{
          "loadBalancer": {
              "name": "balanced",
              "port": 8080,
              "protocol": "HTTP",
              "virtualIps": [
                { "type": "PUBLIC" }
              ]
          }
      }' | python -m json.tool
