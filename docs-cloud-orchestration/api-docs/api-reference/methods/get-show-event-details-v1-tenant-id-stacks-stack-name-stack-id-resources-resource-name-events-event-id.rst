
.. _get-show-event-details:

Show event details
~~~~~~~~~~~~~~~~~~

.. code::

    GET /v1/{tenant_id}/stacks/{stack_name}/{stack_id}/resources/{resource_name}/events/{event_id}

Shows details for a specified event.



This table shows the possible response codes for this operation:


+--------------------------+-------------------------+-------------------------+
|Response Code             |Name                     |Description              |
+==========================+=========================+=========================+
|200                       |Success                  |Request succeeded.       |
+--------------------------+-------------------------+-------------------------+

Request
-------

This table shows the URI parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|{tenant_id}               |String                   |The ID of the tenant. A  |
|                          |                         |tenant is also known as  |
|                          |                         |an account or project.   |
+--------------------------+-------------------------+-------------------------+
|stack_name                |String *(Required)*      |The name of a stack.     |
+--------------------------+-------------------------+-------------------------+
|{stack_id}                |String *(Required)*      |The stack ID.            |
+--------------------------+-------------------------+-------------------------+
|{resource_name}           |String *(Required)*      |The name of a resource   |
|                          |                         |in the stack.            |
+--------------------------+-------------------------+-------------------------+
|{event_id}                |String *(Required)*      |The ID of an event       |
|                          |                         |related to the resource  |
|                          |                         |in the stack.            |
+--------------------------+-------------------------+-------------------------+

This operation does not accept a request body.

Response
--------

**Example Show event details: JSON response**


.. code::

   {
       "event": {
           "event_time": "2015-06-25T14:59:53",
           "id": "8db23e2e-72b2-47a2-9ed9-b52417f56e50",
           "links": [
               {
                   "href": "http://hostname/v1/1234/stacks/mystack/56789/resources/random_key_name/events/8db23e2e-72b2-47a2-9ed9-b52417f56e50",
                   "rel": "self"
               },
               {
                   "href": "http://hostname/v1/1234/stacks/mystack/56789/resources/random_key_name",
                   "rel": "resource"
               },
               {
                   "href": "http://hostname/v1/1234/stacks/mystack/56789",
                   "rel": "stack"
               }
           ],
           "logical_resource_id": "random_key_name",
           "physical_resource_id": null,
           "resource_name": "random_key_name",
           "resource_properties": {
               "character_classes": null,
               "character_sequences": null,
               "length": 8,
               "salt": null,
               "sequence": null
           },
           "resource_status": "CREATE_IN_PROGRESS",
           "resource_status_reason": "state changed",
           "resource_type": "OS::Heat::RandomString"
       }
   }
