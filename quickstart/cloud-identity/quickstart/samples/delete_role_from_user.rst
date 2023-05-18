.. code-block:: csharp

.. code-block:: go

  err := roles.DeleteUserRole(client, "{userId}", "{roleId}").ExtractErr()

.. code-block:: java

.. code-block:: javascript

  // Not currently supported by this SDK

.. code-block:: php

  $user->removeRole('{roleId}');

.. code-block:: python

  // Not currently supported by this SDK

.. code-block:: ruby

  // Not currently supported

.. code-block:: sh

  curl -s $BASE_URL"users/{userId}/roles/OS-KSADM/{roleId}" \
    -X DELETE -H "X-Auth-Token: $TOKEN"
