.. code-block:: csharp

  new CloudBlockStorageProvider({cloudIdentity}).DeleteVolume("{volumeId}", "{region}");

.. code-block:: go

  err := volumes.Delete(serviceClient, "{volumeId}").ExtractErr()

.. code-block:: java

  VolumeApi volumeApi = cinderApi.getVolumeApi("{region}");

  volumeApi.delete("{volumeId}");

.. code-block:: javascript

  client.deleteVolume(volumeId, function(err) {
    if (err) {
      // TODO handle as appropriate
    }
  });

.. code-block:: php

  $volume->delete();

.. code-block:: python

  vol.delete()
  # Or:
  # cbs.delete(vol)

.. code-block:: ruby

  volume.destroy

.. code-block:: sh

  $ curl -X DELETE $ENDPOINT/volumes/{volumeId} \
    -H "X-Auth-Token: $TOKEN" \
    -H "Content-Type: application/json" | python -m json.tool
