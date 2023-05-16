.. _get-list-billable-load-balancers:

List billable load balancers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code::

    GET /v1.0/{account}/loadbalancers/billable

Lists billable load balancers for a specified date range.

The response is paginated with a default limit of 500 and a maximum limit of
1000.

The load balancer usage reports provide a view of all transfer activity,
average number of connections, and number of virtual IPs associated with the
load balancing service. Values for both ``incomingTransfer`` and
``outgoingTransfer`` are expressed in bytes transferred. The
``startTime`` and ``endTime`` parameters are required.

.. note::

   List billable load balancers usage data is available for up to 90 days of service activity.

The following table shows the possible response codes for this operation:

+--------------------------+-------------------------+-------------------------+
|Response Code             |Name                     |Description              |
+==========================+=========================+=========================+
|200                       |Success                  |Request succeeded.       |
+--------------------------+-------------------------+-------------------------+
|400                       |Bad Request              |The request is missing   |
|                          |                         |one or more elements, or |
|                          |                         |the values of some       |
|                          |                         |elements are invalid.    |
+--------------------------+-------------------------+-------------------------+
|401                       |Unauthorized             |You are not authorized   |
|                          |                         |to complete this         |
|                          |                         |operation. This error    |
|                          |                         |can occur if the request |
|                          |                         |is submitted with an     |
|                          |                         |invalid authentication   |
|                          |                         |token.                   |
+--------------------------+-------------------------+-------------------------+
|404                       |Not Found                |The requested item was   |
|                          |                         |not found.               |
+--------------------------+-------------------------+-------------------------+
|413                       |Over Limit               |The number of items      |
|                          |                         |returned is above the    |
|                          |                         |allowed limit.           |
+--------------------------+-------------------------+-------------------------+
|422                       |ImmutableEntity          |This fault is returned   |
|                          |                         |when a user attempts to  |
|                          |                         |modify an item that is   |
|                          |                         |not currently in a state |
|                          |                         |that allows              |
|                          |                         |modification. For        |
|                          |                         |example, load balancers  |
|                          |                         |in a status of           |
|                          |                         |PENDING_UPDATE,BUILD, or |
|                          |                         |DELETED may not be       |
|                          |                         |modified.                |
+--------------------------+-------------------------+-------------------------+
|500                       |Load Balancer Fault      |The load balancer has    |
|                          |                         |experienced a fault.     |
+--------------------------+-------------------------+-------------------------+
|503                       |Service Unavailable      |The service is not       |
|                          |                         |available.               |
+--------------------------+-------------------------+-------------------------+

Request
-------

The following table shows the URI parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|{account}                 |String                   |The ID for the tenant or |
|                          |                         |account in a multi-      |
|                          |                         |tenancy cloud.           |
+--------------------------+-------------------------+-------------------------+

The following table shows the query parameters for the request:

+--------------------------+-------------------------+-------------------------+
|Name                      |Type                     |Description              |
+==========================+=========================+=========================+
|startTime                 |Date                     |You must have the        |
|                          |                         |startTime value          |
|                          |                         |for this query to work.  |
|                          |                         |                         |
|                          |                         |                         |
|                          |                         |                         |
+--------------------------+-------------------------+-------------------------+
|endTime                   |Date                     |You must have the        |
|                          |                         |endtime value            |
|                          |                         |for this query to work.  |
|                          |                         |                         |
|                          |                         |                         |
+--------------------------+-------------------------+-------------------------+
|offset                    |String                   |The pagination offset.   |
+--------------------------+-------------------------+-------------------------+
|limit                     |String                   |The pagination limit.    |
|                          |                         |The response is          |
|                          |                         |paginated with a default |
|                          |                         |limit of 500 and a       |
|                          |                         |maximum limit of 1000.   |
+--------------------------+-------------------------+-------------------------+

This operation does not accept a request body.

Response
--------

**Example List billable load balancers: JSON response**

.. code::

        {
            "loadBalancers": [
                {
                    "timeout": 30,
                    "created": {
                        "time": "2019-11-06T17:33:29Z"
                    },
                    "updated": {
                        "time": "2019-12-04T16:27:58Z"
                    },
                    "nodeCount": 1,
                    "algorithm": "RANDOM",
                    "status": "DELETED",
                    "name": "a-new-loadbalancer",
                    "id": 320029,
                    "protocol": "HTTP",
                    "port": 80
                },
                {
                    "timeout": 30,
                    "created": {
                        "time": "2019-11-06T17:37:25Z"
                    },
                    "updated": {
                        "time": "2019-12-04T16:27:59Z"
                    },
                    "nodeCount": 1,
                    "algorithm": "RANDOM",
                    "status": "DELETED",
                    "name": "a-new-loadbalancer",
                    "id": 320032,
                    "protocol": "HTTP",
                    "port": 80
                }
            ]
        }

**Example List billable load balancers: XML response**

.. code::

        <loadBalancers xmlns="http://docs.openstack.org/loadbalancers/api/v1.0" xmlns:atom="http://www.w3.org/2005/Atom">
            <loadBalancer id="320029" name="a-new-loadbalancer" algorithm="RANDOM" protocol="HTTP" port="80" status="DELETED" timeout="30" nodeCount="1">
                <created time="2019-11-06T17:33:29Z"/>
                <updated time="2019-12-04T16:27:58Z"/>
            </loadBalancer>
            <loadBalancer id="320032" name="a-new-loadbalancer" algorithm="RANDOM" protocol="HTTP" port="80" status="DELETED" timeout="30" nodeCount="1">
                <created time="2019-11-06T17:37:25Z"/>
                <updated time="2019-12-04T16:27:59Z"/>
            </loadBalancer>
        </loadBalancers>