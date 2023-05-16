.. _create-or-update-account-metadata:

Create or update account metadata
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code::

    POST /v1/{account}

This operation creates or updates account metadata.

You can associate custom metadata headers with the account level URI. To create
or update an account metadata header, submit a ``POST`` operation. These
headers must have the format ``X-Account-Meta-name``. Replace ``name`` with
name of your metadata. (In the following example request, the metadata headers
are ``X-Account-Meta-Book`` and ``X-Account-Meta-Subject``.)

Subsequent ``POST`` operations for the same key/value pair overwrite the
previous value.

To confirm your metadata changes, you can perform a ``HEAD`` operation on the
account. (For information, see
:ref:`Get account metadata <get-account-metadata>`.) Do not send the metadata
in your ``HEAD`` operation.

This table shows the possible response codes for this operation:

+-------------------------+-------------------------+-------------------------+
|Response Code            |Name                     |Description              |
+=========================+=========================+=========================+
|204                      |No Content               |The request succeeded.   |
+-------------------------+-------------------------+-------------------------+
|400                      |Bad Request              |The request could not be |
|                         |                         |understood by the server |
|                         |                         |due to malformed syntax. |
+-------------------------+-------------------------+-------------------------+

Request
-------

This table shows the URI parameters for the request:

+-------------------------+-------------------------+-------------------------+
|Name                     |Type                     |Description              |
+=========================+=========================+=========================+
|{account}                |String                   |Your unique account      |
|                         |                         |identifier.              |
+-------------------------+-------------------------+-------------------------+

This table shows the header parameters for the request:

+-------------------------+-------------------------+-------------------------+
|Name                     |Type                     |Description              |
+=========================+=========================+=========================+
|X-Auth-Token             |String *(Required)*      |Authentication token.    |
+-------------------------+-------------------------+-------------------------+
|X-Account-Meta-Temp-URL- |String                   |The secret key value for |
|Key                      |                         |temporary URLs.          |
+-------------------------+-------------------------+-------------------------+
|X-Account-Meta-Temp-URL- |String                   |A second secret key      |
|Key-2                    |                         |value for temporary      |
|                         |                         |URLs. The second key     |
|                         |                         |enables you to rotate    |
|                         |                         |keys by having an old    |
|                         |                         |and new key active at    |
|                         |                         |the same time.           |
+-------------------------+-------------------------+-------------------------+
|X-Account-Meta-name      |String *(Required)*      |Account metadata that    |
|                         |                         |you want to create or    |
|                         |                         |update. Replace ``name`` |
|                         |                         |at the end of the header |
|                         |                         |with the name for your   |
|                         |                         |metadata. You must       |
|                         |                         |specify a                |
|                         |                         |``X-Account-Meta-name``  |
|                         |                         |header for               |
|                         |                         |metadata item (for       |
|                         |                         |each ``name``) that you  |
|                         |                         |want to add or update.   |
+-------------------------+-------------------------+-------------------------+

This operation does not accept a request body.

**Example: Create or update account metadata HTTP request**

.. code::

   POST /v1/MossoCloudFS_0672d7fa-9f85-4a81-a3ab-adb66a880123 HTTP/1.1
   Host: storage.clouddrive.com
   X-Auth-Token: f064c46a782c444cb4ba4b6434288f7c
   X-Account-Meta-Book: MobyDick
   X-Account-Meta-Subject: Whaling

Response
--------

This table shows the header parameters for the response:

+-------------------------+-------------------------+-------------------------+
|Name                     |Type                     |Description              |
+=========================+=========================+=========================+
|Content-Length           |String                   |If the operation         |
|                         |                         |succeeds, this value is  |
|                         |                         |zero (0). If the         |
|                         |                         |operation fails, this    |
|                         |                         |value is the length of   |
|                         |                         |the error text in the    |
|                         |                         |response body.           |
+-------------------------+-------------------------+-------------------------+
|Content-Type             |String                   |If the operation fails,  |
|                         |                         |this value is the MIME   |
|                         |                         |type of the error text   |
|                         |                         |in the response body.    |
+-------------------------+-------------------------+-------------------------+
|X-Trans-Id               |Uuid                     |A unique transaction     |
|                         |                         |identifier for this      |
|                         |                         |request.                 |
+-------------------------+-------------------------+-------------------------+
|Date                     |Datetime                 |The transaction date and |
|                         |                         |time.                    |
+-------------------------+-------------------------+-------------------------+

This operation does not return a response body.

**Example: Create or update account metadata HTTP response**

.. code::

   HTTP/1.1 204 No Content
   Content-Length: 0
   Content-Type: text/html; charset=UTF-8
   X-Trans-Id: tx1b4be419af2c4d688ee4d-0052cf1ea4dfw1
   Date: Thu, 09 Jan 2014 22:11:48 GMT
