
Rackspace Resource Types
************************


Rackspace::AutoScale::Group
===========================

Represents a scaling group.


Required Properties
-------------------


groupConfiguration
~~~~~~~~~~~~~~~~~~

Group configuration.

Map value expected.

Can be updated without replacement.

*Map properties:*


groupConfiguration.cooldown
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Number of seconds after capacity changes during which further capacity
changes are disabled.

Number value expected.

Can be updated without replacement.


groupConfiguration.maxEntities
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Maximum number of entities in this scaling group.

Integer value expected.

Can be updated without replacement.


groupConfiguration.metadata
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Arbitrary key/value metadata to associate with this group.

Map value expected.

Can be updated without replacement.


groupConfiguration.minEntities
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Minimum number of entities in this scaling group.

Integer value expected.

Can be updated without replacement.


groupConfiguration.name
~~~~~~~~~~~~~~~~~~~~~~~

Name of the scaling group.

String value expected.

Can be updated without replacement.


launchConfiguration
~~~~~~~~~~~~~~~~~~~

Launch configuration.

Map value expected.

Can be updated without replacement.

*Map properties:*


launchConfiguration.args
~~~~~~~~~~~~~~~~~~~~~~~~

Type-specific launch arguments.

Map value expected.

Can be updated without replacement.

*Map properties:*


launchConfiguration.args.loadBalancers
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

List of load balancers to hook the server up to. If not specified, no
load balancing will be configured.

List value expected.

Can be updated without replacement.

Defaults to "[]".

*List contents:*


launchConfiguration.args.loadBalancers.*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Map value expected.

Can be updated without replacement.

*Map properties:*


launchConfiguration.args.loadBalancers.*.loadBalancerId
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ID of the load balancer.

String value expected.

Can be updated without replacement.


launchConfiguration.args.loadBalancers.*.port
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Server port to connect the load balancer to.

Integer value expected.

Can be updated without replacement.


launchConfiguration.args.server
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Server creation arguments, as accepted by the Cloud Servers server
creation API.

Map value expected.

Can be updated without replacement.

*Map properties:*


launchConfiguration.args.server.config_drive
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Enable config drive on the instance.

Boolean value expected.

Can be updated without replacement.


launchConfiguration.args.server.diskConfig
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Configuration specifying the partition layout. AUTO to create a
partition utilizing the entire disk, and MANUAL to create a partition
matching the source image.

String value expected.

Can be updated without replacement.

Allowed values: AUTO, MANUAL


launchConfiguration.args.server.flavorRef
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The ID or name of the flavor to boot onto.

String value expected.

Can be updated without replacement.

Value must be of type nova.flavor


launchConfiguration.args.server.imageRef
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The ID or name of the image to boot with.

String value expected.

Can be updated without replacement.

Value must be of type glance.image


launchConfiguration.args.server.key_name
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Name of a previously created SSH keypair to allow key-based
authentication to the server.

String value expected.

Can be updated without replacement.


launchConfiguration.args.server.metadata
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Metadata key and value pairs.

Map value expected.

Can be updated without replacement.


launchConfiguration.args.server.name
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Server name.

String value expected.

Can be updated without replacement.


launchConfiguration.args.server.networks
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Networks to attach to. If unspecified, the instance will be attached
to the public Internet and private ServiceNet networks.

List value expected.

Can be updated without replacement.

*List contents:*


launchConfiguration.args.server.networks.*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Map value expected.

Can be updated without replacement.

*Map properties:*


launchConfiguration.args.server.networks.*.uuid
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

UUID of network to attach to.

String value expected.

Can be updated without replacement.


launchConfiguration.args.server.personality
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

File path and contents.

Map value expected.

Can be updated without replacement.


launchConfiguration.args.server.user_data
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

User data for bootstrapping the instance.

String value expected.

Can be updated without replacement.


launchConfiguration.args.stack
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The attributes that Auto Scale uses to create a new stack. The
attributes that you specify for the stack entity apply to all new
stacks in the scaling group. Note the stack arguments are directly
passed to Heat when creating a stack.

Map value expected.

Can be updated without replacement.

*Map properties:*


launchConfiguration.args.stack.disable_rollback
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Keep the resources that have been created if the stack fails to
create. Defaults to True.

Boolean value expected.

Can be updated without replacement.

Defaults to "True".


launchConfiguration.args.stack.environment
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The environment for the stack.

Map value expected.

Can be updated without replacement.


launchConfiguration.args.stack.files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The contents of files that the template references.

Map value expected.

Can be updated without replacement.


launchConfiguration.args.stack.parameters
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Key/value pairs of the parameters and their values to pass to the
parameters in the template.

Map value expected.

Can be updated without replacement.


launchConfiguration.args.stack.template
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The template that describes the stack. Either the template or
template_url property must be specified.

String value expected.

Can be updated without replacement.


launchConfiguration.args.stack.template_url
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A URI to a template. Either the template or template_url property must
be specified.

String value expected.

Can be updated without replacement.


launchConfiguration.args.stack.timeout_mins
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The stack creation timeout in minutes.

Integer value expected.

Can be updated without replacement.


launchConfiguration.type
~~~~~~~~~~~~~~~~~~~~~~~~

Launch configuration method. Only launch_server and launch_stack are
currently supported.

String value expected.

Can be updated without replacement.

Allowed values: launch_server, launch_stack


Attributes
----------


show
~~~~

Detailed information about resource.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: Rackspace::AutoScale::Group
       properties:
         groupConfiguration: {"metadata": {...}, "name": String, "minEntities": Integer, "cooldown": Number, "maxEntities": Integer}
         launchConfiguration: {"args": {"stack": {"disable_rollback": Boolean, "template": String, "environment": {...}, "parameters": {...}, "files": {...}, "timeout_mins": Integer, "template_url": String}, "server": {"user_data": String, "name": String, "diskConfig": String, "flavorRef": String, "config_drive": Boolean, "networks": [{"uuid": String}, {"uuid": String}, ...], "key_name": String, "metadata": {...}, "imageRef": String, "personality": {...}}, "loadBalancers": [{"port": Integer, "loadBalancerId": String}, {"port": Integer, "loadBalancerId": String}, ...]}, "type": String}


Rackspace::AutoScale::ScalingPolicy
===================================

Represents a Rackspace Auto Scale scaling policy.


Required Properties
-------------------


group
~~~~~

Scaling group ID that this policy belongs to.

String value expected.

Updates cause replacement.


name
~~~~

Name of this scaling policy.

String value expected.

Can be updated without replacement.


type
~~~~

Type of this scaling policy. Specifies how the policy is executed.

String value expected.

Can be updated without replacement.

Allowed values: webhook, schedule, cloud_monitoring


Optional Properties
-------------------


args
~~~~

Type-specific arguments for the policy.

Map value expected.

Can be updated without replacement.


change
~~~~~~

Amount to add to or remove from current number of instances.
Incompatible with changePercent and desiredCapacity.

Integer value expected.

Can be updated without replacement.


changePercent
~~~~~~~~~~~~~

Percentage-based change to add or remove from current number of
instances. Incompatible with change and desiredCapacity.

Number value expected.

Can be updated without replacement.


cooldown
~~~~~~~~

Number of seconds after a policy execution during which further
executions are disabled.

Number value expected.

Can be updated without replacement.


desiredCapacity
~~~~~~~~~~~~~~~

Absolute number to set the number of instances to. Incompatible with
change and changePercent.

Integer value expected.

Can be updated without replacement.


Attributes
----------


show
~~~~

Detailed information about resource.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: Rackspace::AutoScale::ScalingPolicy
       properties:
         args: {...}
         change: Integer
         changePercent: Number
         cooldown: Number
         desiredCapacity: Integer
         group: String
         name: String
         type: String


Rackspace::AutoScale::WebHook
=============================

Represents a Rackspace AutoScale webhook.

Exposes the URLs of the webhook as attributes.


Required Properties
-------------------


name
~~~~

The name of this webhook.

String value expected.

Can be updated without replacement.


policy
~~~~~~

The policy that this webhook should apply to, in
{group_id}:{policy_id} format. Generally a Ref to a Policy resource.

String value expected.

Updates cause replacement.


Optional Properties
-------------------


metadata
~~~~~~~~

Arbitrary key/value metadata for this webhook.

Map value expected.

Can be updated without replacement.


Attributes
----------


capabilityUrl
~~~~~~~~~~~~~

The url for executing the webhook (doesn't require auth).


executeUrl
~~~~~~~~~~

The url for executing the webhook (requires auth).


show
~~~~

Detailed information about resource.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: Rackspace::AutoScale::WebHook
       properties:
         metadata: {...}
         name: String
         policy: String


Rackspace::Cloud::AssociateSharedIP
===================================

Note: Available since 2015.1 (Kilo)

Resource to associate shared IP with servers.


Required Properties
-------------------


servers
~~~~~~~

List of servers to associate a shared IP.

List value expected.

Updates cause replacement.

*List contents:*


servers.*
~~~~~~~~~

Servers ID.

String value expected.

Updates cause replacement.


Optional Properties
-------------------


shared_ip
~~~~~~~~~

ID of the shared IP.

String value expected.

Updates cause replacement.


Attributes
----------


associations
~~~~~~~~~~~~

IP associations.


show
~~~~

Detailed information about resource.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: Rackspace::Cloud::AssociateSharedIP
       properties:
         servers: [String, String, ...]
         shared_ip: String


Rackspace::Cloud::BackupConfig
==============================

Note: Available since 2015.1 (Kilo)

Rackspace cloud backup configuration resource.


Required Properties
-------------------


BackupConfigurationName
~~~~~~~~~~~~~~~~~~~~~~~

Cloud backup configuration name.

String value expected.

Updates cause replacement.


DayOfWeekId
~~~~~~~~~~~

Indicates the day of the week. Valid values are 0 through 6, with 0
representing Sunday and 6 representing Saturday. null is also a valid
value when the Frequency value is "Manually" ,"Hourly", or "Daily".

String value expected.

Can be updated without replacement.


HourInterval
~~~~~~~~~~~~

Indicates the hour. Valid values are 1 through 23, as well as null
when the Frequency value is "Manually" ,"Daily", or "Weekly".

String value expected.

Can be updated without replacement.


Inclusions
~~~~~~~~~~

Indicates the list of files and folders to back up.

List value expected.

Can be updated without replacement.

*List contents:*


Inclusions.*
~~~~~~~~~~~~

Map value expected.

Can be updated without replacement.

*Map properties:*


Inclusions.*.FileItemType
~~~~~~~~~~~~~~~~~~~~~~~~~

File item type.

String value expected.

Can be updated without replacement.

Allowed values: Folder, File


Inclusions.*.FilePath
~~~~~~~~~~~~~~~~~~~~~

File  or folder path.

String value expected.

Can be updated without replacement.


NotifyFailure
~~~~~~~~~~~~~

Indicates if emails are sent after a failed backup. Valid values are
true or false.

Boolean value expected.

Can be updated without replacement.


NotifyRecipients
~~~~~~~~~~~~~~~~

Indicates the email address to notify in case of backup success or
failure.

String value expected.

Can be updated without replacement.


StartTimeAmPm
~~~~~~~~~~~~~

Indicates AM or PM. Valid values are "AM" or "PM", as well as null
when the Frequency value is "Manually" or "Hourly".

String value expected.

Can be updated without replacement.

Allowed values: AM, PM,


StartTimeHour
~~~~~~~~~~~~~

Indicates the hour when the backup runs. Valid values are 1 through
12, as well as null when the Frequency value is "Manually" or
"Hourly".

String value expected.

Can be updated without replacement.


StartTimeMinute
~~~~~~~~~~~~~~~

Indicates the minute when the backup runs. Valid values are 0 through
59, as well as null when the Frequency value is "Manually" or
"Hourly".

String value expected.

Can be updated without replacement.


TimeZoneId
~~~~~~~~~~

Specifies the time zone where the backup runs, for example "Eastern
Standard Time".

String value expected.

Can be updated without replacement.

Defaults to "Eastern Standard Time".


Optional Properties
-------------------


Enabled
~~~~~~~

Indicates backup configuration is enabled or not.

Boolean value expected.

Can be updated without replacement.

Defaults to "True".


Exclusions
~~~~~~~~~~

Indicates the list of files and folders not to back up.

List value expected.

Can be updated without replacement.

*List contents:*


Exclusions.*
~~~~~~~~~~~~

Map value expected.

Can be updated without replacement.

*Map properties:*


Exclusions.*.FileItemType
~~~~~~~~~~~~~~~~~~~~~~~~~

File item type.

String value expected.

Can be updated without replacement.

Allowed values: Folder, File


Exclusions.*.FilePath
~~~~~~~~~~~~~~~~~~~~~

File or folder path.

String value expected.

Can be updated without replacement.


Frequency
~~~~~~~~~

Frequency of backup schedule. Valid values are Manually, Hourly,
Daily, and Weekly.

String value expected.

Can be updated without replacement.

Defaults to "Daily".

Allowed values: Manually, Hourly, Daily, Weekly


IsActive
~~~~~~~~

Indicates backup configuration is active.

Boolean value expected.

Can be updated without replacement.

Defaults to "True".


NotifySuccess
~~~~~~~~~~~~~

Indicates if emails are sent after a successful backup. Valid values
are true or false.

Boolean value expected.

Can be updated without replacement.

Defaults to "False".


VersionRetention
~~~~~~~~~~~~~~~~

Indicates how many days backup revisions are maintained. Valid values
are 0, 30 , and 60. 0 means indefinite.

Integer value expected.

Can be updated without replacement.

Defaults to "60".

Allowed values: 0, 30, 60


host_ip_address
~~~~~~~~~~~~~~~

The IP address of the server to back up. Required if "server" is not
specifed; should be omitted otherwise.

String value expected.

Updates cause replacement.


server
~~~~~~

The id of the Cloud Server to back up. Required if "host_ip_address"
is not specified; should be omitted otherwise.

String value expected.

Updates cause replacement.

Value must be of type nova.server


Attributes
----------


backup_agent_id
~~~~~~~~~~~~~~~

Backup agent ID.


backup_config_details
~~~~~~~~~~~~~~~~~~~~~

Backup config details.


show
~~~~

Detailed information about resource.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: Rackspace::Cloud::BackupConfig
       properties:
         BackupConfigurationName: String
         DayOfWeekId: String
         Enabled: Boolean
         Exclusions: [{"FilePath": String, "FileItemType": String}, {"FilePath": String, "FileItemType": String}, ...]
         Frequency: String
         HourInterval: String
         Inclusions: [{"FilePath": String, "FileItemType": String}, {"FilePath": String, "FileItemType": String}, ...]
         IsActive: Boolean
         NotifyFailure: Boolean
         NotifyRecipients: String
         NotifySuccess: Boolean
         StartTimeAmPm: String
         StartTimeHour: String
         StartTimeMinute: String
         TimeZoneId: String
         VersionRetention: Integer
         host_ip_address: String
         server: String


Rackspace::Cloud::CDN
=====================

Rackspace CDN gives you the power to accelerate content on any public
resource at Rackspace. It provides a simple API and Control Panel
experience for you to manage your CDN-enabled domains and the origins
and assets associated with those domains.

A service represents an application that has its content cached to the
edge nodes.


Required Properties
-------------------


domains
~~~~~~~

Specifies a list of domains used by users to access their website.

List value expected.

Can be updated without replacement.

*List contents:*


domains.*
~~~~~~~~~

Map value expected.

Can be updated without replacement.

*Map properties:*


domains.*.certificate
~~~~~~~~~~~~~~~~~~~~~

Specifies the type of security certificate. For the certificate
parameter to apply, the protocol parameter must be set to https. For
all 3 types of security certificates, make sure that your origin (or
origins) are SSL-enabled. Your SSL certificate needs to come from a
trusted certificate authority (CA). For more information about
security certificates and Rackspace CDN, see
https://www.rackspace.com/knowledge_center/article/rackspace-cdn-secure-delivery-options.

String value expected.

Can be updated without replacement.

Allowed values: shared, san, custom


domains.*.domain
~~~~~~~~~~~~~~~~

Specifies the domain used to access the assets on your website, for
which you use a CNAME to the CDN provider.

String value expected.

Can be updated without replacement.

The length must be in the range 3 to 253.


domains.*.protocol
~~~~~~~~~~~~~~~~~~

Specifies the protocol used to access the assets on this domain.

String value expected.

Can be updated without replacement.

Defaults to "http".

Allowed values: http, https


flavor_id
~~~~~~~~~

Specifies the CDN provider flavor to use.

String value expected.

Updates cause replacement.

Value must be of type cloud_cdn.flavor


name
~~~~

Specifies the name of the service.

String value expected.

Updates cause replacement.

The length must be in the range 3 to 253.


origins
~~~~~~~

Specifies a list of origin domains or IP addresses where the original
assets are stored.

List value expected.

Can be updated without replacement.

*List contents:*


origins.*
~~~~~~~~~

Map value expected.

Can be updated without replacement.

*Map properties:*


origins.*.hostheadertype
~~~~~~~~~~~~~~~~~~~~~~~~

Specifies the type for the host header.

String value expected.

Can be updated without replacement.

Defaults to "domain".

Allowed values: domain, origin, custom


origins.*.hostheadervalue
~~~~~~~~~~~~~~~~~~~~~~~~~

Specifies the value to be contained in the host header. The default
value is NULL; this value is assigned only when hostheadertype is
"domain". You are required to specify hostheadervalue only when
hostheadertype is specified as custom. If you specify hostheadertype
as origin, hostheadervalue takes the value of the origin domain.

String value expected.

Can be updated without replacement.


origins.*.origin
~~~~~~~~~~~~~~~~

Specifies the URL or IP address from which to pull origin content.

String value expected.

Can be updated without replacement.

The length must be in the range 3 to 253.


origins.*.port
~~~~~~~~~~~~~~

Specifies the port used to access the origin.

Integer value expected.

Can be updated without replacement.

Defaults to "80".

Allowed values: 80, 443


origins.*.rules
~~~~~~~~~~~~~~~

Specifies a collection of rules that define the conditions when this
origin should be accessed. If there is more than one origin, the rules
parameter is required.

List value expected.

Can be updated without replacement.

Defaults to "[]".

*List contents:*


origins.*.rules.*
~~~~~~~~~~~~~~~~~

Map value expected.

Can be updated without replacement.

*Map properties:*


origins.*.rules.*.name
~~~~~~~~~~~~~~~~~~~~~~

Specifies the name of this rule.

String value expected.

Can be updated without replacement.

The length must be in the range 1 to 256.


origins.*.rules.*.request_url
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Specifies the request URL that this rule should match for this origin
to be used. Regex is supported. Note: Use a Perl Compatible Regex
(PCRE).

String value expected.

Can be updated without replacement.

The length must be in the range 1 to 1024.


origins.*.ssl
~~~~~~~~~~~~~

Uses HTTPS to access the origin.

Boolean value expected.

Can be updated without replacement.

Defaults to "False".


Optional Properties
-------------------


caching
~~~~~~~

Specifies the TTL rules for the assets under this service. Supports
wildcards for fine-grained control.

List value expected.

Updates cause replacement.

*List contents:*


caching.*
~~~~~~~~~

Map value expected.

Updates cause replacement.

*Map properties:*


caching.*.name
~~~~~~~~~~~~~~

Specifies the name of this caching rule.

String value expected.

Updates cause replacement.

The length must be in the range 1 to 256.


caching.*.rules
~~~~~~~~~~~~~~~

Specifies a collection of rules that determine if this TTL should be
applied to an asset. Note: This is a required property if more than
one entry is present for caching.

List value expected.

Updates cause replacement.

Defaults to "[]".

*List contents:*


caching.*.rules.*
~~~~~~~~~~~~~~~~~

Map value expected.

Updates cause replacement.

*Map properties:*


caching.*.rules.*.name
~~~~~~~~~~~~~~~~~~~~~~

Specifies the name of this rule.

String value expected.

Updates cause replacement.

The length must be in the range 1 to 256.


caching.*.rules.*.request_url
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Specifies the request URL that this rule should match for this TTL to
be used. Regex is supported. Note: Use a Perl Compatible Regex (PCRE).

String value expected.

Updates cause replacement.

The length must be in the range 1 to 1024.


caching.*.ttl
~~~~~~~~~~~~~

Specifies the TTL to apply.

Integer value expected.

Updates cause replacement.

The value must be in the range 0 to 365.


log_delivery
~~~~~~~~~~~~

Specifies whether to enable log delivery to a Cloud Files container.
You can use access log delivery to analyze the number of requests for
each object, the client IP address, and time-based usage patterns
(such as monthly or seasonal usage). Logs are stored in a Cloud Files
container named CDN_ACCESS_LOGS. If this container does not exist, it
is created.

Boolean value expected.

Can be updated without replacement.

Defaults to "False".


restrictions
~~~~~~~~~~~~

Specifies the restrictions that define who can access assets (content
from the CDN cache).

List value expected.

Updates cause replacement.

*List contents:*


restrictions.*
~~~~~~~~~~~~~~

Map value expected.

Updates cause replacement.

*Map properties:*


restrictions.*.access
~~~~~~~~~~~~~~~~~~~~~

Specifies the type of this restriction.

String value expected.

Updates cause replacement.

Defaults to "whitelist".

Allowed values: whitelist, blacklist


restrictions.*.name
~~~~~~~~~~~~~~~~~~~

Specifies the name of this restriction.

String value expected.

Updates cause replacement.

The length must be in the range 1 to 256.


restrictions.*.rules
~~~~~~~~~~~~~~~~~~~~

Specifies a collection of rules that determine if this restriction
should be applied to an asset.

List value expected.

Updates cause replacement.

Defaults to "[]".

*List contents:*


restrictions.*.rules.*
~~~~~~~~~~~~~~~~~~~~~~

Map value expected.

Updates cause replacement.

*Map properties:*


restrictions.*.rules.*.client_ip
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Specifies the client IP address to which the rule applies. Note:
Rackspace CDN does not currently support Classless Inter-Domain
Routing (CIDR) for these restrictions.

String value expected.

Updates cause replacement.


restrictions.*.rules.*.name
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Specifies the name of this rule.

String value expected.

Updates cause replacement.

The length must be in the range 1 to 256.


restrictions.*.rules.*.referrer
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Specifies the HTTP host that requests must come from.

String value expected.

Updates cause replacement.

The length must be in the range 3 to 1024.


restrictions.*.rules.*.request_url
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Specifies the request URL to which the rule applies. The default value
is /*, which indicates all content at the request URL.

String value expected.

Updates cause replacement.


Attributes
----------


access_url
~~~~~~~~~~

URL for which to create a CNAME record for serving content


log_url
~~~~~~~

URL for accessing CDN logs for this service if enabled


show
~~~~

Detailed information about resource.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: Rackspace::Cloud::CDN
       properties:
         caching: [{"rules": [{"name": String, "request_url": String}, {"name": String, "request_url": String}, ...], "name": String, "ttl": Integer}, {"rules": [{"name": String, "request_url": String}, {"name": String, "request_url": String}, ...], "name": String, "ttl": Integer}, ...]
         domains: [{"domain": String, "protocol": String, "certificate": String}, {"domain": String, "protocol": String, "certificate": String}, ...]
         flavor_id: String
         log_delivery: Boolean
         name: String
         origins: [{"hostheadervalue": String, "origin": String, "hostheadertype": String, "rules": [{"name": String, "request_url": String}, {"name": String, "request_url": String}, ...], "port": Integer, "ssl": Boolean}, {"hostheadervalue": String, "origin": String, "hostheadertype": String, "rules": [{"name": String, "request_url": String}, {"name": String, "request_url": String}, ...], "port": Integer, "ssl": Boolean}, ...]
         restrictions: [{"rules": [{"name": String, "client_ip": String, "referrer": String, "request_url": String}, {"name": String, "client_ip": String, "referrer": String, "request_url": String}, ...], "name": String, "access": String}, {"rules": [{"name": String, "client_ip": String, "referrer": String, "request_url": String}, {"name": String, "client_ip": String, "referrer": String, "request_url": String}, ...], "name": String, "access": String}, ...]


Rackspace::Cloud::ChefSolo
==========================


Required Properties
-------------------


host
~~~~

The host to run chef-solo on.

String value expected.

Updates cause replacement.


private_key
~~~~~~~~~~~

The ssh key to connect to the host with.

String value expected.

Updates cause replacement.


username
~~~~~~~~

The username to connect to the host with.

String value expected.

Updates cause replacement.

Defaults to "root".


Optional Properties
-------------------


Berksfile.lock
~~~~~~~~~~~~~~

The Berksfile.lock to use with berkshelf to specify cookbook versions
for the chef run.

String value expected.

Updates cause replacement.


chef_version
~~~~~~~~~~~~

The version of chef to install on the host.

String value expected.

Updates cause replacement.


clients
~~~~~~~

Clients to be written to the kitchen for the chef run.

Map value expected.

Updates cause replacement.


data_bags
~~~~~~~~~

Data_bags to write to the kitchen during the chef run.

Map value expected.

Updates cause replacement.


environments
~~~~~~~~~~~~

Environments to be written to the kitchen for the chef run.

Map value expected.

Updates cause replacement.


kitchen
~~~~~~~

A git url to the kitchen to clone. This can be used in place of a
Berks or Chef file to install cookbooks on the host.

String value expected.

Updates cause replacement.


node
~~~~

The node file for the chef run. May have a run_list, attributes, etc.

Map value expected.

Updates cause replacement.


roles
~~~~~

Roles to be written to the kitchen for the chef run.

Map value expected.

Updates cause replacement.


users
~~~~~

Users to be written to the kitchen for the chef run.

Map value expected.

Updates cause replacement.


Berksfile
~~~~~~~~~

Note: DEPRECATED - Use property kitchen.

The Berksfile to use with berkshelf to download cookbooks on the host
for the chef run.

String value expected.

Updates cause replacement.


Cheffile
~~~~~~~~

Note: DEPRECATED - Use property kitchen.

The Cheffile to use with librarian-chef to download cookbooks on the
host for the chef run.

String value expected.

Updates cause replacement.


Attributes
----------


show
~~~~

Detailed information about resource.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: Rackspace::Cloud::ChefSolo
       properties:
         Berksfile.lock: String
         chef_version: String
         clients: {...}
         data_bags: {...}
         environments: {...}
         host: String
         kitchen: String
         node: {...}
         private_key: String
         roles: {...}
         username: String
         users: {...}


Rackspace::Cloud::CloudFilesCDN
===============================

This resource enables the Rackspace CDN extensions for Swift
(Rackspace Cloud Files) on a given container (OS::Swift::Container).

A CDN-enabled container is a public container that is served by the
Akamai content delivery network. The files in a CDN-enabled container
are publicly accessible and do not require an authentication token for
read access. However, uploading content into a CDN-enabled container
is a secure operation and does require a valid authentication token.
(Private containers are not CDN-enabled and the files in a private
container are not publicly accessible.)

The resource ref for this resource will be the CDN access URI for the
specified container. Other URI's (streaming, etc) are accessed via the
resource attributes.


Required Properties
-------------------


container
~~~~~~~~~

Target container to enable CDN for.

String value expected.

Updates cause replacement.


Optional Properties
-------------------


ttl
~~~

Specifies the Time To Live (TTL) in seconds for an object to be cached
in the CDN.

Integer value expected.

Updates cause replacement.

Defaults to "259200".

The value must be in the range 900 to 31536000.


Attributes
----------


cdn_uri
~~~~~~~

The URI for downloading the object over HTTP. This URI can be combined
with any object name within the container to form the publicly
accessible URI for that object for distribution over a CDN system.


ios_uri
~~~~~~~

The URI for video streaming that uses HTTP Live Streaming from Apple.


show
~~~~

Detailed information about resource.


ssl_uri
~~~~~~~

The URI for downloading the object over HTTPS, using SSL.


streaming_uri
~~~~~~~~~~~~~

The URI for video streaming that uses HTTP Dynamic Streaming from
Adobe.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: Rackspace::Cloud::CloudFilesCDN
       properties:
         container: String
         ttl: Integer


Rackspace::Cloud::DNS
=====================

Represents a DNS resource.


Required Properties
-------------------


emailAddress
~~~~~~~~~~~~

Email address to use for contacting the domain administrator.

String value expected.

Can be updated without replacement.


name
~~~~

Specifies the name for the domain or subdomain. Must be a valid domain
name.

String value expected.

Updates cause replacement.

The length must be at least 3.


Optional Properties
-------------------


comment
~~~~~~~

Optional free form text comment

String value expected.

Can be updated without replacement.

The length must be no greater than 160.


records
~~~~~~~

Domain records

List value expected.

Can be updated without replacement.

*List contents:*


records.*
~~~~~~~~~

Map value expected.

Can be updated without replacement.

*Map properties:*


records.*.comment
~~~~~~~~~~~~~~~~~

Optional free form text comment

String value expected.

Can be updated without replacement.

The length must be no greater than 160.


records.*.data
~~~~~~~~~~~~~~

Type specific record data

String value expected.

Can be updated without replacement.


records.*.name
~~~~~~~~~~~~~~

Specifies the name for the domain or subdomain. Must be a valid domain
name.

String value expected.

Can be updated without replacement.

The length must be at least 3.


records.*.priority
~~~~~~~~~~~~~~~~~~

Required for MX and SRV records, but forbidden for other record types.
If specified, must be an integer from 0 to 65535.

Integer value expected.

Can be updated without replacement.

The value must be in the range 0 to 65535.


records.*.ttl
~~~~~~~~~~~~~

How long other servers should cache recorddata.

Integer value expected.

Can be updated without replacement.

Defaults to "3600".

The value must be at least 300.


records.*.type
~~~~~~~~~~~~~~

Specifies the record type.

String value expected.

Can be updated without replacement.

Allowed values: A, AAAA, NS, MX, CNAME, TXT, SRV


ttl
~~~

How long other servers should cache recorddata.

Integer value expected.

Can be updated without replacement.

Defaults to "3600".

The value must be at least 300.


Attributes
----------


show
~~~~

Detailed information about resource.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: Rackspace::Cloud::DNS
       properties:
         comment: String
         emailAddress: String
         name: String
         records: [{"data": String, "priority": Integer, "name": String, "comment": String, "ttl": Integer, "type": String}, {"data": String, "priority": Integer, "name": String, "comment": String, "ttl": Integer, "type": String}, ...]
         ttl: Integer


Rackspace::Cloud::LBNode
========================

Represents a single node of a Rackspace Cloud Load Balancer


Required Properties
-------------------


address
~~~~~~~

IP address for the node.

String value expected.

Updates cause replacement.


load_balancer
~~~~~~~~~~~~~

The ID of the load balancer to associate the node with.

String value expected.

Updates cause replacement.


port
~~~~

Integer value expected.

Updates cause replacement.


Optional Properties
-------------------


condition
~~~~~~~~~

String value expected.

Can be updated without replacement.

Defaults to "ENABLED".

Allowed values: ENABLED, DISABLED, DRAINING


draining_timeout
~~~~~~~~~~~~~~~~

The time to wait, in seconds, for the node to drain before it is
deleted.

Integer value expected.

Can be updated without replacement.

Defaults to "0".

The value must be at least 0.


type
~~~~

String value expected.

Can be updated without replacement.

Allowed values: PRIMARY, SECONDARY


weight
~~~~~~

Number value expected.

Can be updated without replacement.

The value must be in the range 1 to 100.


Attributes
----------


show
~~~~

Detailed information about resource.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: Rackspace::Cloud::LBNode
       properties:
         address: String
         condition: String
         draining_timeout: Integer
         load_balancer: String
         port: Integer
         type: String
         weight: Number


Rackspace::Cloud::LoadBalancer
==============================

Represents a Rackspace Cloud Loadbalancer.


Required Properties
-------------------


nodes
~~~~~

List value expected.

Can be updated without replacement.

*List contents:*


nodes.*
~~~~~~~

Map value expected.

Can be updated without replacement.

*Map properties:*


nodes.*.addresses
~~~~~~~~~~~~~~~~~

IP addresses for the load balancer node. Must have at least one
address.

List value expected.

Can be updated without replacement.

*List contents:*


nodes.*.addresses.*
~~~~~~~~~~~~~~~~~~~

String value expected.

Can be updated without replacement.


nodes.*.condition
~~~~~~~~~~~~~~~~~

String value expected.

Can be updated without replacement.

Defaults to "ENABLED".

Allowed values: ENABLED, DISABLED, DRAINING


nodes.*.port
~~~~~~~~~~~~

Integer value expected.

Can be updated without replacement.


nodes.*.type
~~~~~~~~~~~~

String value expected.

Can be updated without replacement.

Defaults to "PRIMARY".

Allowed values: PRIMARY, SECONDARY


nodes.*.weight
~~~~~~~~~~~~~~

Number value expected.

Can be updated without replacement.

Defaults to "1".

The value must be in the range 1 to 100.


port
~~~~

Integer value expected.

Can be updated without replacement.


protocol
~~~~~~~~

String value expected.

Can be updated without replacement.

Allowed values: DNS_TCP, DNS_UDP, FTP, HTTP, HTTPS, IMAPS, IMAPv4,
LDAP, LDAPS, MYSQL, POP3, POP3S, SMTP, TCP, TCP_CLIENT_FIRST, UDP,
UDP_STREAM, SFTP


virtualIps
~~~~~~~~~~

List value expected.

Updates cause replacement.

The length must be at least 1.

*List contents:*


virtualIps.*
~~~~~~~~~~~~

Map value expected.

Updates cause replacement.

*Map properties:*


virtualIps.*.id
~~~~~~~~~~~~~~~

ID of a shared VIP to use instead of creating a new one. This property
cannot be specified if type or version is specified.

Number value expected.

Updates cause replacement.


virtualIps.*.ipVersion
~~~~~~~~~~~~~~~~~~~~~~

IP version of the VIP. This property cannot be specified if 'id' is
specified. This property must be specified if id is not specified.

String value expected.

Updates cause replacement.

Allowed values: IPV6, IPV4


virtualIps.*.type
~~~~~~~~~~~~~~~~~

The type of VIP (public or internal). This property cannot be
specified if 'id' is specified. This property must be specified if id
is not specified.

String value expected.

Updates cause replacement.

Allowed values: SERVICENET, PUBLIC


Optional Properties
-------------------


accessList
~~~~~~~~~~

List value expected.

Updates cause replacement.

*List contents:*


accessList.*
~~~~~~~~~~~~

Map value expected.

Updates cause replacement.

*Map properties:*


accessList.*.address
~~~~~~~~~~~~~~~~~~~~

String value expected.

Updates cause replacement.


accessList.*.type
~~~~~~~~~~~~~~~~~

String value expected.

Updates cause replacement.

Allowed values: ALLOW, DENY


algorithm
~~~~~~~~~

String value expected.

Can be updated without replacement.

Allowed values: LEAST_CONNECTIONS, RANDOM, ROUND_ROBIN,
WEIGHTED_LEAST_CONNECTIONS, WEIGHTED_ROUND_ROBIN


connectionLogging
~~~~~~~~~~~~~~~~~

Boolean value expected.

Can be updated without replacement.


connectionThrottle
~~~~~~~~~~~~~~~~~~

Map value expected.

Can be updated without replacement.

*Map properties:*


connectionThrottle.maxConnectionRate
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Number value expected.

Can be updated without replacement.

The value must be in the range 0 to 100000.


connectionThrottle.maxConnections
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Integer value expected.

Can be updated without replacement.

The value must be in the range 1 to 100000.


connectionThrottle.minConnections
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Integer value expected.

Can be updated without replacement.

The value must be in the range 1 to 1000.


connectionThrottle.rateInterval
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Number value expected.

Can be updated without replacement.

The value must be in the range 1 to 3600.


contentCaching
~~~~~~~~~~~~~~

String value expected.

Can be updated without replacement.

Allowed values: ENABLED, DISABLED


errorPage
~~~~~~~~~

String value expected.

Can be updated without replacement.


halfClosed
~~~~~~~~~~

Boolean value expected.

Can be updated without replacement.


healthMonitor
~~~~~~~~~~~~~

Map value expected.

Can be updated without replacement.

*Map properties:*


healthMonitor.attemptsBeforeDeactivation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Number value expected.

Can be updated without replacement.

The value must be in the range 1 to 10.


healthMonitor.bodyRegex
~~~~~~~~~~~~~~~~~~~~~~~

String value expected.

Can be updated without replacement.


healthMonitor.delay
~~~~~~~~~~~~~~~~~~~

Number value expected.

Can be updated without replacement.

The value must be in the range 1 to 3600.


healthMonitor.hostHeader
~~~~~~~~~~~~~~~~~~~~~~~~

String value expected.

Can be updated without replacement.


healthMonitor.path
~~~~~~~~~~~~~~~~~~

String value expected.

Can be updated without replacement.


healthMonitor.statusRegex
~~~~~~~~~~~~~~~~~~~~~~~~~

String value expected.

Can be updated without replacement.


healthMonitor.timeout
~~~~~~~~~~~~~~~~~~~~~

Number value expected.

Can be updated without replacement.

The value must be in the range 1 to 300.


healthMonitor.type
~~~~~~~~~~~~~~~~~~

String value expected.

Can be updated without replacement.

Allowed values: CONNECT, HTTP, HTTPS


httpsRedirect
~~~~~~~~~~~~~

Note: Available since 2015.1 (Kilo)

Enables or disables HTTP to HTTPS redirection for the load balancer.
When enabled, any HTTP request returns status code 301 (Moved
Permanently), and the requester is redirected to the requested URL via
the HTTPS protocol on port 443. Only available for HTTPS protocol
(port=443), or HTTP protocol with a properly configured SSL
termination (secureTrafficOnly=true, securePort=443).

Boolean value expected.

Can be updated without replacement.

Defaults to "False".


metadata
~~~~~~~~

Map value expected.

Can be updated without replacement.


name
~~~~

String value expected.

Can be updated without replacement.


sessionPersistence
~~~~~~~~~~~~~~~~~~

String value expected.

Can be updated without replacement.

Allowed values: HTTP_COOKIE, SOURCE_IP


sslTermination
~~~~~~~~~~~~~~

Map value expected.

Can be updated without replacement.

*Map properties:*


sslTermination.certificate
~~~~~~~~~~~~~~~~~~~~~~~~~~

String value expected.

Can be updated without replacement.


sslTermination.intermediateCertificate
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

String value expected.

Can be updated without replacement.


sslTermination.privatekey
~~~~~~~~~~~~~~~~~~~~~~~~~

String value expected.

Can be updated without replacement.


sslTermination.securePort
~~~~~~~~~~~~~~~~~~~~~~~~~

Integer value expected.

Can be updated without replacement.

Defaults to "443".


sslTermination.secureTrafficOnly
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Boolean value expected.

Can be updated without replacement.

Defaults to "False".


timeout
~~~~~~~

Number value expected.

Can be updated without replacement.

The value must be in the range 1 to 120.


Attributes
----------


PublicIp
~~~~~~~~

Public IP address of the specified instance.


show
~~~~

Detailed information about resource.


virtualIps
~~~~~~~~~~

A list of assigned virtual ip addresses


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: Rackspace::Cloud::LoadBalancer
       properties:
         accessList: [{"address": String, "type": String}, {"address": String, "type": String}, ...]
         algorithm: String
         connectionLogging: Boolean
         connectionThrottle: {"maxConnectionRate": Number, "rateInterval": Number, "maxConnections": Integer, "minConnections": Integer}
         contentCaching: String
         errorPage: String
         halfClosed: Boolean
         healthMonitor: {"path": String, "bodyRegex": String, "statusRegex": String, "delay": Number, "timeout": Number, "type": String, "hostHeader": String, "attemptsBeforeDeactivation": Number}
         httpsRedirect: Boolean
         metadata: {...}
         name: String
         nodes: [{"weight": Number, "port": Integer, "type": String, "addresses": [String, String, ...], "condition": String}, {"weight": Number, "port": Integer, "type": String, "addresses": [String, String, ...], "condition": String}, ...]
         port: Integer
         protocol: String
         sessionPersistence: String
         sslTermination: {"intermediateCertificate": String, "privatekey": String, "secureTrafficOnly": Boolean, "certificate": String, "securePort": Integer}
         timeout: Number
         virtualIps: [{"ipVersion": String, "id": Number, "type": String}, {"ipVersion": String, "id": Number, "type": String}, ...]


Rackspace::Cloud::SharedIP
==========================

Note: Available since 2015.1 (Kilo)

Rackspace shared IP resource.


Required Properties
-------------------


ports
~~~~~

Provide list of ports that share an IP.

List value expected.

Updates cause replacement.

*List contents:*


ports.*
~~~~~~~

Port ID.

String value expected.

Updates cause replacement.


Optional Properties
-------------------


network_id
~~~~~~~~~~

ID of network to create shared_ip.

String value expected.

Updates cause replacement.

Value must be of type neutron.network


Attributes
----------


shared_ip_address
~~~~~~~~~~~~~~~~~

Shared IP address.


show
~~~~

Detailed information about resource.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: Rackspace::Cloud::SharedIP
       properties:
         network_id: String
         ports: [String, String, ...]


Rackspace::Cloud::WinServer
===========================

Rackspace cloud Windows server resource.


Required Properties
-------------------


flavor
~~~~~~

The ID or name of the flavor to boot onto.

String value expected.

Can be updated without replacement.

Value must be of type nova.flavor


Optional Properties
-------------------


admin_pass
~~~~~~~~~~

The administrator password for the server.

String value expected.

Can be updated without replacement.


availability_zone
~~~~~~~~~~~~~~~~~

Name of the availability zone for server placement.

String value expected.

Updates cause replacement.


block_device_mapping
~~~~~~~~~~~~~~~~~~~~

Block device mappings for this server.

List value expected.

Updates cause replacement.

*List contents:*


block_device_mapping.*
~~~~~~~~~~~~~~~~~~~~~~

Map value expected.

Updates cause replacement.

*Map properties:*


block_device_mapping.*.delete_on_termination
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Indicate whether the volume should be deleted when the server is
terminated.

Boolean value expected.

Updates cause replacement.


block_device_mapping.*.device_name
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A device name where the volume will be attached in the system at
/dev/device_name. This value is typically vda.

String value expected.

Updates cause replacement.


block_device_mapping.*.snapshot_id
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The ID of the snapshot to create a volume from.

String value expected.

Updates cause replacement.

Value must be of type cinder.snapshot


block_device_mapping.*.volume_id
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The ID of the volume to boot from. Only one of volume_id or
snapshot_id should be provided.

String value expected.

Updates cause replacement.

Value must be of type cinder.volume


block_device_mapping.*.volume_size
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The size of the volume, in GB. It is safe to leave this blank and have
the Compute service infer the size.

Integer value expected.

Updates cause replacement.


block_device_mapping_v2
~~~~~~~~~~~~~~~~~~~~~~~

Note: Available since 2015.1 (Kilo)

Block device mappings v2 for this server.

List value expected.

Updates cause replacement.

*List contents:*


block_device_mapping_v2.*
~~~~~~~~~~~~~~~~~~~~~~~~~

Map value expected.

Updates cause replacement.

*Map properties:*


block_device_mapping_v2.*.boot_index
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Integer used for ordering the boot disks.

Integer value expected.

Updates cause replacement.


block_device_mapping_v2.*.delete_on_termination
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Indicate whether the volume should be deleted when the server is
terminated.

Boolean value expected.

Updates cause replacement.


block_device_mapping_v2.*.device_name
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A device name where the volume will be attached in the system at
/dev/device_name. This value is typically vda.

String value expected.

Updates cause replacement.


block_device_mapping_v2.*.device_type
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Device type: at the moment we can make distinction only between disk
and cdrom.

String value expected.

Updates cause replacement.

Allowed values: cdrom, disk


block_device_mapping_v2.*.disk_bus
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Bus of the device: hypervisor driver chooses a suitable default if
omitted.

String value expected.

Updates cause replacement.

Allowed values: ide, lame_bus, scsi, usb, virtio


block_device_mapping_v2.*.image
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Note: Available since 7.0.0 (Newton)

The ID or name of the image to create a volume from.

String value expected.

Updates cause replacement.

Value must be of type glance.image


block_device_mapping_v2.*.snapshot_id
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The ID of the snapshot to create a volume from.

String value expected.

Updates cause replacement.

Value must be of type cinder.snapshot


block_device_mapping_v2.*.swap_size
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The size of the swap, in MB.

Integer value expected.

Updates cause replacement.


block_device_mapping_v2.*.volume_id
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The volume_id can be boot or non-boot device to the server.

String value expected.

Updates cause replacement.

Value must be of type cinder.volume


block_device_mapping_v2.*.volume_size
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Size of the block device in GB. If it is omitted, hypervisor driver
calculates size.

Integer value expected.

Updates cause replacement.


block_device_mapping_v2.*.image_id
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Note: DEPRECATED since 7.0.0 (Newton) - Use property image.

Note: Available since 5.0.0 (Liberty)

The ID of the image to create a volume from.

String value expected.

Updates cause replacement.

Value must be of type glance.image


config_drive
~~~~~~~~~~~~

If True, enable config drive on the server.

Boolean value expected.

Updates cause replacement.


diskConfig
~~~~~~~~~~

Control how the disk is partitioned when the server is created.

String value expected.

Updates cause replacement.

Allowed values: AUTO, MANUAL


flavor_update_policy
~~~~~~~~~~~~~~~~~~~~

Policy on how to apply a flavor update; either by requesting a server
resize or by replacing the entire server.

String value expected.

Can be updated without replacement.

Defaults to "RESIZE".

Allowed values: RESIZE, REPLACE


image
~~~~~

The ID or name of the image to boot with.

String value expected.

Can be updated without replacement.

Value must be of type glance.image


image_update_policy
~~~~~~~~~~~~~~~~~~~

Policy on how to apply an image-id update; either by requesting a
server rebuild or by replacing the entire server.

String value expected.

Can be updated without replacement.

Defaults to "REBUILD".

Allowed values: REBUILD, REPLACE, REBUILD_PRESERVE_EPHEMERAL


key_name
~~~~~~~~

Name of keypair to inject into the server.

String value expected.

Updates cause replacement.

Value must be of type nova.keypair


metadata
~~~~~~~~

Arbitrary key/value metadata to store for this server. Both keys and
values must be 255 characters or less. Non-string values will be
serialized to JSON (and the serialized string must be 255 characters
or less).

Map value expected.

Can be updated without replacement.


name
~~~~

Server name.

String value expected.

Can be updated without replacement.


networks
~~~~~~~~

An ordered list of nics to be added to this server, with information
about connected networks, fixed ips, port etc.

List value expected.

Can be updated without replacement.

*List contents:*


networks.*
~~~~~~~~~~

Map value expected.

Can be updated without replacement.

*Map properties:*


networks.*.fixed_ip
~~~~~~~~~~~~~~~~~~~

Fixed IP address to specify for the port created on the requested
network.

String value expected.

Can be updated without replacement.

Value must be of type ip_addr


networks.*.floating_ip
~~~~~~~~~~~~~~~~~~~~~~

Note: Available since 6.0.0 (Mitaka)

ID of the floating IP to associate.

String value expected.

Can be updated without replacement.


networks.*.network
~~~~~~~~~~~~~~~~~~

Name or ID of network to create a port on.

String value expected.

Can be updated without replacement.

Value must be of type neutron.network


networks.*.port
~~~~~~~~~~~~~~~

ID of an existing port to associate with this server.

String value expected.

Can be updated without replacement.

Value must be of type neutron.port


networks.*.port_extra_properties
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Note: Available since 6.0.0 (Mitaka)

Dict, which has expand properties for port. Used only if port property
is not specified for creating port.

Map value expected.

Can be updated without replacement.

*Map properties:*


networks.*.port_extra_properties.admin_state_up
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The administrative state of this port.

Boolean value expected.

Can be updated without replacement.

Defaults to "True".


networks.*.port_extra_properties.allowed_address_pairs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Additional MAC/IP address pairs allowed to pass through the port.

List value expected.

Can be updated without replacement.

*List contents:*


networks.*.port_extra_properties.allowed_address_pairs.*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Map value expected.

Can be updated without replacement.

*Map properties:*


networks.*.port_extra_properties.allowed_address_pairs.*.ip_address
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

IP address to allow through this port.

String value expected.

Can be updated without replacement.

Value must be of type net_cidr


networks.*.port_extra_properties.allowed_address_pairs.*.mac_address
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

MAC address to allow through this port.

String value expected.

Can be updated without replacement.

Value must be of type mac_addr


networks.*.port_extra_properties.binding:vnic_type
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Note: Available since 2015.1 (Kilo)

The vnic type to be bound on the neutron port. To support SR-IOV PCI
passthrough networking, you can request that the neutron port to be
realized as normal (virtual nic), direct (pci passthrough), or macvtap
(virtual interface with a tap-like software interface). Note that this
only works for Neutron deployments that support the bindings
extension.

String value expected.

Can be updated without replacement.

Allowed values: normal, direct, macvtap


networks.*.port_extra_properties.mac_address
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

MAC address to give to this port.

String value expected.

Can be updated without replacement.

Value must be of type mac_addr


networks.*.port_extra_properties.port_security_enabled
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Note: Available since 5.0.0 (Liberty)

Flag to enable/disable port security on the port. When disable this
feature(set it to False), there will be no packages filtering, like
security-group and address-pairs.

Boolean value expected.

Can be updated without replacement.


networks.*.port_extra_properties.qos_policy
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Note: Available since 6.0.0 (Mitaka)

The name or ID of QoS policy to attach to this port.

String value expected.

Can be updated without replacement.

Value must be of type neutron.qos_policy


networks.*.port_extra_properties.value_specs
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Extra parameters to include in the request.

Map value expected.

Can be updated without replacement.

Defaults to "{}".


networks.*.subnet
~~~~~~~~~~~~~~~~~

Note: Available since 5.0.0 (Liberty)

Subnet in which to allocate the IP address for port. Used for creating
port, based on derived properties. If subnet is specified, network
property becomes optional.

String value expected.

Can be updated without replacement.


personality
~~~~~~~~~~~

A map of files to create/overwrite on the server upon boot. Keys are
file names and values are the file contents.

Map value expected.

Updates cause replacement.

Defaults to "{}".


reservation_id
~~~~~~~~~~~~~~

A UUID for the set of servers being requested.

String value expected.

Updates cause replacement.


save_admin_pass
~~~~~~~~~~~~~~~

True if the system should remember the admin password; False
otherwise.

Boolean value expected.

Updates cause replacement.

Defaults to "False".


scheduler_hints
~~~~~~~~~~~~~~~

Arbitrary key-value pairs specified by the client to help boot a
server.

Map value expected.

Updates cause replacement.


security_groups
~~~~~~~~~~~~~~~

List of security group names or IDs. Cannot be used if neutron ports
are associated with this server; assign security groups to the ports
instead.

List value expected.

Updates cause replacement.

Defaults to "[]".


software_config_transport
~~~~~~~~~~~~~~~~~~~~~~~~~

How the server should receive the metadata required for software
configuration. POLL_SERVER_CFN will allow calls to the cfn API action
DescribeStackResource authenticated with the provided keypair.
POLL_SERVER_HEAT will allow calls to the Heat API resource-show using
the provided keystone credentials. POLL_TEMP_URL will create and
populate a Swift TempURL with metadata for polling. ZAQAR_MESSAGE will
create a dedicated zaqar queue and post the metadata for polling.

String value expected.

Can be updated without replacement.

Defaults to "POLL_SERVER_CFN".

Allowed values: POLL_SERVER_CFN, POLL_SERVER_HEAT, POLL_TEMP_URL,
ZAQAR_MESSAGE


user_data
~~~~~~~~~

User data script to be executed by cloud-init.

String value expected.

Can be updated without replacement.

Defaults to "".


user_data_format
~~~~~~~~~~~~~~~~

How the user_data should be formatted for the server. For
HEAT_CFNTOOLS, the user_data is bundled as part of the heat-cfntools
cloud-init boot configuration data. For RAW the user_data is passed to
Nova unmodified. For SOFTWARE_CONFIG user_data is bundled as part of
the software config data, and metadata is derived from any associated
SoftwareDeployment resources.

String value expected.

Updates cause replacement.

Defaults to "HEAT_CFNTOOLS".

Allowed values: HEAT_CFNTOOLS, RAW, SOFTWARE_CONFIG


user_data_update_policy
~~~~~~~~~~~~~~~~~~~~~~~

Note: Available since 6.0.0 (Mitaka)

Policy on how to apply a user_data update; either by ignoring it or by
replacing the entire server.

String value expected.

Can be updated without replacement.

Defaults to "REPLACE".

Allowed values: REPLACE, IGNORE


Attributes
----------


accessIPv4
~~~~~~~~~~

The manually assigned alternative public IPv4 address of the server.


accessIPv6
~~~~~~~~~~

The manually assigned alternative public IPv6 address of the server.


addresses
~~~~~~~~~

A dict of all network addresses with corresponding port_id. Each
network will have two keys in dict, they are network name and network
id. The port ID may be obtained through the following expression:
"{get_attr: [<server>, addresses, <network name_or_id>, 0, port]}".


admin_pass
~~~~~~~~~~

The administrator password for the server.


console_urls
~~~~~~~~~~~~

Note: Available since 2015.1 (Kilo)

URLs of server's consoles. To get a specific console type, the
requested type can be specified as parameter to the get_attr function,
e.g. get_attr: [ <server>, console_urls, novnc ]. Currently supported
types are novnc, xvpvnc, spice-html5, rdp-html5, serial.


instance_name
~~~~~~~~~~~~~

AWS compatible instance name.


name
~~~~

Name of the server.


networks
~~~~~~~~

A dict of assigned network addresses of the form: {"public": [ip1,
ip2...], "private": [ip3, ip4], "public_uuid": [ip1, ip2...],
"private_uuid": [ip3, ip4]}. Each network will have two keys in dict,
they are network name and network id.


privateIPv4
~~~~~~~~~~~

The private IPv4 address of the server.


show
~~~~

Detailed information about resource.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: Rackspace::Cloud::WinServer
       properties:
         admin_pass: String
         availability_zone: String
         block_device_mapping: [{"volume_size": Integer, "device_name": String, "delete_on_termination": Boolean, "volume_id": String, "snapshot_id": String}, {"volume_size": Integer, "device_name": String, "delete_on_termination": Boolean, "volume_id": String, "snapshot_id": String}, ...]
         block_device_mapping_v2: [{"device_type": String, "delete_on_termination": Boolean, "boot_index": Integer, "image_id": String, "swap_size": Integer, "image": String, "volume_id": String, "snapshot_id": String, "volume_size": Integer, "disk_bus": String, "device_name": String}, {"device_type": String, "delete_on_termination": Boolean, "boot_index": Integer, "image_id": String, "swap_size": Integer, "image": String, "volume_id": String, "snapshot_id": String, "volume_size": Integer, "disk_bus": String, "device_name": String}, ...]
         config_drive: Boolean
         diskConfig: String
         flavor: String
         flavor_update_policy: String
         image: String
         image_update_policy: String
         key_name: String
         metadata: {...}
         name: String
         networks: [{"fixed_ip": String, "port_extra_properties": {"mac_address": String, "port_security_enabled": Boolean, "value_specs": {...}, "binding:vnic_type": String, "qos_policy": String, "admin_state_up": Boolean, "allowed_address_pairs": [{"ip_address": String, "mac_address": String}, {"ip_address": String, "mac_address": String}, ...]}, "floating_ip": String, "port": String, "network": String, "uuid": String, "subnet": String}, {"fixed_ip": String, "port_extra_properties": {"mac_address": String, "port_security_enabled": Boolean, "value_specs": {...}, "binding:vnic_type": String, "qos_policy": String, "admin_state_up": Boolean, "allowed_address_pairs": [{"ip_address": String, "mac_address": String}, {"ip_address": String, "mac_address": String}, ...]}, "floating_ip": String, "port": String, "network": String, "uuid": String, "subnet": String}, ...]
         personality: {...}
         reservation_id: String
         save_admin_pass: Boolean
         scheduler_hints: {...}
         security_groups: [Value, Value, ...]
         software_config_transport: String
         user_data: String
         user_data_format: String
         user_data_update_policy: String


Rackspace::CloudDatabase::HAInstance
====================================

High Availability for Cloud Databases means that Cloud Database users
can run their critical production workloads without worrying about
their database becoming unavailable. When using Cloud Databases High
Availability instance group, users can choose to add one or a maximum
of two replicas to the source database instance. When you use a High
Availability instance group, it ensures that in case the master
becomes unavailable, an automatic failover to the replicas is
initiated within 10-30 seconds of downtime.


Required Properties
-------------------


datastore
~~~~~~~~~

The type of datastore to use

String value expected.

Updates cause replacement.

Allowed values: MYSQL, Percona, MariaDB


name
~~~~

Specifies the name of the HA instance

String value expected.

Updates cause replacement.

The length must be in the range 1 to 255.


replica_source
~~~~~~~~~~~~~~

The name, flavorRef, and volume of the replica source (primary)
instance.

Map value expected.

Can be updated without replacement.

*Map properties:*


replica_source.flavorRef
~~~~~~~~~~~~~~~~~~~~~~~~

Reference to a flavor for creating the instance.

String value expected.

Can be updated without replacement.

Value must be of type trove.flavor


replica_source.name
~~~~~~~~~~~~~~~~~~~

The name of the instance

String value expected.

Can be updated without replacement.

The length must be in the range 1 to 255.


replica_source.volume_size
~~~~~~~~~~~~~~~~~~~~~~~~~~

The volume size of the instance in gigabytes (GB)

Integer value expected.

Can be updated without replacement.

The value must be in the range 1 to 300.


replicas
~~~~~~~~

The name, flavorRef, and volume of the replicas.

List value expected.

Can be updated without replacement.

The length must be in the range 1 to 2.

*List contents:*


replicas.*
~~~~~~~~~~

Map value expected.

Can be updated without replacement.

*Map properties:*


replicas.*.flavorRef
~~~~~~~~~~~~~~~~~~~~

Reference to a flavor for creating the instance.

String value expected.

Can be updated without replacement.

Value must be of type trove.flavor


replicas.*.name
~~~~~~~~~~~~~~~

The name of the instance

String value expected.

Can be updated without replacement.

The length must be in the range 1 to 255.


replicas.*.volume_size
~~~~~~~~~~~~~~~~~~~~~~

The volume size of the instance in gigabytes (GB)

Integer value expected.

Can be updated without replacement.

The value must be in the range 1 to 300.


Optional Properties
-------------------


acls
~~~~

List of IP based ACLs in the CIDR format. This is required to allow
the HA group access to the specified IP. By default, the HA group
access is blocked.

List value expected.

Can be updated without replacement.

*List contents:*


acls.*
~~~~~~

Map value expected.

Can be updated without replacement.

*Map properties:*


acls.*.address
~~~~~~~~~~~~~~

CIDR string

String value expected.

Can be updated without replacement.

Value must be of type net_cidr


networks
~~~~~~~~

List of networks to be associated with the HA group. By default (if
not specified), it will be ['servicenet']. If a public network would
be required in addition to the servicenet, it would have to be
specified.

List value expected.

Updates cause replacement.

*List contents:*


networks.*
~~~~~~~~~~

String value expected.

Updates cause replacement.


Attributes
----------


replica_instances
~~~~~~~~~~~~~~~~~

A map of instance names to IDs for the replica instances in the group.


show
~~~~

Detailed information about resource.


source_instance_id
~~~~~~~~~~~~~~~~~~

ID of the source instance


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: Rackspace::CloudDatabase::HAInstance
       properties:
         acls: [{"address": String}, {"address": String}, ...]
         datastore: String
         name: String
         networks: [String, String, ...]
         replica_source: {"name": String, "volume_size": Integer, "flavorRef": String}
         replicas: [{"name": String, "volume_size": Integer, "flavorRef": String}, {"name": String, "volume_size": Integer, "flavorRef": String}, ...]


Rackspace::CloudDatabase::ScheduledBackup
=========================================

Cloud Databases allows you to create a schedule for running a weekly
backup for your database instance. There is an incremental backup run
at the end of every day and a full backup is run on the day as defined
by the backup schedule. The backup can always be restored to a new
database instance.


Required Properties
-------------------


source
~~~~~~

The database or HA instance to back up.

Map value expected.

Updates cause replacement.

*Map properties:*


source.id
~~~~~~~~~

ID of the instance to backup.

String value expected.

Updates cause replacement.


source.type
~~~~~~~~~~~

The type of backup for the given source.

String value expected.

Updates cause replacement.

Defaults to "instance".

Allowed values: instance, ha


Optional Properties
-------------------


day_of_week
~~~~~~~~~~~

The day of the week to run the backup. Sunday is 0.

Integer value expected.

Can be updated without replacement.

Defaults to "0".

The value must be in the range 0 to 6.


full_backup_retention
~~~~~~~~~~~~~~~~~~~~~

The number of full automated backups to keep.

Integer value expected.

Can be updated without replacement.

Defaults to "2".

The value must be at least 0.


hour
~~~~

The hour of the day to run the backup. Midnight is 0.

Integer value expected.

Can be updated without replacement.

Defaults to "0".

The value must be in the range 0 to 23.


minute
~~~~~~

The minute of the hour to run the backup.

Integer value expected.

Can be updated without replacement.

Defaults to "0".

The value must be in the range 0 to 59.


Attributes
----------


last_scheduled
~~~~~~~~~~~~~~

Most recent date the backup was run


next_run
~~~~~~~~

The next date the backup will be run


show
~~~~

Detailed information about resource.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: Rackspace::CloudDatabase::ScheduledBackup
       properties:
         day_of_week: Integer
         full_backup_retention: Integer
         hour: Integer
         minute: Integer
         source: {"id": String, "type": String}


Rackspace::CloudMonitoring::AgentToken
======================================

Agent tokens are used to authenticate Monitoring agents to the
Monitoring Service. Multiple agents can share a single token.


Optional Properties
-------------------


label
~~~~~

A friendly label for this resource

String value expected.

Can be updated without replacement.

The length must be in the range 1 to 255.


Attributes
----------


show
~~~~

Detailed information about resource.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: Rackspace::CloudMonitoring::AgentToken
       properties:
         label: String


Rackspace::CloudMonitoring::Alarm
=================================

Alarms bind alerting rules, entities, and notification plans into a
logical unit. Alarms are responsible for determining a state (*OK*,
*WARNING* or *CRITICAL*) based on the result of a Check, and executing
a notification plan whenever that state changes. You create alerting
rules by using the alarm DSL. For information about using the alarm
language, refer to the reference documentation.

**Note** Criteria is optional. If you don't provide a criteria, the
state of your alarm depends entirely on the success or failure of the
check. This is a convenient shortcut for setting a simple alarm with a
notification plan. For example, if you set a ping check on a server,
it won't alert unless no pings are returned at all, whereas adding
criteria would enable the alert to trigger if the ping round trip time
went past a certain threshold.


Required Properties
-------------------


check
~~~~~

The check to alert on

String value expected.

Updates cause replacement.


plan
~~~~

The notification plan to execute when the state changes

String value expected.

Updates cause replacement.


Optional Properties
-------------------


criteria
~~~~~~~~

The alarm DSL for describing alerting conditions and their output
states

String value expected.

Can be updated without replacement.


disabled
~~~~~~~~

Disable processing and alerts on this alarm

Boolean value expected.

Can be updated without replacement.

Defaults to "False".


label
~~~~~

A friendly label for this resource

String value expected.

Can be updated without replacement.

The length must be in the range 1 to 255.


metadata
~~~~~~~~

Arbitrary key/value pairs that are passed during the alerting phase.
Both keys and values must be 255 characters or less. Non-string values
will be serialized to JSON (and the serialized string must be 255
characters or less).

Map value expected.

Can be updated without replacement.


Attributes
----------


show
~~~~

Detailed information about resource.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: Rackspace::CloudMonitoring::Alarm
       properties:
         check: String
         criteria: String
         disabled: Boolean
         label: String
         metadata: {...}
         plan: String


Rackspace::CloudMonitoring::Check
=================================

A check is one of the foundational building blocks of the monitoring
system. The check determines the parts or pieces of the entity that
you want to monitor, the monitoring frequency, how many monitoring
zones are originating the check, and so on.


Required Properties
-------------------


entity
~~~~~~

The id of the entity for which to create the check. This can either be
the id of a configured monitoring entity, a cloud server or a cloud
database instance.

String value expected.

Updates cause replacement.


type
~~~~

The specific type of resource

String value expected.

Updates cause replacement.

The length must be in the range 1 to 64.


Optional Properties
-------------------


details
~~~~~~~

A hash of type-specific details

Map value expected.

Updates cause replacement.

Defaults to "{}".


disabled
~~~~~~~~

Disables the check

Boolean value expected.

Can be updated without replacement.

Defaults to "False".


label
~~~~~

A friendly label for this resource

String value expected.

Can be updated without replacement.

The length must be in the range 1 to 255.


metadata
~~~~~~~~

Arbitrary key/value pairs that are passed during the alerting phase.
Both keys and values must be 255 characters or less. Non-string values
will be serialized to JSON (and the serialized string must be 255
characters or less).

Map value expected.

Can be updated without replacement.


monitoring_zones_poll
~~~~~~~~~~~~~~~~~~~~~

List of monitoring zones to poll from. Note: This argument is only
required for remote (non-agent) checks

List value expected.

Updates cause replacement.

*List contents:*


monitoring_zones_poll.*
~~~~~~~~~~~~~~~~~~~~~~~

String value expected.

Updates cause replacement.

Value must be of type monitoring.zone


period
~~~~~~

The period in seconds for a check. The value must be greater than the
minimum period set on your account.

Integer value expected.

Can be updated without replacement.

Defaults to "60".

The value must be in the range 30 to 1800.


target_alias
~~~~~~~~~~~~

A key in the entity's 'ip_addresses' hash used to resolve this check
to an IP address. This parameter is mutually exclusive with
target_hostname.

String value expected.

Updates cause replacement.

The length must be in the range 1 to 64.


target_hostname
~~~~~~~~~~~~~~~

The hostname this check should target. This parameter is mutually
exclusive with target_alias. Value must be a Valid FQDN, IPv4 or IPv6
address

String value expected.

Updates cause replacement.


target_receiver
~~~~~~~~~~~~~~~

Determines how to resolve the check target.

String value expected.

Updates cause replacement.

Defaults to "IPv4".

Allowed values: IPv4, IPv6


timeout
~~~~~~~

The timeout in seconds for a check. This has to be less than the
period.

Integer value expected.

Can be updated without replacement.

Defaults to "30".

The value must be in the range 2 to 1800.


Attributes
----------


show
~~~~

Detailed information about resource.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: Rackspace::CloudMonitoring::Check
       properties:
         details: {...}
         disabled: Boolean
         entity: String
         label: String
         metadata: {...}
         monitoring_zones_poll: [String, String, ...]
         period: Integer
         target_alias: String
         target_hostname: String
         target_receiver: String
         timeout: Integer
         type: String


Rackspace::CloudMonitoring::Entity
==================================

An entity is the target of what you are monitoring. For example, you
can create an entity to monitor your website, a particular web
service, or your Rackspace server or server instance. Note that an
entity represents only one item in the monitoring system. For example,
if you wanted to monitor each server in a cluster, you would create an
entity for each of the servers. You would not create a single entity
to represent the entire cluster.

An entity can have multiple checks associated with it. This allows you
to check multiple services on the same host by creating multiple
checks on the same entity, instead of multiple entities each with a
single check.


Optional Properties
-------------------


agent_id
~~~~~~~~

Agent to which this entity is bound

String value expected.

Can be updated without replacement.

Value must match pattern: [-\.\w]+

The length must be in the range 1 to 255.


ip_addresses
~~~~~~~~~~~~

IP addresses that can be referenced by checks on this entity. Keys
must be between 1 and 64 characters long. Values must be valid IPv4 or
IPv6 addresses.

Map value expected.

Updates cause replacement.


label
~~~~~

A friendly label for this resource

String value expected.

Can be updated without replacement.

The length must be in the range 1 to 255.


metadata
~~~~~~~~

Arbitrary key/value pairs that are passed during the alerting phase.
Both keys and values must be 255 characters or less. Non-string values
will be serialized to JSON (and the serialized string must be 255
characters or less).

Map value expected.

Can be updated without replacement.


Attributes
----------


show
~~~~

Detailed information about resource.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: Rackspace::CloudMonitoring::Entity
       properties:
         agent_id: String
         ip_addresses: {...}
         label: String
         metadata: {...}


Rackspace::CloudMonitoring::Notification
========================================

A notification is a destination to send an alarm, it can be a variety
of different types, and will evolve over time.

For instance, with a webhook type notification Rackspace Cloud
Monitoring posts JSON formatted data to a user-specified URL on an
alert condition (Check goes from *OK* -> *CRITICAL* and so on).


Required Properties
-------------------


type
~~~~

The specific type of resource

String value expected.

Updates cause replacement.

The length must be in the range 1 to 64.


Optional Properties
-------------------


details
~~~~~~~

A hash of type-specific details

Map value expected.

Updates cause replacement.

Defaults to "{}".


label
~~~~~

A friendly label for this resource

String value expected.

Can be updated without replacement.

The length must be in the range 1 to 255.


Attributes
----------


show
~~~~

Detailed information about resource.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: Rackspace::CloudMonitoring::Notification
       properties:
         details: {...}
         label: String
         type: String


Rackspace::CloudMonitoring::NotificationPlan
============================================

A notification plan contains a set of notification actions that
Rackspace Cloud Monitoring executes when triggered by an alarm.
Rackspace Cloud Monitoring currently supports webhook and email
notifications.

Each notification state can contain multiple notification actions. For
example, you can create a notification plan that hits a webhook/email
to notify your operations team if a warning occurs. However, if the
warning escalates to an Error, the notification plan could be
configured to hit a different webhook/email that triggers both email
and SMS messages to the operations team.


Optional Properties
-------------------


critical_state
~~~~~~~~~~~~~~

The notification list to send to when the state is CRITICAL.

List value expected.

Can be updated without replacement.


label
~~~~~

A friendly label for this resource

String value expected.

Can be updated without replacement.

The length must be in the range 1 to 255.


ok_state
~~~~~~~~

The notification list to send to when the state is OK.

List value expected.

Can be updated without replacement.


warning_state
~~~~~~~~~~~~~

The notification list to send to when the state is WARNING.

List value expected.

Can be updated without replacement.


Attributes
----------


show
~~~~

Detailed information about resource.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: Rackspace::CloudMonitoring::NotificationPlan
       properties:
         critical_state: [Value, Value, ...]
         label: String
         ok_state: [Value, Value, ...]
         warning_state: [Value, Value, ...]


Rackspace::CloudMonitoring::PlanNotifications
=============================================

Binds notifications to existing notification plans. This is useful for
cases (such as using monitoring with autoscale), when you need a plan
but must create the notifications dynamically later. Note that these
notifications will overwrite any of the same level created as part of
the NotificationPlan resource.


Required Properties
-------------------


plan
~~~~

The notification plan to add notifications to

String value expected.

Updates cause replacement.


Optional Properties
-------------------


critical_state
~~~~~~~~~~~~~~

The notification list to send to when the state is CRITICAL.

List value expected.

Can be updated without replacement.


ok_state
~~~~~~~~

The notification list to send to when the state is OK.

List value expected.

Can be updated without replacement.


warning_state
~~~~~~~~~~~~~

The notification list to send to when the state is WARNING.

List value expected.

Can be updated without replacement.


Attributes
----------


show
~~~~

Detailed information about resource.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: Rackspace::CloudMonitoring::PlanNotifications
       properties:
         critical_state: [Value, Value, ...]
         ok_state: [Value, Value, ...]
         plan: String
         warning_state: [Value, Value, ...]


Rackspace::Neutron::SecurityGroupAttachment
===========================================

Note: Available since 5.0.0 (Liberty)


Required Properties
-------------------


port
~~~~

The ID of the port to attach a security group.

String value expected.

Updates cause replacement.

Value must be of type neutron.port


security_group
~~~~~~~~~~~~~~

The ID of the security group to be attached.

String value expected.

Updates cause replacement.


Attributes
----------


show
~~~~

Detailed information about resource.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: Rackspace::Neutron::SecurityGroupAttachment
       properties:
         port: String
         security_group: String


Rackspace::RackConnect::PoolNode
================================

A resource for RackConnect LoadBalancerPool node.


Required Properties
-------------------


pool
~~~~

The id of the pool.

String value expected.

Updates cause replacement.

Value must be of type rackconnect.pool


server_id
~~~~~~~~~

The id of the server to be added.

String value expected.

Updates cause replacement.

Value must be of type nova.server


Attributes
----------


show
~~~~

Detailed information about resource.


virtual_ip
~~~~~~~~~~

Rackconnected loadbalancer virtual IP.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: Rackspace::RackConnect::PoolNode
       properties:
         pool: String
         server_id: String


Rackspace::RackConnect::PublicIP
================================

A resource for RackConnect public ips.


Required Properties
-------------------


server_id
~~~~~~~~~

The id of the server to be added.

String value expected.

Updates cause replacement.

Value must be of type nova.server


Attributes
----------


public_ip_v4
~~~~~~~~~~~~

Rackconnected server public IP.


show
~~~~

Detailed information about resource.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: Rackspace::RackConnect::PublicIP
       properties:
         server_id: String
