========================
 Rackspace Cloud Server
========================

Note: This document assumes that the reader is familiar with HOT
specification. If that is not the case, please go to the References
section listed at the end of this tutorial for the HOT specification link.

Brief summary
=============

Rackspace Cloud Servers can be created, updated, and deleted using Cloud
Orchestration.

A basic template to create a server is shown below

.. code:: yaml

    heat_template_version: 2014-10-16
    resources:
      test_server:
        type: "OS::Nova::Server"
        properties:
          name: test-server
          flavor: 2 GB General Purpose v1
          image: Debian 7 (Wheezy) (PVHVM)

OS::Nova::Server properties
===========================

The complete list of properties that can be provided to a
server resource follows below:

.. code:: yaml

      admin_pass: {Description: The administrator password for the server., Type: String}
      admin_user: {Description: 'Name of the administrative user to use on the server.
          The default cloud-init user set up for each image (e.g. "ubuntu" for Ubuntu
          12.04+, "fedora" for Fedora 19+ and "cloud-user" for CentOS/RHEL 6.5).', Type: String}
      availability_zone: {Description: Name of the availability zone for server placement.,
        Type: String}
      block_device_mapping: {Description: Block device mappings for this server., Type: CommaDelimitedList}
      block_device_mapping_v2: {Description: Block device mappings v2 for this server.,
        Type: CommaDelimitedList}
      config_drive:
        AllowedValues: ['True', 'true', 'False', 'false']
        Description: If True, enable config drive on the server.
        Type: Boolean
      diskConfig:
        AllowedValues: [AUTO, MANUAL]
        Description: Control how the disk is partitioned when the server is created.
        Type: String
      flavor: {Description: The ID or name of the flavor to boot onto., Type: String}
      flavor_update_policy:
        AllowedValues: [RESIZE, REPLACE]
        Default: RESIZE
        Description: Policy on how to apply a flavor update; either by requesting a server
          resize or by replacing the entire server.
        Type: String
      image: {Description: The ID or name of the image to boot with., Type: String}
      image_update_policy:
        AllowedValues: [REBUILD, REPLACE, REBUILD_PRESERVE_EPHEMERAL]
        Default: REBUILD
        Description: Policy on how to apply an image-id update; either by requesting a
          server rebuild or by replacing the entire server
        Type: String
      key_name: {Description: Name of keypair to inject into the server., Type: String}
      metadata: {Description: Arbitrary key/value metadata to store for this server. Both
          keys and values must be 255 characters or less.  Non-string values will be serialized
          to JSON (and the serialized string must be 255 characters or less)., Type: Json}
      name: {Description: Server name., Type: String}
      networks: {Description: 'An ordered list of nics to be added to this server, with
          information about connected networks, fixed ips, port etc.', Type: CommaDelimitedList}
      personality:
        Default: {}
        Description: A map of files to create/overwrite on the server upon boot. Keys
          are file names and values are the file contents.
        Type: Json
      reservation_id: {Description: A UUID for the set of servers being requested., Type: String}
      scheduler_hints: {Description: Arbitrary key-value pairs specified by the client
          to help boot a server., Type: Json}
      security_groups:
        Default: []
        Description: List of security group names or IDs. Cannot be used if neutron ports
          are associated with this server; assign security groups to the ports instead.
        Type: CommaDelimitedList
      software_config_transport:
        AllowedValues: [POLL_SERVER_CFN, POLL_SERVER_HEAT, POLL_TEMP_URL]
        Default: POLL_TEMP_URL
        Description: How the server should receive the metadata required for software
          configuration. POLL_SERVER_CFN will allow calls to the cfn API action DescribeStackResource
          authenticated with the provided keypair. POLL_SERVER_HEAT will allow calls to
          the Heat API resource-show using the provided keystone credentials. POLL_TEMP_URL
          will create and populate a Swift TempURL with metadata for polling.
        Type: String
      user_data: {Default: '', Description: User data script to be executed by cloud-init.,
        Type: String}
      user_data_format:
        AllowedValues: [HEAT_CFNTOOLS, RAW, SOFTWARE_CONFIG]
        Default: HEAT_CFNTOOLS
        Description: How the user_data should be formatted for the server. For HEAT_CFNTOOLS,
          the user_data is bundled as part of the heat-cfntools cloud-init boot configuration
          data. For RAW the user_data is passed to Nova unmodified. For SOFTWARE_CONFIG
          user_data is bundled as part of the software config data, and metadata is derived
          from any associated SoftwareDeployment resources.
        Type: String

Known behaviors/issues
======================

#. A rackconnected customer must provide the rackconnected network ID in the
   ``networks`` property to create a server in a rackconnected region
#. A rackconnected managed operations customer must provide the ServiceNet id
   in ``networks`` property if the server is created in a rackconnected region
   `(RackConnect compatibility
   information) <http://www.rackspace.com/knowledge_center/article/rackconnect-v30-compatibility>`__
#. If a shell script is provided in ``user_data`` property, ``user_data_format``
   property must be set to ``RAW``.
#. To inject data into the file system of the cloud server instance,
   provide file name and contents in ``personality`` property.
#. Provide key_name to authenticate via key-based authentication
   instead of password-based authentication.
#. Rackspace::Cloud::WinServer is very similar to OS::Nova::Server, but it does not
   work with Rackconnected accounts(both Rackconnect v2 and v3).

Example template-1
==================

In the following example template, we will create a single Linux server
using the Orchestration service. For the sake of simplicity, we will not use
template parameters in this example.

.. code:: yaml

    heat_template_version: 2014-10-16

    description: |
      Creating Rackspace cloud server using orchestration service.

    resources:
      test_server:
        type: "OS::Nova::Server"
        properties:
          name: test-server
          flavor: 2 GB General Purpose v1
          image: Debian 7 (Wheezy) (PVHVM)
    outputs:
      server_ip:
        value:
          get_attr: [test_server, accessIPv4]

Example template-2
==================

In the following example template, we will create a single Linux server
and provide ``user_data`` that can be used by a server when booting an
image.

.. code:: yaml

    heat_template_version: 2014-10-16

    description: |
      Creating Rackspace cloud server with user_data.

    resources:
      test_server:
        type: "OS::Nova::Server"
        properties:
          name: test-server
          admin_pass: password1
          flavor: 2 GB General Purpose v1
          image: Debian 7 (Wheezy) (PVHVM)
          user_data_format: RAW
          user_data: |
              #!/bin/bash -x
              echo "hello world" > /root/hello-world.txt      
    outputs:
      server_ip:
        value:
          get_attr: [test_server, accessIPv4]

This template creates a server in the Rackspace cloud and during the
server boot time, the script provided in the ``user_data`` property will be
executed. Here the user_data script is creating a hello-world.txt file
with 'hello world' as contents. You can login to the cloud server
using admin_pass and verify whether the 'hello-world.txt' file exists or
not.

Please note that if there was any error during execution of the script
that was provided as ``user_data``, then it will be silently ignored
and the stack-creation will continue. To handle error scenarios, please
take a look at 
`SwiftSignal <http://orchestration.rackspace.com/raxdox/openstack.html#OS::Heat::SwiftSignal>`__
resource documentation.

Example template-3
==================

In the following example template, we will create a single Linux server
providing private key for SSH access.

.. code:: yaml

    heat_template_version: 2014-10-16

    description: |
      Creating Rackspace cloud server with SSH access private key.

    resources:
      ssh_key:
        type: OS::Nova::KeyPair
        properties:
          name: private_access_key
          save_private_key: true

      test_server:
        type: "OS::Nova::Server"
        properties:
          name: test-server
          flavor: 2 GB General Purpose v1
          image: Debian 7 (Wheezy) (PVHVM)
          key_name: { get_resource: ssh_key }
    outputs:
      server_ip:
        value:
          get_attr: [test_server, accessIPv4]
      private_key:
        value:
          get_attr: [ssh_key, private_key]

This template first creates a Nova server key pair. Instead of using
username/password, ``private_key`` can be used to access the server.

Example template-4
==================

This template creates a single Linux server and installs the WordPress
application on the server.

.. code:: yaml

    heat_template_version: 2014-10-16

    description: |
      Create a Rackspace cloud server and install wordpress application.

    resources:
      wordpress_server:
        type: "OS::Nova::Server"
        properties:
          name: test-server
          flavor: 2 GB General Purpose v1
          image: Debian 7 (Wheezy) (PVHVM)
          user_data_format: RAW
          user_data:
            str_replace:
              template: |
                #!/bin/bash -v
                yum -y install mysql-server httpd wordpress
                sed -i "/Deny from All/d" /etc/httpd/conf.d/wordpress.conf
                sed -i "s/Require local/Require all granted/" /etc/httpd/conf.d/wordpress.conf
                sed --in-place --e "s/localhost/%dbhost%/" --e "s/database_name_here/%dbname%/" --e "s/username_here/%dbuser%/" --e "s/password_here/%dbpass%/" /usr/share/wordpress/wp-config.php
                /etc/init.d/httpd start
                chkconfig httpd on
                /etc/init.d/mysqld start
                chkconfig mysqld on
                cat << EOF | mysql
                CREATE DATABASE %dbname%;
                GRANT ALL PRIVILEGES ON %dbname%.* TO "%dbuser%"@"localhost"
                IDENTIFIED BY "%dbpass%";
                FLUSH PRIVILEGES;
                EXIT
                EOF
                iptables -I INPUT -p tcp --dport 80 -j ACCEPT
                iptables-save > /etc/sysconfig/iptables
              params:
                "%dbhost%": localhost
                "%dbname%": wordpress
                "%dbuser%": admin
                "%dbpass%": test_pass
    outputs:
      server_public_ip:
        value:
          get_attr: [wordpress_server, accessIPv4]
          description: The public ip address of the server

      website_url:
        value:
          str_replace:
            template: http://%ip%/wordpress
            params:
              "%ip%": { get_attr: [ wordpress_server, accessIPv4 ] }
        description: URL for Wordpress wiki      

Please note that to keep the template simple, all the values were hard
coded in the above template.

Reference
=========

-  `Cloud Orchestration API Developer
   Guide <https://developer.rackspace.com/docs/cloud-orchestration/v1/developer-guide/>`__
-  `Heat Orchestration Template (HOT)
   Specification <http://docs.openstack.org/developer/heat/template_guide/hot_spec.html>`__
-  `Cloud-init format
   documentation <http://cloudinit.readthedocs.org/en/latest/topics/format.html>`__
-  `Cloud servers getting started
   guide <https://docs.rackspace.com/servers/api/v2/cs-gettingstarted/content/overview.html>`__
-  `Cloud servers API developer
   guide <https://docs-ospc.rackspace.com/cloud-servers/v2/developer-guide/>`__
-  `Cloud servers
   FAQs <http://www.rackspace.com/knowledge_center/product-faq/cloud-servers>`__
-  `Cloud servers How to articles and other
   resources <http://www.rackspace.com/knowledge_center/article/cloud-servers-how-to-articles-other-resources>`__

