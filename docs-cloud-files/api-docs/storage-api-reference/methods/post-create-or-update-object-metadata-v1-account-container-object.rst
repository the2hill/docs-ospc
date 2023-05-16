.. _create-or-update-object-metadata:

Create or update object metadata
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code::

    POST /v1/{account}/{container}/{object}

This operation sets or updates your object metadata. Metadata must be in the
format ``X-Object-Meta-name`` where ``name`` is the name of your metadata. You
can also assign ``X-Delete-At`` or ``X-Delete-After`` to expiring objects.

You can set or update your custom metadata for existing objects by sending a
``POST`` request to the object name.

Metadata is set by using the header ``X-Object-Meta-name: value``, where `
`name`` is the custom name for your metadata and ``value`` is the value.

You can also set values for ``X-Delete-At`` and ``X-Delete-After`` to set
expirations for objects.

For information about working with metadata when copying objects, see
:ref:`Copy object <copy-object>`.

**Deleting object metadata**

For objects, the ``POST`` request to set metadata deletes all metadata that is
not explicitly set in the request. In other words, ALL the object metadata is
set at the time of the ``POST`` request. If you want to edit or remove one
header, include all other headers in the ``POST`` request and leave out the
header that you want to remove. This means that if you delete one entry without
posting the others, the others will also be deleted at that time.

For example, you use a ``HEAD`` request to list object metadata and get the
following results:

.. code::

   X-Object-Meta-Price: 50
   X-Object-Meta-Extra: Data

Then you perform a ``POST`` request similar to the following example to set
metadata on the same object that you listed above:

.. code::

   POST /v1/account/containName/objectName
   HTTP/1.1 Host: storage.clouddrive.com
   X-Auth-Token: yourAuthToken
   X-Object-Meta-Price: 45
   X-Object-Meta-Cost: 30

Listing the object metadata again after the ``POST`` then shows the following
results and ``X-Object-Meta-Extra`` no longer exists:

.. code::

   X-Object-Meta-Price: 45
   X-Object-Meta-Cost: 30

To remove all metadata for an object, simply perform a ``POST`` request for the
object with no metadata specified.

Note that removing container metadata works differently. For more information,
see :ref:`Delete container metadata <delete-container-metadata>`.

This table shows the possible response codes for this operation:

+-------------------------+-------------------------+-------------------------+
|Response Code            |Name                     |Description              |
+=========================+=========================+=========================+
|202                      |Accepted                 |The request was accepted |
|                         |                         |for processing.          |
+-------------------------+-------------------------+-------------------------+
|404                      |Not Found                |The requested resource   |
|                         |                         |was not found.           |
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
|{container}              |String                   |The unique identifier of |
|                         |                         |the container.           |
+-------------------------+-------------------------+-------------------------+
|{object}                 |String                   |The unique identifier of |
|                         |                         |the object.              |
+-------------------------+-------------------------+-------------------------+

This table shows the header parameters for the request:

+-------------------------+-------------------------+-------------------------+
|Name                     |Type                     |Description              |
+=========================+=========================+=========================+
|X-Auth-Token             |String *(Required)*      |Authentication token.    |
+-------------------------+-------------------------+-------------------------+
|X-Object-Meta-name       |String                   |The container metadata.  |
|                         |                         |The ``name`` represents  |
|                         |                         |the name of your         |
|                         |                         |metadata.                |
+-------------------------+-------------------------+-------------------------+
|X-Delete-At              |Int                      |The date, in the format  |
|                         |                         |of a Unix epoch          |
|                         |                         |timestamp, when the      |
|                         |                         |object will be removed.  |
+-------------------------+-------------------------+-------------------------+
|X-Delete-After           |Int                      |The date, in the format  |
|                         |                         |of a Unix epoch          |
|                         |                         |timestamp, after which   |
|                         |                         |the object is removed.   |
+-------------------------+-------------------------+-------------------------+
|Content-Type             |String                   |The media type of the    |
|                         |                         |entity-body sent. If not |
|                         |                         |specified, the ``Content-|
|                         |                         |Type`` is guessed, by    |
|                         |                         |using the Python         |
|                         |                         |mimetypes library, based |
|                         |                         |on the object path.      |
+-------------------------+-------------------------+-------------------------+
|X-Detect-Content-Type    |String                   |If you set this header   |
|                         |                         |to ``True``, the         |
|                         |                         |``Content-Type`` that is |
|                         |                         |sent in the request (if  |
|                         |                         |any) is ignored, and     |
|                         |                         |``Content-Type`` is      |
|                         |                         |guessed by using the     |
|                         |                         |Python mimetypes library |
|                         |                         |based on the object path.|
+-------------------------+-------------------------+-------------------------+
|Content-Disposition      |String                   |If set, specifies the    |
|                         |                         |override behavior for    |
|                         |                         |the browser. For         |
|                         |                         |example, this header     |
|                         |                         |might specify that the   |
|                         |                         |browser use a download   |
|                         |                         |program to save this     |
|                         |                         |file rather than show    |
|                         |                         |the file, which is the   |
|                         |                         |default.                 |
+-------------------------+-------------------------+-------------------------+
|Content-Encoding         |String                   |If set, the value of the |
|                         |                         |``Content-Encoding``     |
|                         |                         |metadata.                |
+-------------------------+-------------------------+-------------------------+

This operation does not accept a request body.

**Example: Update object metadata HTTP request**

.. code::

   POST /v1/MossoCloudFS_0672d7fa-9f85-4a81-a3ab-adb66a880123/MyContainer/MyObject HTTP/1.1
   Host: storage.clouddrive.com
   X-Auth-Token: f064c46a782c444cb4ba4b6434288f7c
   X-Object-Meta-Fruit: Apple
   X-Object-Meta-Veggie: Carrot

Response
--------

This table shows the header parameters for the response:

+-------------------------+-------------------------+-------------------------+
|Name                     |Type                     |Description              |
+=========================+=========================+=========================+
|Content-Length           |String                   |The length of the object |
|                         |                         |content in the response  |
|                         |                         |body, in bytes.          |
+-------------------------+-------------------------+-------------------------+
|Content-Type             |String                   |The MIME type of the     |
|                         |                         |object.                  |
+-------------------------+-------------------------+-------------------------+
|X-Trans-Id               |Uuid                     |A unique transaction     |
|                         |                         |identifier for this      |
|                         |                         |request.                 |
+-------------------------+-------------------------+-------------------------+
|Date                     |Datetime                 |The transaction date and |
|                         |                         |time.                    |
+-------------------------+-------------------------+-------------------------+

This operation does not return a response body.

**Example: Update object metadata HTTP response**

.. code::

   HTTP/1.1 202 Accepted
   Date: Thu, 07 Jun 2007 20:59:39 GMT
   Content-Length: 0
   Content-Type: text/plain; charset=UTF-8
   X-Trans-Id: tx5ec7ab81cdb34ced887c8-0052d84ca4
