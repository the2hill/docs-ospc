




==========================
Quickstart for Cloud Files
==========================
Rackspace offers a flexible and scalable solution to object storage through its Cloud Files service.

The core storage system is designed to provide a secure, network-accessible way to store an unlimited number of files. You can store as much as you want and pay only for storage space that you actually use.

Cloud Files also provides a simple yet powerful way to publish and distribute content behind a content delivery network (CDN). As a Cloud Files user, you get access to this network automatically.

Concepts
========
To use this service effectively, you should understand how these key ideas are used in this context:

CDN (Content Delivery Network)
    A highly available network for delivering content to users. Cloud Files uses the Akamai CDN.

container
    A storage compartment that provides a way for you to organize your data.

object
    The basic storage entity in Cloud Files.
    An object represents a single file and its optional metadata that you upload to the system.

.. include:: ../../_common/authenticate.rst

.. include::  samples/authentication.rst

Use the API
===========
Some of the basic operations you can perform with this API are described below.

To find information about endpoints and accessing tokens,
use the instructions in `Authentication Token <https://docs.rackspace.com/docs/cloud-identity/v2/api-reference/token-operations>`_.

Create container
----------------
Before you can upload any objects to Cloud Files, you must create a container to receive the objects.
To create a container:

.. include:: samples/create_container.rst

Get container
--------------
After a container has been created or if you want to inspect an existing container's objects or metadata, you can retrieve it as shown below:

.. include:: samples/get_container.rst

CDN-enable container
--------------------
To make any objects within a container publicly readable,
enable the container for access on the CDN (Content Delivery Network):

.. include:: samples/set_container_as_cdn.rst

Disable CDN for container
-------------------------
If you no longer wish to have your objects publicly readable, disable CDN access for the container:

.. include:: samples/unset_container_as_cdn.rst

Delete container
----------------
To delete a container:

.. include:: samples/delete_container.rst

For data safety reasons, you may not delete a container until **all** objects within it have been deleted.

Upload objects to container
---------------------------
To upload objects into a container:

.. include:: samples/upload_object.rst

Upload objects to a subdirectory
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
While you cannot create nested containers, Cloud Files does support subdirectories or subfolders. Objects are uploaded to a subdirectory through a special naming convention. This naming convention includes the subdirectory path in the object name, separating path segments with the forward-slash character ``/``.

For example, if you want the relative URL of the object to be ``/images/kittens/thumbnails/kitty.png``, upload the object to a container using that relative path as the object name.

.. include:: samples/subdirectory.rst

Change object metadata
------------------------
To change object metadata:

.. include:: samples/change_object_metadata.rst

After you have an object uploaded to a container, you can change its metadata in-place.
For instance, you can change its content-type so that when delivered to requesting clients, it can be treated accordingly.

Get object
----------
You and your clients can retrieve objects from Cloud Files in several ways.
To retrieve objects, the most common ways are:

Get object via temporary URL
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
To retrieve an object via temporary URL:

.. include:: samples/get_object_temp_url.rst

Get object via SDK
~~~~~~~~~~~~~~~~~~
To download objects directly into your local storage drive via SDK download:

.. include:: samples/get_object_sdk.rst

Get object via CDN URL
~~~~~~~~~~~~~~~~~~~~~~
Pre-requisite: `CDN-enable the object's container`_.

.. _CDN-enable the object's container: #cdn-enable-container

To retrieve an object through a CDN URL, that, unlike a temporary URL, never expires and may be considered a publicly-accessible permalink:

.. include:: samples/get_object_cdn.rst

Delete object
-------------
To delete an object from its container:

.. include:: samples/delete_object.rst

.. include:: ../../_common/moreinfo.rst
