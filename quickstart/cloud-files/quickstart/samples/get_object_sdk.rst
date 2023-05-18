.. code-block:: csharp

  cloudFilesProvider.GetObjectSaveToFile(
	"{container_name}",
	"{output_folder}",
	"{object_name}",
	"{output_filename}");

.. code-block:: go

  result := objects.Download(serviceClient, "{containerName}", "{objectName}", nil)
  content, err := result.ExtractContent()
  // result.Body is also an io.ReadCloser of the file content that may be consumed as a stream.

  err := ioutil.WriteFile("/tmp/somefile.txt", []byte(content), 0644)

.. code-block:: java

  ObjectApi objectApi =
      cloudFilesApi.getObjectApiForRegionAndContainer("{region}", "{containerName}");

  SwiftObject object = objectApi.get("{objectName}");

  // Write the object to a file
  InputStream inputStream = object.getPayload().openStream();
  File file = File.createTempFile("{objectName}", ".txt");
  BufferedOutputStream outputStream = new BufferedOutputStream(new FileOutputStream(file));

  try {
      ByteStreams.copy(inputStream, outputStream);
  }
  finally {
      inputStream.close();
      outputStream.close();
  }

.. code-block:: javascript

  // We need to use the fs module to access the local disk.
  var fs = require('fs');

  // TODO use a real file here
  var filePath = '/tmp/somefile.txt';

  // create a writeable stream for our source file
  var dest = fs.createWriteStream(filePath);

  // create a writeable stream for our destination
  var source = client.download({
    container: 'sample-container-test',
    remote: 'somefile.txt'
  }, function(err) {
    if (err) {
      // TODO handle as appropriate
    }
  });

  // pipe the source to the destination
  source.pipe(dest);

.. code-block:: php

  // Get the object content (data) as a stream.
  $stream = $object->getContent();

  // Cast to string
  $content = (string) $stream;

  // Write object content to file on local filesystem.
  $stream->rewind();
  $localFilename = tempnam("/tmp", 'php-opencloud-');
  file_put_contents($localFilename, $stream->getStream());

.. code-block:: python

  # Get the data as a string
  data = obj.get()

  # Download the object locally to a file
  obj.download("/tmp")

.. code-block:: ruby

  file.body

.. code-block:: sh

  curl -X GET $ENDPOINT/{containerName}/{objectName} \
    -H "X-Auth-Token: $TOKEN"
