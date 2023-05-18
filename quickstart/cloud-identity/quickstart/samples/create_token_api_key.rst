.. code-block:: csharp

.. code-block:: go

  opts := gophercloud.AuthOptions{
    Username: "{username}",
    APIKey: "{apiKey}",
  }

  token, err := tokens.Create(client, opts).ExtractToken()

.. code-block:: java

.. code-block:: javascript

  // Not currently supported by this SDK

.. code-block:: php

  // Generating tokens from API keys is handled by default in the main
  // OpenCloud\Rackspace client. See "Setup" section.

.. code-block:: python

  // Not currently supported by this SDK

.. code-block:: ruby

  // Generating tokens from API keys is handled by default in the main
  // Fog::Identity::Rackspace class.

.. code-block:: sh

  # {username}, {apiKey} below are placeholders, do not enclose '{}' when you
  # replace them with actual credentials.

  curl -s $BASE_URL"tokens" -X POST \
     -d '{
          "auth":{"RAX-KSKEY:apiKeyCredentials": {
            "username":"{username}",
            "apiKey":"{apiKey}"
          }}
        }' \
     -H "Content-Type: application/json" | python -m json.tool

  # From the resulting JSON, set this environment variable:
  export TOKEN="{tokenId}"
