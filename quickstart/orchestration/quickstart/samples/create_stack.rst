.. code-block:: csharp

  // Not currently supported by this SDK

.. code-block:: go

  createOpts := osStacks.CreateOpts{
    Name: "a_redis_stack",
    TemplateURL: "redis_hot_template",
  }
  aRedisStack, err =: stacks.Create(serviceClient, createOpts).Extract()

.. code-block:: java

  // Not currently supported by this SDK

.. code-block:: javascript

  client.createStack({
    name: 'a_redis_stack',
    templateUrl: 'redis_hot_template'
  }, function(err, stack) {
    if (err) {
      // TODO handle as appropriate
      return;
    }

    // TODO use your stack here
  });

.. code-block:: php

  $orchestrationService = $client->orchestrationService(null, '{region}');

  $stack = $orchestrationService->createStack(array(
      'name'         => 'a_redis_stack',
      'templateUrl'  => 'redis_hot_template',
  ));

.. code-block:: python

  # Not currently supported by this SDK

.. code-block:: ruby

  @stack = @client.stacks.new.save(
    :stack_name => "a_redis_stack",
    :template   => redis_hot_template
  )

.. code-block:: sh

  $ curl -X POST -d \
    '{
    "stack_name": "{stackName}",
    "template": "{jsonOrchestrationTemplate}",
    "parameters": {
        "param_name-1": "{paramValue1}",
        "param_name-2": "{paramValue2}"
      },
    "timeout_mins": "{timeoutMins}"
    }' \
    -H "X-Auth-Token: $TOKEN" \
    -H "Content-Type: application/json" \
    $ENDPOINT/stacks | python -m json.tool
