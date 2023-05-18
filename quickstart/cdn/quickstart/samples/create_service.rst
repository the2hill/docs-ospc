.. code-block:: csharp

  ServiceDefinition serviceDefinition = new ServiceDefinition("example_site", "{flavorId}",
      domains: new[] {new ServiceDomain("www.example.com")},
      origins: new[] {new ServiceOrigin("example.com")});
  string serviceId = await cdnService.CreateServiceAsync(serviceDefinition);
  await cdnService.WaitForServiceDeployedAsync(serviceId);

.. code-block:: go

  createOpts := osServices.CreateOpts{
    Name: "example_site",
    Domains: []osServices.Domain{
            osServices.Domain{
                    Domain: "www.example.com",
            },
    },
    Origins: []osServices.Origin{
            osServices.Origin{
                    Origin: "example.com",
            },
    },
    FlavorID: "{flavorId}",
  }
  location, err := services.Create(client, createOpts).Extract()

.. code-block:: java

  ServiceApi serviceApi = cdnApi.getServiceApi();
  URI serviceURI = serviceApi.create(
                 org.jclouds.openstack.poppy.v1.domain.CreateService.builder()
                       .name("jclouds_test_service")
                       .domains(
                             ImmutableList.of(
                                   Domain.builder().domain("www.example.com").build()))
                       .origins(ImmutableList.of(
                             Origin.builder()
                                   .origin("example.com")
                                   .build()))
                       .caching(ImmutableList.<Caching>of())
                       .restrictions(ImmutableList.<Restriction>of())
                       .flavorId("{flavorId}")
                       .build()
         );

.. code-block:: javascript

  var service = {
    name: 'example_site',
    domains: [
      {
        domain: 'www.example.com'
      }
    ],
    origins: [
      {
        origin: 'example.com'
      }
    ],
    flavorId: '{flavorId}'
  };

  client.createService(service, function(err, service) {
    if (err) {
      // TODO handle as appropriate
    }

    // TODO use your newly created service here
  });

.. code-block:: php

    $service = $cdnService->createService(array(
        'name'     => 'example_site',
        'domains'  => array(
            array(
                'domain' => 'www.example.com'
            )
        ),
        'origins'  => array(
            array(
                'origin' => 'example.com'
            )
        ),
        'flavorId' => '{flavorId}'
    ));

.. code-block:: python

  service = cdn.create_service("example_site", "{flavorId}",
                               [ { "domain": "www.example.com" } ],
                               [ { "origin": "example.com" } ])

.. code-block:: ruby

  @service = @client.services.new
  @service.name = "www.example.com"
  @service.flavor_id = "cdn"
  @service.add_domain "www.example.com"
  @service.add_origin "example.com"
  @service.save

.. code-block:: sh

  $ curl -X POST -d \
    '{
    "name": "mywebsite.com",
    "domains": [
        {
            "domain": "www.mywebsite.com"
        },
        {
            "domain": "blog.mywebsite.com"
        }
    ],
    "origins": [
        {
            "origin": "mywebsite.com",
            "port": 80,
            "ssl": false,
            "rules": []
        }
    },
    "flavor_id": "cdn"
    }' \
    -H "X-Auth-Token: $TOKEN" \
    -H "Content-Type: application/json" \
    $ENDPOINT/services | python -m json.tool
