.. _using-cloud-orchestration:

========================
Create and manage stacks
========================

You can use the examples in the following sections to create
and manage stacks by using Cloud Orchestration API operations.

.. contents::
   :local:
   :depth: 1

Before running the examples, review the
:ref:`Cloud Orchestration concepts<concepts>` to understand the API workflow,
messaging patterns, and use cases.

.. note::
     These examples use the ``$AUTH_URL``, ``$USERNAME``, ``$TENANT_ID``,
     ``$REGION_NAME``, and ``$PASSWORD`` environment
     variables to specify the API endpoint, Rackspace Cloud username,
     tenant ID,regional endpoint, and Rackspace Cloud password values
     for accessing the service. Make sure you
     :ref:`configure these variables <request-using-heat-client>` before
     running the code samples.

.. include:: examples/create-simple-stack.rst
.. include:: examples/list-stacks.rst
.. include:: examples/show-stack-details.rst
.. include:: examples/delete-stack.rst
.. include:: examples/create-stack-resource-group.rst
.. include:: examples/update-stack-lb.rst
.. include:: examples/delete-stack-lb.rst
