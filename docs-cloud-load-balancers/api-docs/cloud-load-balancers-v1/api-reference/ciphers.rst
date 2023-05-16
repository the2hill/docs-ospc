.. _ciphers:

==============
Ciphers 
==============

.. contents::
   :local:
   :depth: 1

Ciphers are algorithms for performing encryption and decryption. They are used
to help provide secure communications over computer networks. Load balancers
that make use of the SSL Termination feature are configured to use only
certain ciphers based on the assigned cipher profile.

Ciphers profiles are a named set of cipher suites to be used by a load balancer.
The cipher profile can be assigned via the ``cipherProfile`` field
when creating or updating :ref:`SSL Termination <put-update-ssl-termination-configuration>`
configuration for the load balancer.

By default, load balancers are assigned the ``default`` cipher profile which is
managed by Rackspace and updated from time to time to disable ciphers that have
become insecure. For this reason, use of the ``default`` cipher profile is
recommended.

.. warning::
   The ``default`` profile is a general cipher suite that is designed to
   accommodate the largest number of possible clients. To accomplish this
   goal while still providing a base level of security, the ``default`` cipher
   suite will be updated from time to time to mitigate major vulnerabilities.
   Other cipher profile suites will be added to accomodate specific security
   requirements for environments that require stricter compliance.

You can view the list of ciphers enabled on a particular load balancer by
using the :ref:`List ciphers <get-list-configured-ciphers>` API.


Cipher profiles
~~~~~~~~~~~~~~~

The following table provides the available profiles and their associated ciphers.
As security concerns change, new cipher profiles may be added.

====================================== ======= ====================== ======================
  Ciphers                              default CLBCipherPolicy2017-08 CLBCipherPolicy2019-05
====================================== ======= ====================== ======================
TLS_AES_256_GCM_SHA384                    x             x                      x
TLS_AES_128_GCM_SHA256                    x             x                      x
SSL_ECDHE_RSA_WITH_AES_256_GCM_SHA384     x             x                      x
SSL_ECDHE_RSA_WITH_AES_128_GCM_SHA256     x             x                      x
SSL_ECDHE_RSA_WITH_AES_256_CBC_SHA384     x             x
SSL_ECDHE_RSA_WITH_AES_256_CBC_SHA        x             x
SSL_ECDHE_RSA_WITH_AES_128_CBC_SHA256     x             x
SSL_ECDHE_RSA_WITH_AES_128_CBC_SHA        x             x
SSL_RSA_WITH_AES_256_GCM_SHA384           x             x
SSL_RSA_WITH_AES_256_CBC_SHA256           x             x
SSL_RSA_WITH_AES_256_CBC_SHA              x             x
SSL_RSA_WITH_AES_128_GCM_SHA256           x             x
SSL_RSA_WITH_AES_128_CBC_SHA256           x             x
SSL_RSA_WITH_AES_128_CBC_SHA              x             x
SSL_RSA_WITH_3DES_EDE_CBC_SHA             x
====================================== ======= ====================== ======================

Cipher Statuses
~~~~~~~~~~~~~~~

+-----------------+---------------------------------------------------------------------+
| Name            | Description                                                         |
+=================+=====================================================================+
| ERROR           | The system encountered an error when attempting to retrieve the     |
|                 | load balancer ciphers. Contact Support.                             |
+-----------------+---------------------------------------------------------------------+


.. include:: methods/get-list-ciphers-v1.0-account-loadbalancers.rst
