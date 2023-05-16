.. _get-show-regional-source-addresses:

Show Regional Source Addresses
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. code::

    GET /v1.0/{account}/regionalsourceaddresses

Shows all regional source addresses for all the host machines with specific clusterType associated with account.


   The following table shows the possible response codes for this operation:

+--------------------------+-------------------------+-------------------------+
|Response Code             |Name                     |Description              |
+==========================+=========================+=========================+
|200                       |Success                  |Request succeeded.       |a
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
|500                       |Load Balancer Fault      |The load balancer        |
|                          |                         |service has              |
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

This operation does not accept a request body.

Response
--------


**Example Show regional source addresses: JSON response**

.. code::

    {
        "RegionalSourceAddresses": {
            "ipv4Publicnets": [
                "172.24.1.2",
                "172.24.1.1"
            ],
            "ipv4Servicenets": [
                "10.0.0.11",
                "10.0.0.12"
            ],
            "ipv6Publicnets": [
                "2001:4801:79f1:0000:0000:0000:0000:0003",
                "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
            ],
            "ipv6Servicenets": [
                "2001:0db8:0a0b:12f0:0000:0000:0000:0001",
                "2001:0db8:0a0b:12f0:0000:0000:0000:0002"
            ]
        }
    }


**Example Show regional source addresses: XML response**

.. code::

    <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
    <regionalSourceAddresses xmlns="http://docs.openstack.org/loadbalancers/api/v1.0" xmlns:atom="http://www.w3.org/2005/Atom">
        <ipv4Servicenets>
            <ipv4Servicenet>10.0.0.11</ipv4Servicenet>
            <ipv4Servicenet>10.0.0.12</ipv4Servicenet>
        </ipv4Servicenets>
        <ipv6Servicenets>
            <ipv6Servicenet>2001:0db8:0a0b:12f0:0000:0000:0000:0001</ipv6Servicenet>
            <ipv6Servicenet>2001:0db8:0a0b:12f0:0000:0000:0000:0002</ipv6Servicenet>
        <ipv6Servicenets/>
        <ipv4Publicnets>
            <ipv4Public>172.24.1.1</ipv4Public>
            <ipv4Public>172.24.1.2</ipv4Public>
        </ipv4Publicnets>
        <ipv6Publicnets>
            <ipv6Public>2001:4801:79f1:0000:0000:0000:0000:0003</ipv6Public>
            <ipv6Public>2001:0db8:85a3:0000:0000:8a2e:0370:7334</ipv6Public>
        </ipv6Publicnets>
    </regionalSourceAddresses>
