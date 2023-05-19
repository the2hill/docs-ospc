
OpenStack Resource Types
************************


OS::Aodh::Alarm
===============

A resource that implements alarming service of Aodh.

A resource that allows for the setting alarms based on threshold
evaluation for a collection of samples. Also, you can define actions
to take if state of watched resource will be satisfied specified
conditions. For example, it can watch for the memory consumption and
when it reaches 70% on a given instance if the instance has been up
for more than 10 min, some action will be called.


Required Properties
-------------------


meter_name
~~~~~~~~~~

Meter name watched by the alarm.

String value expected.

Updates cause replacement.


threshold
~~~~~~~~~

Threshold to evaluate against.

Number value expected.

Can be updated without replacement.


Optional Properties
-------------------


alarm_actions
~~~~~~~~~~~~~

A list of URLs (webhooks) to invoke when state transitions to alarm.

List value expected.

Can be updated without replacement.


comparison_operator
~~~~~~~~~~~~~~~~~~~

Operator used to compare specified statistic with threshold.

String value expected.

Can be updated without replacement.

Allowed values: ge, gt, eq, ne, lt, le


description
~~~~~~~~~~~

Description for the alarm.

String value expected.

Can be updated without replacement.


enabled
~~~~~~~

True if alarm evaluation/actioning is enabled.

Boolean value expected.

Can be updated without replacement.

Defaults to "true".


evaluation_periods
~~~~~~~~~~~~~~~~~~

Number of periods to evaluate over.

Integer value expected.

Can be updated without replacement.


insufficient_data_actions
~~~~~~~~~~~~~~~~~~~~~~~~~

A list of URLs (webhooks) to invoke when state transitions to
insufficient-data.

List value expected.

Can be updated without replacement.


matching_metadata
~~~~~~~~~~~~~~~~~

Meter should match this resource metadata (key=value) additionally to
the meter_name.

Map value expected.

Can be updated without replacement.

Defaults to "{}".


ok_actions
~~~~~~~~~~

A list of URLs (webhooks) to invoke when state transitions to ok.

List value expected.

Can be updated without replacement.


period
~~~~~~

Period (seconds) to evaluate over.

Integer value expected.

Can be updated without replacement.


query
~~~~~

Note: Available since 2015.1 (Kilo)

A list of query factors, each comparing a Sample attribute with a
value. Implicitly combined with matching_metadata, if any.

List value expected.

Can be updated without replacement.

*List contents:*


query.*
~~~~~~~

Map value expected.

Can be updated without replacement.

*Map properties:*


query.*.field
~~~~~~~~~~~~~

Name of attribute to compare. Names of the form
metadata.user_metadata.X or metadata.metering.X are equivalent to what
you can address through matching_metadata; the former for Nova meters,
the latter for all others. To see the attributes of your Samples, use
`ceilometer --debug sample-list`.

String value expected.

Can be updated without replacement.


query.*.op
~~~~~~~~~~

Comparison operator.

String value expected.

Can be updated without replacement.

Allowed values: le, ge, eq, lt, gt, ne


query.*.value
~~~~~~~~~~~~~

String value with which to compare.

String value expected.

Can be updated without replacement.


repeat_actions
~~~~~~~~~~~~~~

False to trigger actions when the threshold is reached AND the alarm's
state has changed. By default, actions are called each time the
threshold is reached.

Boolean value expected.

Can be updated without replacement.

Defaults to "true".


severity
~~~~~~~~

Note: Available since 5.0.0 (Liberty)

Severity of the alarm.

String value expected.

Can be updated without replacement.

Defaults to "low".

Allowed values: low, moderate, critical


statistic
~~~~~~~~~

Meter statistic to evaluate.

String value expected.

Can be updated without replacement.

Allowed values: count, avg, sum, min, max


time_constraints
~~~~~~~~~~~~~~~~

Note: Available since 5.0.0 (Liberty)

Describe time constraints for the alarm. Only evaluate the alarm if
the time at evaluation is within this time constraint. Start point(s)
of the constraint are specified with a cron expression, whereas its
duration is given in seconds.

List value expected.

Updates cause replacement.

Defaults to "[]".

*List contents:*


time_constraints.*
~~~~~~~~~~~~~~~~~~

Map value expected.

Updates cause replacement.

*Map properties:*


time_constraints.*.description
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Description for the time constraint.

String value expected.

Updates cause replacement.


time_constraints.*.duration
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Duration for the time constraint.

Integer value expected.

Updates cause replacement.

The value must be at least 0.


time_constraints.*.name
~~~~~~~~~~~~~~~~~~~~~~~

Name for the time constraint.

String value expected.

Updates cause replacement.


time_constraints.*.start
~~~~~~~~~~~~~~~~~~~~~~~~

Start time for the time constraint. A CRON expression property.

String value expected.

Updates cause replacement.

Value must be of type cron_expression


time_constraints.*.timezone
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Timezone for the time constraint (eg. 'Taiwan/Taipei',
'Europe/Amsterdam').

String value expected.

Updates cause replacement.

Value must be of type timezone


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
       type: OS::Aodh::Alarm
       properties:
         alarm_actions: [Value, Value, ...]
         comparison_operator: String
         description: String
         enabled: Boolean
         evaluation_periods: Integer
         insufficient_data_actions: [Value, Value, ...]
         matching_metadata: {...}
         meter_name: String
         ok_actions: [Value, Value, ...]
         period: Integer
         query: [{"op": String, "field": String, "value": String}, {"op": String, "field": String, "value": String}, ...]
         repeat_actions: Boolean
         severity: String
         statistic: String
         threshold: Number
         time_constraints: [{"description": String, "name": String, "duration": Integer, "start": String, "timezone": String}, {"description": String, "name": String, "duration": Integer, "start": String, "timezone": String}, ...]


OS::Aodh::CombinationAlarm
==========================

Note: DEPRECATED since 7.0.0 (Newton) - The combination alarm is
  deprecated and disabled by default in Aodh.

Note: Available since 2014.1 (Icehouse)

A resource that implements combination of Aodh alarms.

Allows to use alarm as a combination of other alarms with some
operator: activate this alarm if any alarm in combination has been
activated or if all alarms in combination have been activated.


Required Properties
-------------------


alarm_ids
~~~~~~~~~

List of alarm identifiers to combine.

List value expected.

Can be updated without replacement.

The length must be at least 1.


Optional Properties
-------------------


alarm_actions
~~~~~~~~~~~~~

A list of URLs (webhooks) to invoke when state transitions to alarm.

List value expected.

Can be updated without replacement.


description
~~~~~~~~~~~

Description for the alarm.

String value expected.

Can be updated without replacement.


enabled
~~~~~~~

True if alarm evaluation/actioning is enabled.

Boolean value expected.

Can be updated without replacement.

Defaults to "true".


insufficient_data_actions
~~~~~~~~~~~~~~~~~~~~~~~~~

A list of URLs (webhooks) to invoke when state transitions to
insufficient-data.

List value expected.

Can be updated without replacement.


ok_actions
~~~~~~~~~~

A list of URLs (webhooks) to invoke when state transitions to ok.

List value expected.

Can be updated without replacement.


operator
~~~~~~~~

Operator used to combine the alarms.

String value expected.

Can be updated without replacement.

Allowed values: and, or


repeat_actions
~~~~~~~~~~~~~~

False to trigger actions when the threshold is reached AND the alarm's
state has changed. By default, actions are called each time the
threshold is reached.

Boolean value expected.

Can be updated without replacement.

Defaults to "true".


severity
~~~~~~~~

Note: Available since 5.0.0 (Liberty)

Severity of the alarm.

String value expected.

Can be updated without replacement.

Defaults to "low".

Allowed values: low, moderate, critical


time_constraints
~~~~~~~~~~~~~~~~

Note: Available since 5.0.0 (Liberty)

Describe time constraints for the alarm. Only evaluate the alarm if
the time at evaluation is within this time constraint. Start point(s)
of the constraint are specified with a cron expression, whereas its
duration is given in seconds.

List value expected.

Updates cause replacement.

Defaults to "[]".

*List contents:*


time_constraints.*
~~~~~~~~~~~~~~~~~~

Map value expected.

Updates cause replacement.

*Map properties:*


time_constraints.*.description
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Description for the time constraint.

String value expected.

Updates cause replacement.


time_constraints.*.duration
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Duration for the time constraint.

Integer value expected.

Updates cause replacement.

The value must be at least 0.


time_constraints.*.name
~~~~~~~~~~~~~~~~~~~~~~~

Name for the time constraint.

String value expected.

Updates cause replacement.


time_constraints.*.start
~~~~~~~~~~~~~~~~~~~~~~~~

Start time for the time constraint. A CRON expression property.

String value expected.

Updates cause replacement.

Value must be of type cron_expression


time_constraints.*.timezone
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Timezone for the time constraint (eg. 'Taiwan/Taipei',
'Europe/Amsterdam').

String value expected.

Updates cause replacement.

Value must be of type timezone


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
       type: OS::Aodh::CombinationAlarm
       properties:
         alarm_actions: [Value, Value, ...]
         alarm_ids: [Value, Value, ...]
         description: String
         enabled: Boolean
         insufficient_data_actions: [Value, Value, ...]
         ok_actions: [Value, Value, ...]
         operator: String
         repeat_actions: Boolean
         severity: String
         time_constraints: [{"description": String, "name": String, "duration": Integer, "start": String, "timezone": String}, {"description": String, "name": String, "duration": Integer, "start": String, "timezone": String}, ...]


OS::Aodh::GnocchiAggregationByMetricsAlarm
==========================================

Note: Available since 2015.1 (Kilo)

A resource that implements alarm with specified metrics.

A resource that implements alarm which allows to use specified by user
metrics in metrics list.


Required Properties
-------------------


metrics
~~~~~~~

A list of metric ids.

List value expected.

Can be updated without replacement.


threshold
~~~~~~~~~

Threshold to evaluate against.

Number value expected.

Can be updated without replacement.


Optional Properties
-------------------


aggregation_method
~~~~~~~~~~~~~~~~~~

The aggregation method to compare to the threshold.

String value expected.

Can be updated without replacement.

Allowed values: mean, sum, last, max, min, std, median, first, count


alarm_actions
~~~~~~~~~~~~~

A list of URLs (webhooks) to invoke when state transitions to alarm.

List value expected.

Can be updated without replacement.


comparison_operator
~~~~~~~~~~~~~~~~~~~

Operator used to compare specified statistic with threshold.

String value expected.

Can be updated without replacement.

Allowed values: ge, gt, eq, ne, lt, le


description
~~~~~~~~~~~

Description for the alarm.

String value expected.

Can be updated without replacement.


enabled
~~~~~~~

True if alarm evaluation/actioning is enabled.

Boolean value expected.

Can be updated without replacement.

Defaults to "true".


evaluation_periods
~~~~~~~~~~~~~~~~~~

Number of periods to evaluate over.

Integer value expected.

Can be updated without replacement.


granularity
~~~~~~~~~~~

The time range in seconds.

Integer value expected.

Can be updated without replacement.


insufficient_data_actions
~~~~~~~~~~~~~~~~~~~~~~~~~

A list of URLs (webhooks) to invoke when state transitions to
insufficient-data.

List value expected.

Can be updated without replacement.


ok_actions
~~~~~~~~~~

A list of URLs (webhooks) to invoke when state transitions to ok.

List value expected.

Can be updated without replacement.


repeat_actions
~~~~~~~~~~~~~~

False to trigger actions when the threshold is reached AND the alarm's
state has changed. By default, actions are called each time the
threshold is reached.

Boolean value expected.

Can be updated without replacement.

Defaults to "true".


severity
~~~~~~~~

Note: Available since 5.0.0 (Liberty)

Severity of the alarm.

String value expected.

Can be updated without replacement.

Defaults to "low".

Allowed values: low, moderate, critical


time_constraints
~~~~~~~~~~~~~~~~

Note: Available since 5.0.0 (Liberty)

Describe time constraints for the alarm. Only evaluate the alarm if
the time at evaluation is within this time constraint. Start point(s)
of the constraint are specified with a cron expression, whereas its
duration is given in seconds.

List value expected.

Updates cause replacement.

Defaults to "[]".

*List contents:*


time_constraints.*
~~~~~~~~~~~~~~~~~~

Map value expected.

Updates cause replacement.

*Map properties:*


time_constraints.*.description
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Description for the time constraint.

String value expected.

Updates cause replacement.


time_constraints.*.duration
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Duration for the time constraint.

Integer value expected.

Updates cause replacement.

The value must be at least 0.


time_constraints.*.name
~~~~~~~~~~~~~~~~~~~~~~~

Name for the time constraint.

String value expected.

Updates cause replacement.


time_constraints.*.start
~~~~~~~~~~~~~~~~~~~~~~~~

Start time for the time constraint. A CRON expression property.

String value expected.

Updates cause replacement.

Value must be of type cron_expression


time_constraints.*.timezone
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Timezone for the time constraint (eg. 'Taiwan/Taipei',
'Europe/Amsterdam').

String value expected.

Updates cause replacement.

Value must be of type timezone


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
       type: OS::Aodh::GnocchiAggregationByMetricsAlarm
       properties:
         aggregation_method: String
         alarm_actions: [Value, Value, ...]
         comparison_operator: String
         description: String
         enabled: Boolean
         evaluation_periods: Integer
         granularity: Integer
         insufficient_data_actions: [Value, Value, ...]
         metrics: [Value, Value, ...]
         ok_actions: [Value, Value, ...]
         repeat_actions: Boolean
         severity: String
         threshold: Number
         time_constraints: [{"description": String, "name": String, "duration": Integer, "start": String, "timezone": String}, {"description": String, "name": String, "duration": Integer, "start": String, "timezone": String}, ...]


OS::Aodh::GnocchiAggregationByResourcesAlarm
============================================

Note: Available since 2015.1 (Kilo)

A resource that implements alarm as an aggregation of resources
alarms.

A resource that implements alarm which uses aggregation of resources
alarms with some condition. If state of a system is satisfied alarm
condition, alarm is activated.


Required Properties
-------------------


metric
~~~~~~

Metric name watched by the alarm.

String value expected.

Can be updated without replacement.


query
~~~~~

The query to filter the metrics.

String value expected.

Can be updated without replacement.


resource_type
~~~~~~~~~~~~~

Resource type.

String value expected.

Can be updated without replacement.


threshold
~~~~~~~~~

Threshold to evaluate against.

Number value expected.

Can be updated without replacement.


Optional Properties
-------------------


aggregation_method
~~~~~~~~~~~~~~~~~~

The aggregation method to compare to the threshold.

String value expected.

Can be updated without replacement.

Allowed values: mean, sum, last, max, min, std, median, first, count


alarm_actions
~~~~~~~~~~~~~

A list of URLs (webhooks) to invoke when state transitions to alarm.

List value expected.

Can be updated without replacement.


comparison_operator
~~~~~~~~~~~~~~~~~~~

Operator used to compare specified statistic with threshold.

String value expected.

Can be updated without replacement.

Allowed values: ge, gt, eq, ne, lt, le


description
~~~~~~~~~~~

Description for the alarm.

String value expected.

Can be updated without replacement.


enabled
~~~~~~~

True if alarm evaluation/actioning is enabled.

Boolean value expected.

Can be updated without replacement.

Defaults to "true".


evaluation_periods
~~~~~~~~~~~~~~~~~~

Number of periods to evaluate over.

Integer value expected.

Can be updated without replacement.


granularity
~~~~~~~~~~~

The time range in seconds.

Integer value expected.

Can be updated without replacement.


insufficient_data_actions
~~~~~~~~~~~~~~~~~~~~~~~~~

A list of URLs (webhooks) to invoke when state transitions to
insufficient-data.

List value expected.

Can be updated without replacement.


ok_actions
~~~~~~~~~~

A list of URLs (webhooks) to invoke when state transitions to ok.

List value expected.

Can be updated without replacement.


repeat_actions
~~~~~~~~~~~~~~

False to trigger actions when the threshold is reached AND the alarm's
state has changed. By default, actions are called each time the
threshold is reached.

Boolean value expected.

Can be updated without replacement.

Defaults to "true".


severity
~~~~~~~~

Note: Available since 5.0.0 (Liberty)

Severity of the alarm.

String value expected.

Can be updated without replacement.

Defaults to "low".

Allowed values: low, moderate, critical


time_constraints
~~~~~~~~~~~~~~~~

Note: Available since 5.0.0 (Liberty)

Describe time constraints for the alarm. Only evaluate the alarm if
the time at evaluation is within this time constraint. Start point(s)
of the constraint are specified with a cron expression, whereas its
duration is given in seconds.

List value expected.

Updates cause replacement.

Defaults to "[]".

*List contents:*


time_constraints.*
~~~~~~~~~~~~~~~~~~

Map value expected.

Updates cause replacement.

*Map properties:*


time_constraints.*.description
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Description for the time constraint.

String value expected.

Updates cause replacement.


time_constraints.*.duration
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Duration for the time constraint.

Integer value expected.

Updates cause replacement.

The value must be at least 0.


time_constraints.*.name
~~~~~~~~~~~~~~~~~~~~~~~

Name for the time constraint.

String value expected.

Updates cause replacement.


time_constraints.*.start
~~~~~~~~~~~~~~~~~~~~~~~~

Start time for the time constraint. A CRON expression property.

String value expected.

Updates cause replacement.

Value must be of type cron_expression


time_constraints.*.timezone
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Timezone for the time constraint (eg. 'Taiwan/Taipei',
'Europe/Amsterdam').

String value expected.

Updates cause replacement.

Value must be of type timezone


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
       type: OS::Aodh::GnocchiAggregationByResourcesAlarm
       properties:
         aggregation_method: String
         alarm_actions: [Value, Value, ...]
         comparison_operator: String
         description: String
         enabled: Boolean
         evaluation_periods: Integer
         granularity: Integer
         insufficient_data_actions: [Value, Value, ...]
         metric: String
         ok_actions: [Value, Value, ...]
         query: String
         repeat_actions: Boolean
         resource_type: String
         severity: String
         threshold: Number
         time_constraints: [{"description": String, "name": String, "duration": Integer, "start": String, "timezone": String}, {"description": String, "name": String, "duration": Integer, "start": String, "timezone": String}, ...]


OS::Aodh::GnocchiResourcesAlarm
===============================

Note: Available since 2015.1 (Kilo)

A resource allowing for the watch of some specified resource.

An alarm that evaluates threshold based on some metric for the
specified resource.


Required Properties
-------------------


metric
~~~~~~

Metric name watched by the alarm.

String value expected.

Can be updated without replacement.


resource_id
~~~~~~~~~~~

Id of a resource.

String value expected.

Can be updated without replacement.


resource_type
~~~~~~~~~~~~~

Resource type.

String value expected.

Can be updated without replacement.


threshold
~~~~~~~~~

Threshold to evaluate against.

Number value expected.

Can be updated without replacement.


Optional Properties
-------------------


aggregation_method
~~~~~~~~~~~~~~~~~~

The aggregation method to compare to the threshold.

String value expected.

Can be updated without replacement.

Allowed values: mean, sum, last, max, min, std, median, first, count


alarm_actions
~~~~~~~~~~~~~

A list of URLs (webhooks) to invoke when state transitions to alarm.

List value expected.

Can be updated without replacement.


comparison_operator
~~~~~~~~~~~~~~~~~~~

Operator used to compare specified statistic with threshold.

String value expected.

Can be updated without replacement.

Allowed values: ge, gt, eq, ne, lt, le


description
~~~~~~~~~~~

Description for the alarm.

String value expected.

Can be updated without replacement.


enabled
~~~~~~~

True if alarm evaluation/actioning is enabled.

Boolean value expected.

Can be updated without replacement.

Defaults to "true".


evaluation_periods
~~~~~~~~~~~~~~~~~~

Number of periods to evaluate over.

Integer value expected.

Can be updated without replacement.


granularity
~~~~~~~~~~~

The time range in seconds.

Integer value expected.

Can be updated without replacement.


insufficient_data_actions
~~~~~~~~~~~~~~~~~~~~~~~~~

A list of URLs (webhooks) to invoke when state transitions to
insufficient-data.

List value expected.

Can be updated without replacement.


ok_actions
~~~~~~~~~~

A list of URLs (webhooks) to invoke when state transitions to ok.

List value expected.

Can be updated without replacement.


repeat_actions
~~~~~~~~~~~~~~

False to trigger actions when the threshold is reached AND the alarm's
state has changed. By default, actions are called each time the
threshold is reached.

Boolean value expected.

Can be updated without replacement.

Defaults to "true".


severity
~~~~~~~~

Note: Available since 5.0.0 (Liberty)

Severity of the alarm.

String value expected.

Can be updated without replacement.

Defaults to "low".

Allowed values: low, moderate, critical


time_constraints
~~~~~~~~~~~~~~~~

Note: Available since 5.0.0 (Liberty)

Describe time constraints for the alarm. Only evaluate the alarm if
the time at evaluation is within this time constraint. Start point(s)
of the constraint are specified with a cron expression, whereas its
duration is given in seconds.

List value expected.

Updates cause replacement.

Defaults to "[]".

*List contents:*


time_constraints.*
~~~~~~~~~~~~~~~~~~

Map value expected.

Updates cause replacement.

*Map properties:*


time_constraints.*.description
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Description for the time constraint.

String value expected.

Updates cause replacement.


time_constraints.*.duration
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Duration for the time constraint.

Integer value expected.

Updates cause replacement.

The value must be at least 0.


time_constraints.*.name
~~~~~~~~~~~~~~~~~~~~~~~

Name for the time constraint.

String value expected.

Updates cause replacement.


time_constraints.*.start
~~~~~~~~~~~~~~~~~~~~~~~~

Start time for the time constraint. A CRON expression property.

String value expected.

Updates cause replacement.

Value must be of type cron_expression


time_constraints.*.timezone
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Timezone for the time constraint (eg. 'Taiwan/Taipei',
'Europe/Amsterdam').

String value expected.

Updates cause replacement.

Value must be of type timezone


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
       type: OS::Aodh::GnocchiResourcesAlarm
       properties:
         aggregation_method: String
         alarm_actions: [Value, Value, ...]
         comparison_operator: String
         description: String
         enabled: Boolean
         evaluation_periods: Integer
         granularity: Integer
         insufficient_data_actions: [Value, Value, ...]
         metric: String
         ok_actions: [Value, Value, ...]
         repeat_actions: Boolean
         resource_id: String
         resource_type: String
         severity: String
         threshold: Number
         time_constraints: [{"description": String, "name": String, "duration": Integer, "start": String, "timezone": String}, {"description": String, "name": String, "duration": Integer, "start": String, "timezone": String}, ...]


OS::Cinder::Volume
==================

A resource that implements Cinder volumes.

Cinder volume is a storage in the form of block devices. It can be
used, for example, for providing storage to instance. Volume supports
creation from snapshot, backup or image. Also volume can be created
only by size.


Optional Properties
-------------------


availability_zone
~~~~~~~~~~~~~~~~~

The availability zone in which the volume will be created.

String value expected.

Updates cause replacement.


backup_id
~~~~~~~~~

If specified, the backup to create the volume from.

String value expected.

Can be updated without replacement.

Value must be of type cinder.backup


description
~~~~~~~~~~~

A description of the volume.

String value expected.

Can be updated without replacement.


image
~~~~~

If specified, the name or ID of the image to create the volume from.

String value expected.

Updates cause replacement.

Value must be of type glance.image


metadata
~~~~~~~~

Key/value pairs to associate with the volume.

Map value expected.

Can be updated without replacement.


multiattach
~~~~~~~~~~~

Note: Available since 6.0.0 (Mitaka)

Whether allow the volume to be attached more than once. This property
is only supported from Cinder API v2.

Boolean value expected.

Updates cause replacement.


name
~~~~

A name used to distinguish the volume.

String value expected.

Can be updated without replacement.


read_only
~~~~~~~~~

Note: Available since 5.0.0 (Liberty)

Enables or disables read-only access mode of volume.

Boolean value expected.

Can be updated without replacement.


scheduler_hints
~~~~~~~~~~~~~~~

Note: Available since 2015.1 (Kilo)

Arbitrary key-value pairs specified by the client to help the Cinder
scheduler creating a volume.

Map value expected.

Updates cause replacement.


size
~~~~

The size of the volume in GB. On update only increase in size is
supported. This property is required unless property backup_id or
source_volid or snapshot_id is specified.

Integer value expected.

Can be updated without replacement.

The value must be at least 1.


snapshot_id
~~~~~~~~~~~

If specified, the snapshot to create the volume from.

String value expected.

Updates cause replacement.

Value must be of type cinder.snapshot


source_volid
~~~~~~~~~~~~

If specified, the volume to use as source.

String value expected.

Updates cause replacement.

Value must be of type cinder.volume


volume_type
~~~~~~~~~~~

If specified, the type of volume to use, mapping to a specific
backend.

String value expected.

Can be updated without replacement.

Value must be of type cinder.vtype


Attributes
----------


attachments
~~~~~~~~~~~

The list of attachments of the volume.


availability_zone
~~~~~~~~~~~~~~~~~

The availability zone in which the volume is located.


bootable
~~~~~~~~

Boolean indicating if the volume can be booted or not.


created_at
~~~~~~~~~~

The timestamp indicating volume creation.


display_description
~~~~~~~~~~~~~~~~~~~

Description of the volume.


display_name
~~~~~~~~~~~~

Name of the volume.


encrypted
~~~~~~~~~

Boolean indicating if the volume is encrypted or not.


metadata
~~~~~~~~

Key/value pairs associated with the volume.


metadata_values
~~~~~~~~~~~~~~~

Key/value pairs associated with the volume in raw dict form.


multiattach
~~~~~~~~~~~

Note: Available since 6.0.0 (Mitaka)

Boolean indicating whether allow the volume to be attached more than
once.


show
~~~~

Detailed information about resource.


size
~~~~

The size of the volume in GB.


snapshot_id
~~~~~~~~~~~

The snapshot the volume was created from, if any.


source_volid
~~~~~~~~~~~~

The volume used as source, if any.


status
~~~~~~

The current status of the volume.


volume_type
~~~~~~~~~~~

The type of the volume mapping to a backend, if any.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: OS::Cinder::Volume
       properties:
         availability_zone: String
         backup_id: String
         description: String
         image: String
         metadata: {...}
         multiattach: Boolean
         name: String
         read_only: Boolean
         scheduler_hints: {...}
         size: Integer
         snapshot_id: String
         source_volid: String
         volume_type: String


OS::Cinder::VolumeAttachment
============================

Resource for associating volume to instance.

Resource for associating existing volume to instance. Also, the
location where the volume is exposed on the instance can be specified.


Required Properties
-------------------


instance_uuid
~~~~~~~~~~~~~

The ID of the server to which the volume attaches.

String value expected.

Can be updated without replacement.


volume_id
~~~~~~~~~

The ID of the volume to be attached.

String value expected.

Can be updated without replacement.

Value must be of type cinder.volume


Optional Properties
-------------------


mountpoint
~~~~~~~~~~

The location where the volume is exposed on the instance. This
assignment may not be honored and it is advised that the path
/dev/disk/by-id/virtio-<VolumeId> be used instead.

String value expected.

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
       type: OS::Cinder::VolumeAttachment
       properties:
         instance_uuid: String
         mountpoint: String
         volume_id: String


OS::Heat::CloudConfig
=====================

Note: Available since 2014.1 (Icehouse)

A configuration resource for representing cloud-init cloud-config.

This resource allows cloud-config YAML to be defined and stored by the
config API. Any intrinsic functions called in the config will be
resolved before storing the result.

This resource will generally be referenced by OS::Nova::Server
user_data, or OS::Heat::MultipartMime parts config. Since cloud-config
is boot-only configuration, any changes to the definition will result
in the replacement of all servers which reference it.


Optional Properties
-------------------


cloud_config
~~~~~~~~~~~~

Map representing the cloud-config data structure which will be
formatted as YAML.

Map value expected.

Updates cause replacement.


Attributes
----------


config
~~~~~~

The config value of the software config.


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
       type: OS::Heat::CloudConfig
       properties:
         cloud_config: {...}


OS::Heat::MultipartMime
=======================

Note: Available since 2014.1 (Icehouse)

Assembles a collection of software configurations as a multi-part
mime.

Parts in the message can be populated with inline configuration or
references to other config resources. If the referenced resource is
itself a valid multi-part mime message, that will be broken into parts
and those parts appended to this message.

The resulting multi-part mime message will be stored by the configs
API and can be referenced in properties such as OS::Nova::Server
user_data.

This resource is generally used to build a list of cloud-init
configuration elements including scripts and cloud-config. Since
cloud-init is boot-only configuration, any changes to the definition
will result in the replacement of all servers which reference it.


Optional Properties
-------------------


parts
~~~~~

Parts belonging to this message.

List value expected.

Updates cause replacement.

Defaults to "[]".

*List contents:*


parts.*
~~~~~~~

Map value expected.

Updates cause replacement.

*Map properties:*


parts.*.config
~~~~~~~~~~~~~~

Content of part to attach, either inline or by referencing the ID of
another software config resource.

String value expected.

Updates cause replacement.


parts.*.filename
~~~~~~~~~~~~~~~~

Optional filename to associate with part.

String value expected.

Updates cause replacement.


parts.*.subtype
~~~~~~~~~~~~~~~

Optional subtype to specify with the type.

String value expected.

Updates cause replacement.


parts.*.type
~~~~~~~~~~~~

Whether the part content is text or multipart.

String value expected.

Updates cause replacement.

Defaults to "text".

Allowed values: text, multipart


Attributes
----------


config
~~~~~~

The config value of the software config.


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
       type: OS::Heat::MultipartMime
       properties:
         parts: [{"subtype": String, "type": String, "filename": String, "config": String}, {"subtype": String, "type": String, "filename": String, "config": String}, ...]


OS::Heat::None
==============

Note: Available since 5.0.0 (Liberty)

Enables easily disabling certain resources via the resource_registry.

It does nothing, but can effectively stub out any other resource
because it will accept any properties and return any attribute (as
None). Note this resource always does nothing on update (e.g it is not
replaced even if a change to the stubbed resource properties would
cause replacement).


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
       type: OS::Heat::None


OS::Heat::RandomString
======================

Note: Available since 2014.1 (Icehouse)

A resource which generates a random string.

This is useful for configuring passwords and secrets on services.
Random string can be generated from specified character sequences,
which means that all characters will be randomly chosen from specified
sequences, or with some classes, e.g. letterdigits, which means that
all character will be randomly chosen from union of ascii letters and
digits. Output string will be randomly generated string with specified
length (or with length of 32, if length property doesn't specified).


Optional Properties
-------------------


character_classes
~~~~~~~~~~~~~~~~~

A list of character class and their constraints to generate the random
string from.

List value expected.

Updates cause replacement.

Defaults to "[{'min': 1, 'class': 'lettersdigits'}]".

*List contents:*


character_classes.*
~~~~~~~~~~~~~~~~~~~

Map value expected.

Updates cause replacement.

*Map properties:*


character_classes.*.class
~~~~~~~~~~~~~~~~~~~~~~~~~

A character class and its corresponding min constraint to generate the
random string from.

String value expected.

Updates cause replacement.

Defaults to "lettersdigits".

Allowed values: lettersdigits, letters, lowercase, uppercase, digits,
hexdigits, octdigits


character_classes.*.min
~~~~~~~~~~~~~~~~~~~~~~~

The minimum number of characters from this character class that will
be in the generated string.

Integer value expected.

Updates cause replacement.

Defaults to "1".

The value must be in the range 1 to 512.


character_sequences
~~~~~~~~~~~~~~~~~~~

A list of character sequences and their constraints to generate the
random string from.

List value expected.

Updates cause replacement.

*List contents:*


character_sequences.*
~~~~~~~~~~~~~~~~~~~~~

Map value expected.

Updates cause replacement.

*Map properties:*


character_sequences.*.min
~~~~~~~~~~~~~~~~~~~~~~~~~

The minimum number of characters from this sequence that will be in
the generated string.

Integer value expected.

Updates cause replacement.

Defaults to "1".

The value must be in the range 1 to 512.


character_sequences.*.sequence
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

A character sequence and its corresponding min constraint to generate
the random string from.

String value expected.

Updates cause replacement.


length
~~~~~~

Length of the string to generate.

Integer value expected.

Updates cause replacement.

Defaults to "32".

The value must be in the range 1 to 512.


salt
~~~~

Value which can be set or changed on stack update to trigger the
resource for replacement with a new random string. The salt value
itself is ignored by the random generator.

String value expected.

Updates cause replacement.


Attributes
----------


show
~~~~

Detailed information about resource.


value
~~~~~

The random string generated by this resource. This value is also
available by referencing the resource.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: OS::Heat::RandomString
       properties:
         character_classes: [{"min": Integer, "class": String}, {"min": Integer, "class": String}, ...]
         character_sequences: [{"min": Integer, "sequence": String}, {"min": Integer, "sequence": String}, ...]
         length: Integer
         salt: String


OS::Heat::ResourceGroup
=======================

Note: Available since 2014.1 (Icehouse)

Creates one or more identically configured nested resources.

In addition to the *refs* attribute, this resource implements
synthetic attributes that mirror those of the resources in the group.
When getting an attribute from this resource, however, a list of
attribute values for each resource in the group is returned. To get
attribute values for a single resource in the group, synthetic
attributes of the form *resource.{resource index}.{attribute name}*
can be used. The resource ID of a particular resource in the group can
be obtained via the synthetic attribute *resource.{resource index}*.
Note, that if you get attribute without *{resource index}*, e.g.
*[resource, {attribute_name}]*, you'll get a list of this attribute's
value for all resources in group.

While each resource in the group will be identically configured, this
resource does allow for some index-based customization of the
properties of the resources in the group. For example:

::

   resources:
     my_indexed_group:
       type: OS::Heat::ResourceGroup
       properties:
         count: 3
         resource_def:
           type: OS::Nova::Server
           properties:
             # create a unique name for each server
             # using its index in the group
             name: my_server_%index%
             image: CentOS 6.5
             flavor: 4GB Performance

would result in a group of three servers having the same image and
flavor, but names of *my_server_0*, *my_server_1*, and *my_server_2*.
The variable used for substitution can be customized by using the
*index_var* property.


Required Properties
-------------------


resource_def
~~~~~~~~~~~~

Resource definition for the resources in the group. The value of this
property is the definition of a resource just as if it had been
declared in the template itself.

Map value expected.

Can be updated without replacement.

*Map properties:*


resource_def.metadata
~~~~~~~~~~~~~~~~~~~~~

Note: Available since 5.0.0 (Liberty)

Supplied metadata for the resources in the group.

Map value expected.

Can be updated without replacement.


resource_def.properties
~~~~~~~~~~~~~~~~~~~~~~~

Property values for the resources in the group.

Map value expected.

Can be updated without replacement.


resource_def.type
~~~~~~~~~~~~~~~~~

The type of the resources in the group.

String value expected.

Can be updated without replacement.


Optional Properties
-------------------


count
~~~~~

The number of resources to create.

Integer value expected.

Can be updated without replacement.

Defaults to "1".

The value must be at least 0.


index_var
~~~~~~~~~

Note: Available since 2014.2 (Juno)

A variable that this resource will use to replace with the current
index of a given resource in the group. Can be used, for example, to
customize the name property of grouped servers in order to
differentiate them when listed with nova client.

String value expected.

Updates cause replacement.

Defaults to "%index%".

The length must be at least 3.


removal_policies
~~~~~~~~~~~~~~~~

Note: Available since 2015.1 (Kilo)

Policies for removal of resources on update.

List value expected.

Can be updated without replacement.

Defaults to "[]".

*List contents:*


removal_policies.*
~~~~~~~~~~~~~~~~~~

Policy to be processed when doing an update which requires removal of
specific resources.

Map value expected.

Can be updated without replacement.

*Map properties:*


removal_policies.*.resource_list
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

List of resources to be removed when doing an update which requires
removal of specific resources. The resource may be specified several
ways: (1) The resource name, as in the nested stack, (2) The resource
reference returned from get_resource in a template, as available via
the 'refs' attribute. Note this is destructive on update when
specified; even if the count is not being reduced, and once a resource
name is removed, it's name is never reused in subsequent updates.

List value expected.

Can be updated without replacement.

Defaults to "[]".


Attributes
----------


attributes
~~~~~~~~~~

Note: Available since 2014.2 (Juno)

A map of resource names to the specified attribute of each individual
resource. Requires heat_template_version: 2014-10-16.


refs
~~~~

A list of resource IDs for the resources in the group.


refs_map
~~~~~~~~

Note: Available since 7.0.0 (Newton)

A map of resource names to IDs for the resources in the group.


show
~~~~

Detailed information about resource.


update_policy
-------------


batch_create
~~~~~~~~~~~~

Note: Available since 5.0.0 (Liberty)

Map value expected.

Updates cause replacement.

*Map properties:*


batch_create.max_batch_size
~~~~~~~~~~~~~~~~~~~~~~~~~~~

The maximum number of resources to create at once.

Integer value expected.

Updates cause replacement.

Defaults to "1".

The value must be at least 1.


batch_create.pause_time
~~~~~~~~~~~~~~~~~~~~~~~

The number of seconds to wait between batches.

Number value expected.

Updates cause replacement.

Defaults to "0".

The value must be at least 0.


rolling_update
~~~~~~~~~~~~~~

Note: Available since 5.0.0 (Liberty)

Map value expected.

Updates cause replacement.

*Map properties:*


rolling_update.max_batch_size
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The maximum number of resources to replace at once.

Integer value expected.

Updates cause replacement.

Defaults to "1".

The value must be at least 1.


rolling_update.min_in_service
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The minimum number of resources in service while rolling updates are
being executed.

Integer value expected.

Updates cause replacement.

Defaults to "0".

The value must be at least 0.


rolling_update.pause_time
~~~~~~~~~~~~~~~~~~~~~~~~~

The number of seconds to wait between batches of updates.

Number value expected.

Updates cause replacement.

Defaults to "0".

The value must be at least 0.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: OS::Heat::ResourceGroup
       properties:
         count: Integer
         index_var: String
         removal_policies: [{"resource_list": [Value, Value, ...]}, {"resource_list": [Value, Value, ...]}, ...]
         resource_def: {"properties": {...}, "metadata": {...}, "type": String}


OS::Heat::SoftwareConfig
========================

Note: Available since 2014.1 (Icehouse)

A resource for describing and storing software configuration.

The software_configs API which backs this resource creates immutable
configs, so any change to the template resource definition will result
in a new config being created, and the old one being deleted.

Configs can be defined in the same template which uses them, or they
can be created in one stack, and passed to another stack via a
parameter.

A config resource can be referenced in other resource properties which
are config-aware. This includes the properties OS::Nova::Server
user_data, OS::Heat::SoftwareDeployment config and
OS::Heat::MultipartMime parts config.

Along with the config script itself, this resource can define schemas
for inputs and outputs which the config script is expected to consume
and produce. Inputs and outputs are optional and will map to concepts
which are specific to the configuration tool being used.


Optional Properties
-------------------


config
~~~~~~

Configuration script or manifest which specifies what actual
configuration is performed.

String value expected.

Updates cause replacement.


group
~~~~~

Namespace to group this software config by when delivered to a server.
This may imply what configuration tool is going to perform the
configuration.

String value expected.

Updates cause replacement.

Defaults to "Heat::Ungrouped".


inputs
~~~~~~

Schema representing the inputs that this software config is expecting.

List value expected.

Updates cause replacement.

*List contents:*


inputs.*
~~~~~~~~

Map value expected.

Updates cause replacement.

*Map properties:*


inputs.*.default
~~~~~~~~~~~~~~~~

Default value for the input if none is specified.

String value expected.

Updates cause replacement.


inputs.*.description
~~~~~~~~~~~~~~~~~~~~

Description of the input.

String value expected.

Updates cause replacement.


inputs.*.name
~~~~~~~~~~~~~

Name of the input.

String value expected.

Updates cause replacement.


inputs.*.type
~~~~~~~~~~~~~

Type of the value of the input.

String value expected.

Updates cause replacement.

Defaults to "String".

Allowed values: String, Number, CommaDelimitedList, Json, Boolean


options
~~~~~~~

Map containing options specific to the configuration management tool
used by this resource.

Map value expected.

Updates cause replacement.


outputs
~~~~~~~

Schema representing the outputs that this software config will
produce.

List value expected.

Updates cause replacement.

*List contents:*


outputs.*
~~~~~~~~~

Map value expected.

Updates cause replacement.

*Map properties:*


outputs.*.description
~~~~~~~~~~~~~~~~~~~~~

Description of the output.

String value expected.

Updates cause replacement.


outputs.*.error_output
~~~~~~~~~~~~~~~~~~~~~~

Denotes that the deployment is in an error state if this output has a
value.

Boolean value expected.

Updates cause replacement.

Defaults to "False".


outputs.*.name
~~~~~~~~~~~~~~

Name of the output.

String value expected.

Updates cause replacement.


outputs.*.type
~~~~~~~~~~~~~~

Type of the value of the output.

String value expected.

Updates cause replacement.

Defaults to "String".

Allowed values: String, Number, CommaDelimitedList, Json, Boolean


Attributes
----------


config
~~~~~~

The config value of the software config.


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
       type: OS::Heat::SoftwareConfig
       properties:
         config: String
         group: String
         inputs: [{"default": String, "name": String, "description": String, "type": String}, {"default": String, "name": String, "description": String, "type": String}, ...]
         options: {...}
         outputs: [{"error_output": Boolean, "name": String, "description": String, "type": String}, {"error_output": Boolean, "name": String, "description": String, "type": String}, ...]


OS::Heat::SoftwareDeployment
============================

Note: Available since 2014.1 (Icehouse)

This resource associates a server with some configuration.

The configuration is to be deployed to that server.

A deployment allows input values to be specified which map to the
inputs schema defined in the config resource. These input values are
interpreted by the configuration tool in a tool-specific manner.

Whenever this resource goes to an IN_PROGRESS state, it creates an
ephemeral config that includes the inputs values plus a number of
extra inputs which have names prefixed with >>deploy_<<. The extra
inputs relate to the current state of the stack, along with the
information and credentials required to signal back the deployment
results.

Unless signal_transport=NO_SIGNAL, this resource will remain in an
IN_PROGRESS state until the server signals it with the output values
for that deployment. Those output values are then available as
resource attributes, along with the default attributes deploy_stdout,
deploy_stderr and deploy_status_code.

Specifying actions other than the default CREATE and UPDATE will
result in the deployment being triggered in those actions. For example
this would allow cleanup configuration to be performed during actions
SUSPEND and DELETE. A config could be designed to only work with some
specific actions, or a config can read the value of the deploy_action
input to allow conditional logic to perform different configuration
for different actions.


Required Properties
-------------------


server
~~~~~~

ID of resource to apply configuration to. Normally this should be a
Nova server ID.

String value expected.

Updates cause replacement.


Optional Properties
-------------------


actions
~~~~~~~

Which lifecycle actions of the deployment resource will result in this
deployment being triggered.

List value expected.

Can be updated without replacement.

Defaults to "['CREATE', 'UPDATE']".

Allowed values: CREATE, UPDATE, DELETE, SUSPEND, RESUME


config
~~~~~~

ID of software configuration resource to execute when applying to the
server.

String value expected.

Can be updated without replacement.


input_values
~~~~~~~~~~~~

Input values to apply to the software configuration on this server.

Map value expected.

Can be updated without replacement.


name
~~~~

Name of the derived config associated with this deployment. This is
used to apply a sort order to the list of configurations currently
deployed to a server.

String value expected.

Can be updated without replacement.


signal_transport
~~~~~~~~~~~~~~~~

How the server should signal to heat with the deployment output
values. CFN_SIGNAL will allow an HTTP POST to a CFN keypair signed
URL. TEMP_URL_SIGNAL will create a Swift TempURL to be signaled via
HTTP PUT. HEAT_SIGNAL will allow calls to the Heat API resource-signal
using the provided keystone credentials. ZAQAR_SIGNAL will create a
dedicated zaqar queue to be signaled using the provided keystone
credentials. NO_SIGNAL will result in the resource going to the
COMPLETE state without waiting for any signal.

String value expected.

Updates cause replacement.

Defaults to "CFN_SIGNAL".

Allowed values: CFN_SIGNAL, TEMP_URL_SIGNAL, HEAT_SIGNAL, NO_SIGNAL,
ZAQAR_SIGNAL


Attributes
----------


deploy_status_code
~~~~~~~~~~~~~~~~~~

Returned status code from the configuration execution.


deploy_stderr
~~~~~~~~~~~~~

Captured stderr from the configuration execution.


deploy_stdout
~~~~~~~~~~~~~

Captured stdout from the configuration execution.


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
       type: OS::Heat::SoftwareDeployment
       properties:
         actions: [Value, Value, ...]
         config: String
         input_values: {...}
         name: String
         server: String
         signal_transport: String


OS::Heat::SoftwareDeploymentGroup
=================================

Note: Available since 5.0.0 (Liberty)

This resource associates a group of servers with some configuration.

The configuration is to be deployed to all servers in the group.

The properties work in a similar way to OS::Heat::SoftwareDeployment,
and in addition to the attributes documented, you may pass any
attribute supported by OS::Heat::SoftwareDeployment, including those
exposing arbitrary outputs, and return a map of deployment names to
the specified attribute.


Required Properties
-------------------


servers
~~~~~~~

A map of names and server IDs to apply configuration to. The name is
arbitrary and is used as the Heat resource name for the corresponding
deployment.

Map value expected.

Can be updated without replacement.


Optional Properties
-------------------


actions
~~~~~~~

Which lifecycle actions of the deployment resource will result in this
deployment being triggered.

List value expected.

Can be updated without replacement.

Defaults to "['CREATE', 'UPDATE']".

Allowed values: CREATE, UPDATE, DELETE, SUSPEND, RESUME


config
~~~~~~

ID of software configuration resource to execute when applying to the
server.

String value expected.

Can be updated without replacement.


input_values
~~~~~~~~~~~~

Input values to apply to the software configuration on this server.

Map value expected.

Can be updated without replacement.


name
~~~~

Name of the derived config associated with this deployment. This is
used to apply a sort order to the list of configurations currently
deployed to a server.

String value expected.

Can be updated without replacement.


signal_transport
~~~~~~~~~~~~~~~~

How the server should signal to heat with the deployment output
values. CFN_SIGNAL will allow an HTTP POST to a CFN keypair signed
URL. TEMP_URL_SIGNAL will create a Swift TempURL to be signaled via
HTTP PUT. HEAT_SIGNAL will allow calls to the Heat API resource-signal
using the provided keystone credentials. ZAQAR_SIGNAL will create a
dedicated zaqar queue to be signaled using the provided keystone
credentials. NO_SIGNAL will result in the resource going to the
COMPLETE state without waiting for any signal.

String value expected.

Updates cause replacement.

Defaults to "CFN_SIGNAL".

Allowed values: CFN_SIGNAL, TEMP_URL_SIGNAL, HEAT_SIGNAL, NO_SIGNAL,
ZAQAR_SIGNAL


Attributes
----------


deploy_status_codes
~~~~~~~~~~~~~~~~~~~

A map of Nova names and returned status code from the configuration
execution.


deploy_stderrs
~~~~~~~~~~~~~~

A map of Nova names and captured stderrs from the configuration
execution to each server.


deploy_stdouts
~~~~~~~~~~~~~~

A map of Nova names and captured stdouts from the configuration
execution to each server.


show
~~~~

Detailed information about resource.


update_policy
-------------


batch_create
~~~~~~~~~~~~

Note: Available since 5.0.0 (Liberty)

Map value expected.

Updates cause replacement.

*Map properties:*


batch_create.max_batch_size
~~~~~~~~~~~~~~~~~~~~~~~~~~~

The maximum number of resources to create at once.

Integer value expected.

Updates cause replacement.

Defaults to "1".

The value must be at least 1.


batch_create.pause_time
~~~~~~~~~~~~~~~~~~~~~~~

The number of seconds to wait between batches.

Number value expected.

Updates cause replacement.

Defaults to "0".

The value must be at least 0.


rolling_update
~~~~~~~~~~~~~~

Note: Available since 5.0.0 (Liberty)

Map value expected.

Updates cause replacement.

*Map properties:*


rolling_update.max_batch_size
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The maximum number of resources to replace at once.

Integer value expected.

Updates cause replacement.

Defaults to "1".

The value must be at least 1.


rolling_update.min_in_service
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The minimum number of resources in service while rolling updates are
being executed.

Integer value expected.

Updates cause replacement.

Defaults to "0".

The value must be at least 0.


rolling_update.pause_time
~~~~~~~~~~~~~~~~~~~~~~~~~

The number of seconds to wait between batches of updates.

Number value expected.

Updates cause replacement.

Defaults to "0".

The value must be at least 0.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: OS::Heat::SoftwareDeploymentGroup
       properties:
         actions: [Value, Value, ...]
         config: String
         input_values: {...}
         name: String
         servers: {...}
         signal_transport: String


OS::Heat::SoftwareDeployments
=============================

Note: DEPRECATED since 2014.2 (Juno) - Use of this resource is
  discouraged. Please use OS::Heat::SoftwareDeploymentGroup instead.


Required Properties
-------------------


servers
~~~~~~~

A map of names and server IDs to apply configuration to. The name is
arbitrary and is used as the Heat resource name for the corresponding
deployment.

Map value expected.

Can be updated without replacement.


Optional Properties
-------------------


actions
~~~~~~~

Which lifecycle actions of the deployment resource will result in this
deployment being triggered.

List value expected.

Can be updated without replacement.

Defaults to "['CREATE', 'UPDATE']".

Allowed values: CREATE, UPDATE, DELETE, SUSPEND, RESUME


config
~~~~~~

ID of software configuration resource to execute when applying to the
server.

String value expected.

Can be updated without replacement.


input_values
~~~~~~~~~~~~

Input values to apply to the software configuration on this server.

Map value expected.

Can be updated without replacement.


name
~~~~

Name of the derived config associated with this deployment. This is
used to apply a sort order to the list of configurations currently
deployed to a server.

String value expected.

Can be updated without replacement.


signal_transport
~~~~~~~~~~~~~~~~

How the server should signal to heat with the deployment output
values. CFN_SIGNAL will allow an HTTP POST to a CFN keypair signed
URL. TEMP_URL_SIGNAL will create a Swift TempURL to be signaled via
HTTP PUT. HEAT_SIGNAL will allow calls to the Heat API resource-signal
using the provided keystone credentials. ZAQAR_SIGNAL will create a
dedicated zaqar queue to be signaled using the provided keystone
credentials. NO_SIGNAL will result in the resource going to the
COMPLETE state without waiting for any signal.

String value expected.

Updates cause replacement.

Defaults to "CFN_SIGNAL".

Allowed values: CFN_SIGNAL, TEMP_URL_SIGNAL, HEAT_SIGNAL, NO_SIGNAL,
ZAQAR_SIGNAL


Attributes
----------


deploy_status_codes
~~~~~~~~~~~~~~~~~~~

A map of Nova names and returned status code from the configuration
execution.


deploy_stderrs
~~~~~~~~~~~~~~

A map of Nova names and captured stderrs from the configuration
execution to each server.


deploy_stdouts
~~~~~~~~~~~~~~

A map of Nova names and captured stdouts from the configuration
execution to each server.


show
~~~~

Detailed information about resource.


update_policy
-------------


batch_create
~~~~~~~~~~~~

Note: Available since 5.0.0 (Liberty)

Map value expected.

Updates cause replacement.

*Map properties:*


batch_create.max_batch_size
~~~~~~~~~~~~~~~~~~~~~~~~~~~

The maximum number of resources to create at once.

Integer value expected.

Updates cause replacement.

Defaults to "1".

The value must be at least 1.


batch_create.pause_time
~~~~~~~~~~~~~~~~~~~~~~~

The number of seconds to wait between batches.

Number value expected.

Updates cause replacement.

Defaults to "0".

The value must be at least 0.


rolling_update
~~~~~~~~~~~~~~

Note: Available since 5.0.0 (Liberty)

Map value expected.

Updates cause replacement.

*Map properties:*


rolling_update.max_batch_size
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The maximum number of resources to replace at once.

Integer value expected.

Updates cause replacement.

Defaults to "1".

The value must be at least 1.


rolling_update.min_in_service
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The minimum number of resources in service while rolling updates are
being executed.

Integer value expected.

Updates cause replacement.

Defaults to "0".

The value must be at least 0.


rolling_update.pause_time
~~~~~~~~~~~~~~~~~~~~~~~~~

The number of seconds to wait between batches of updates.

Number value expected.

Updates cause replacement.

Defaults to "0".

The value must be at least 0.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: OS::Heat::SoftwareDeployments
       properties:
         actions: [Value, Value, ...]
         config: String
         input_values: {...}
         name: String
         servers: {...}
         signal_transport: String


OS::Heat::Stack
===============

A Resource representing a stack.

A resource that allowing for the creating stack, where should be
defined stack template in HOT format, parameters (if template has any
parameters with no default value), and timeout of creating. After
creating current stack will have remote stack.


Required Properties
-------------------


template
~~~~~~~~

Template that specifies the stack to be created as a resource.

String value expected.

Can be updated without replacement.


Optional Properties
-------------------


context
~~~~~~~

Context for this stack.

Map value expected.

Updates cause replacement.

*Map properties:*


context.region_name
~~~~~~~~~~~~~~~~~~~

Region name in which this stack will be created.

String value expected.

Updates cause replacement.


parameters
~~~~~~~~~~

Set of parameters passed to this stack.

Map value expected.

Can be updated without replacement.

Defaults to "{}".


timeout
~~~~~~~

Number of minutes to wait for this stack creation.

Integer value expected.

Can be updated without replacement.


Attributes
----------


outputs
~~~~~~~

A dict of key-value pairs output from the stack.


show
~~~~

Detailed information about resource.


stack_name
~~~~~~~~~~

Name of the stack.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: OS::Heat::Stack
       properties:
         context: {"region_name": String}
         parameters: {...}
         template: String
         timeout: Integer


OS::Heat::SwiftSignal
=====================

Note: Available since 2014.2 (Juno)

Resource for handling signals received by SwiftSignalHandle.

This resource handles signals received by SwiftSignalHandle and is
same as WaitCondition resource.


Required Properties
-------------------


handle
~~~~~~

URL of TempURL where resource will signal completion and optionally
upload data.

String value expected.

Updates cause replacement.


timeout
~~~~~~~

The maximum number of seconds to wait for the resource to signal
completion. Once the timeout is reached, creation of the signal
resource will fail.

Number value expected.

Updates cause replacement.

The value must be in the range 1 to 43200.


Optional Properties
-------------------


count
~~~~~

The number of success signals that must be received before the stack
creation process continues.

Integer value expected.

Updates cause replacement.

Defaults to "1".

The value must be in the range 1 to 1000.


Attributes
----------


data
~~~~

JSON data that was uploaded via the SwiftSignalHandle.


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
       type: OS::Heat::SwiftSignal
       properties:
         count: Integer
         handle: String
         timeout: Number


OS::Heat::SwiftSignalHandle
===========================

Note: Available since 2014.2 (Juno)

Resource for managing signals from Swift resources.

This resource is same as WaitConditionHandle, but designed for using
by Swift resources.


Attributes
----------


curl_cli
~~~~~~~~

Convenience attribute, provides curl CLI command prefix, which can be
used for signalling handle completion or failure. You can signal
success by adding --data-binary '{"status": "SUCCESS"}' , or signal
failure by adding --data-binary '{"status": "FAILURE"}'.


endpoint
~~~~~~~~

Endpoint/url which can be used for signalling handle.


show
~~~~

Detailed information about resource.


token
~~~~~

Tokens are not needed for Swift TempURLs. This attribute is being kept
for compatibility with the OS::Heat::WaitConditionHandle resource.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: OS::Heat::SwiftSignalHandle


OS::Heat::TestResource
======================

Note: Available since 5.0.0 (Liberty)

A resource which stores the string value that was provided.

This resource is to be used only for testing. It has control knobs
such as 'update_replace', 'fail', 'wait_secs'.


Optional Properties
-------------------


action_wait_secs
~~~~~~~~~~~~~~~~

Options for simulating waiting.

Map value expected.

Can be updated without replacement.

*Map properties:*


action_wait_secs.create
~~~~~~~~~~~~~~~~~~~~~~~

Seconds to wait after a create. Defaults to the global wait_secs.

Number value expected.

Can be updated without replacement.


action_wait_secs.delete
~~~~~~~~~~~~~~~~~~~~~~~

Seconds to wait after a delete. Defaults to the global wait_secs.

Number value expected.

Can be updated without replacement.


action_wait_secs.update
~~~~~~~~~~~~~~~~~~~~~~~

Seconds to wait after an update. Defaults to the global wait_secs.

Number value expected.

Can be updated without replacement.


attr_wait_secs
~~~~~~~~~~~~~~

Note: Available since 6.0.0 (Mitaka)

Number value for timeout during resolving output value.

Number value expected.

Can be updated without replacement.

Defaults to "0".


client_name
~~~~~~~~~~~

Client to poll.

String value expected.

Can be updated without replacement.

Defaults to "".


constraint_prop_secs
~~~~~~~~~~~~~~~~~~~~

Note: Available since 6.0.0 (Mitaka)

Number value for delay during resolve constraint.

Number value expected.

Can be updated without replacement.

Defaults to "0".

Value must be of type test_constr


entity_name
~~~~~~~~~~~

Client entity to poll.

String value expected.

Can be updated without replacement.

Defaults to "".


fail
~~~~

Value which can be set to fail the resource operation to test failure
scenarios.

Boolean value expected.

Can be updated without replacement.

Defaults to "False".


update_replace
~~~~~~~~~~~~~~

Value which can be set to trigger update replace for the particular
resource.

Boolean value expected.

Can be updated without replacement.

Defaults to "False".


update_replace_value
~~~~~~~~~~~~~~~~~~~~

Note: Available since 7.0.0 (Newton)

Some value that can be stored but can not be updated.

String value expected.

Updates cause replacement.


value
~~~~~

The input string to be stored.

String value expected.

Can be updated without replacement.

Defaults to "test_string".


wait_secs
~~~~~~~~~

Seconds to wait after an action (-1 is infinite).

Number value expected.

Can be updated without replacement.

Defaults to "0".


Attributes
----------


output
~~~~~~

The string that was stored. This value is also available by
referencing the resource.


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
       type: OS::Heat::TestResource
       properties:
         action_wait_secs: {"delete": Number, "create": Number, "update": Number}
         attr_wait_secs: Number
         client_name: String
         constraint_prop_secs: Number
         entity_name: String
         fail: Boolean
         update_replace: Boolean
         update_replace_value: String
         value: String
         wait_secs: Number


OS::Neutron::LBaaS::HealthMonitor
=================================

Note: Available since 6.0.0 (Mitaka)

A resource to handle load balancer health monitors.

This resource creates and manages Neutron LBaaS v2 healthmonitors,
which watches status of the load balanced servers.


Required Properties
-------------------


delay
~~~~~

The minimum time in milliseconds between regular connections of the
member.

Integer value expected.

Can be updated without replacement.

The value must be at least 0.


max_retries
~~~~~~~~~~~

Number of permissible connection failures before changing the member
status to INACTIVE.

Integer value expected.

Can be updated without replacement.

The value must be in the range 1 to 10.


pool
~~~~

ID or name of the load balancing pool.

String value expected.

Updates cause replacement.

Value must be of type neutron.lbaas.pool


timeout
~~~~~~~

Maximum number of milliseconds for a monitor to wait for a connection
to be established before it times out.

Integer value expected.

Can be updated without replacement.

The value must be at least 0.


type
~~~~

One of predefined health monitor types.

String value expected.

Updates cause replacement.

Allowed values: PING, TCP, HTTP, HTTPS


Optional Properties
-------------------


admin_state_up
~~~~~~~~~~~~~~

The administrative state of the health monitor.

Boolean value expected.

Can be updated without replacement.

Defaults to "True".


expected_codes
~~~~~~~~~~~~~~

The HTTP status codes expected in response from the member to declare
it healthy. Specify one of the following values: a single value, such
as 200. a list, such as 200, 202. a range, such as 200-204.

String value expected.

Can be updated without replacement.

Defaults to "200".


http_method
~~~~~~~~~~~

The HTTP method used for requests by the monitor of type HTTP.

String value expected.

Can be updated without replacement.

Defaults to "GET".

Allowed values: GET, HEAD, POST, PUT, DELETE, TRACE, OPTIONS, CONNECT,
PATCH


tenant_id
~~~~~~~~~

ID of the tenant who owns the health monitor.

String value expected.

Updates cause replacement.


url_path
~~~~~~~~

The HTTP path used in the HTTP request used by the monitor to test a
member health. A valid value is a string the begins with a forward
slash (/).

String value expected.

Can be updated without replacement.

Defaults to "/".


Attributes
----------


pools
~~~~~

The list of Pools related to this monitor.


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
       type: OS::Neutron::LBaaS::HealthMonitor
       properties:
         admin_state_up: Boolean
         delay: Integer
         expected_codes: String
         http_method: String
         max_retries: Integer
         pool: String
         tenant_id: String
         timeout: Integer
         type: String
         url_path: String


OS::Neutron::LBaaS::Listener
============================

Note: Available since 6.0.0 (Mitaka)

A resource for managing LBaaS v2 Listeners.

This resource creates and manages Neutron LBaaS v2 Listeners, which
represent a listening endpoint for the vip.


Required Properties
-------------------


loadbalancer
~~~~~~~~~~~~

ID or name of the load balancer with which listener is associated.

String value expected.

Updates cause replacement.

Value must be of type neutron.lbaas.loadbalancer


protocol
~~~~~~~~

Protocol on which to listen for the client traffic.

String value expected.

Updates cause replacement.

Allowed values: TCP, HTTP, HTTPS, TERMINATED_HTTPS


protocol_port
~~~~~~~~~~~~~

TCP or UDP port on which to listen for client traffic.

Integer value expected.

Updates cause replacement.

The value must be in the range 1 to 65535.


Optional Properties
-------------------


admin_state_up
~~~~~~~~~~~~~~

The administrative state of this listener.

Boolean value expected.

Can be updated without replacement.

Defaults to "True".


connection_limit
~~~~~~~~~~~~~~~~

The maximum number of connections permitted for this load balancer.
Defaults to -1, which is infinite.

Integer value expected.

Can be updated without replacement.

Defaults to "-1".

The value must be at least -1.


default_tls_container_ref
~~~~~~~~~~~~~~~~~~~~~~~~~

Default TLS container reference to retrieve TLS information.

String value expected.

Can be updated without replacement.


description
~~~~~~~~~~~

Description of this listener.

String value expected.

Can be updated without replacement.

Defaults to "".


name
~~~~

Name of this listener.

String value expected.

Can be updated without replacement.


sni_container_refs
~~~~~~~~~~~~~~~~~~

List of TLS container references for SNI.

List value expected.

Can be updated without replacement.


tenant_id
~~~~~~~~~

The ID of the tenant who owns the listener.

String value expected.

Updates cause replacement.


Attributes
----------


default_pool_id
~~~~~~~~~~~~~~~

ID of the default pool this listener is associated to.


loadbalancers
~~~~~~~~~~~~~

ID of the load balancer this listener is associated to.


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
       type: OS::Neutron::LBaaS::Listener
       properties:
         admin_state_up: Boolean
         connection_limit: Integer
         default_tls_container_ref: String
         description: String
         loadbalancer: String
         name: String
         protocol: String
         protocol_port: Integer
         sni_container_refs: [Value, Value, ...]
         tenant_id: String


OS::Neutron::LBaaS::LoadBalancer
================================

Note: Available since 6.0.0 (Mitaka)

A resource for creating LBaaS v2 Load Balancers.

This resource creates and manages Neutron LBaaS v2 Load Balancers,
which allows traffic to be directed between servers.


Required Properties
-------------------


vip_subnet
~~~~~~~~~~

The name or ID of the subnet on which to allocate the VIP address.

String value expected.

Updates cause replacement.

Value must be of type neutron.subnet


Optional Properties
-------------------


admin_state_up
~~~~~~~~~~~~~~

The administrative state of this Load Balancer.

Boolean value expected.

Can be updated without replacement.

Defaults to "True".


description
~~~~~~~~~~~

Description of this Load Balancer.

String value expected.

Can be updated without replacement.

Defaults to "".


name
~~~~

Name of this Load Balancer.

String value expected.

Can be updated without replacement.


provider
~~~~~~~~

Provider for this Load Balancer.

String value expected.

Updates cause replacement.

Value must be of type neutron.lbaas.provider


tenant_id
~~~~~~~~~

The ID of the tenant who owns the Load Balancer. Only administrative
users can specify a tenant ID other than their own.

String value expected.

Updates cause replacement.

Value must be of type keystone.project


vip_address
~~~~~~~~~~~

IP address for the VIP.

String value expected.

Updates cause replacement.

Value must be of type ip_addr


Attributes
----------


show
~~~~

Detailed information about resource.


vip_address
~~~~~~~~~~~

The VIP address of the LoadBalancer.


vip_port_id
~~~~~~~~~~~

The VIP port of the LoadBalancer.


vip_subnet_id
~~~~~~~~~~~~~

The VIP subnet of the LoadBalancer.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: OS::Neutron::LBaaS::LoadBalancer
       properties:
         admin_state_up: Boolean
         description: String
         name: String
         provider: String
         tenant_id: String
         vip_address: String
         vip_subnet: String


OS::Neutron::LBaaS::Pool
========================

Note: Available since 6.0.0 (Mitaka)

A resource for managing LBaaS v2 Pools.

This resources manages Neutron-LBaaS v2 Pools, which represent a group
of nodes. Pools define the subnet where nodes reside, balancing
algorithm, and the nodes themselves.


Required Properties
-------------------


lb_algorithm
~~~~~~~~~~~~

The algorithm used to distribute load between the members of the pool.

String value expected.

Can be updated without replacement.

Allowed values: ROUND_ROBIN, LEAST_CONNECTIONS, SOURCE_IP


listener
~~~~~~~~

Listener name or ID to be associated with this pool.

String value expected.

Updates cause replacement.

Value must be of type neutron.lbaas.listener


protocol
~~~~~~~~

Protocol of the pool.

String value expected.

Updates cause replacement.

Allowed values: TCP, HTTP, HTTPS


Optional Properties
-------------------


admin_state_up
~~~~~~~~~~~~~~

The administrative state of this pool.

Boolean value expected.

Can be updated without replacement.

Defaults to "True".


description
~~~~~~~~~~~

Description of this pool.

String value expected.

Can be updated without replacement.

Defaults to "".


name
~~~~

Name of this pool.

String value expected.

Can be updated without replacement.


session_persistence
~~~~~~~~~~~~~~~~~~~

Configuration of session persistence.

Map value expected.

Updates cause replacement.

*Map properties:*


session_persistence.cookie_name
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Name of the cookie, required if type is APP_COOKIE.

String value expected.

Updates cause replacement.


session_persistence.type
~~~~~~~~~~~~~~~~~~~~~~~~

Method of implementation of session persistence feature.

String value expected.

Updates cause replacement.

Allowed values: SOURCE_IP, HTTP_COOKIE, APP_COOKIE


Attributes
----------


healthmonitor_id
~~~~~~~~~~~~~~~~

ID of the health monitor associated with this pool.


listeners
~~~~~~~~~

Listener associated with this pool.


members
~~~~~~~

Members associated with this pool.


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
       type: OS::Neutron::LBaaS::Pool
       properties:
         admin_state_up: Boolean
         description: String
         lb_algorithm: String
         listener: String
         name: String
         protocol: String
         session_persistence: {"cookie_name": String, "type": String}


OS::Neutron::LBaaS::PoolMember
==============================

Note: Available since 6.0.0 (Mitaka)

A resource for managing LBaaS v2 Pool Members.

A pool member represents a single backend node.


Required Properties
-------------------


address
~~~~~~~

IP address of the pool member on the pool network.

String value expected.

Updates cause replacement.

Value must be of type ip_addr


pool
~~~~

Name or ID of the load balancing pool.

String value expected.

Updates cause replacement.

Value must be of type neutron.lbaas.pool


protocol_port
~~~~~~~~~~~~~

Port on which the pool member listens for requests or connections.

Integer value expected.

Updates cause replacement.

The value must be in the range 1 to 65535.


Optional Properties
-------------------


admin_state_up
~~~~~~~~~~~~~~

The administrative state of the pool member.

Boolean value expected.

Can be updated without replacement.

Defaults to "True".


subnet
~~~~~~

Subnet name or ID of this member.

String value expected.

Updates cause replacement.

Value must be of type neutron.subnet


weight
~~~~~~

Weight of pool member in the pool (default to 1).

Integer value expected.

Can be updated without replacement.

Defaults to "1".

The value must be in the range 0 to 256.


Attributes
----------


address
~~~~~~~

The IP address of the pool member.


pool_id
~~~~~~~

The ID of the pool to which the pool member belongs.


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
       type: OS::Neutron::LBaaS::PoolMember
       properties:
         address: String
         admin_state_up: Boolean
         pool: String
         protocol_port: Integer
         subnet: String
         weight: Integer


OS::Neutron::Net
================

A resource for managing Neutron net.

A network is a virtual isolated layer-2 broadcast domain which is
typically reserved to the tenant who created it, unless the network
has been explicitly configured to be shared.


Optional Properties
-------------------


admin_state_up
~~~~~~~~~~~~~~

A boolean value specifying the administrative status of the network.

Boolean value expected.

Can be updated without replacement.

Defaults to "True".


dhcp_agent_ids
~~~~~~~~~~~~~~

The IDs of the DHCP agent to schedule the network. Note that the
default policy setting in Neutron restricts usage of this property to
administrative users only.

List value expected.

Can be updated without replacement.


name
~~~~

A string specifying a symbolic name for the network, which is not
required to be unique.

String value expected.

Can be updated without replacement.


port_security_enabled
~~~~~~~~~~~~~~~~~~~~~

Note: Available since 5.0.0 (Liberty)

Flag to enable/disable port security on the network. It provides the
default value for the attribute of the ports created on this network.

Boolean value expected.

Can be updated without replacement.


qos_policy
~~~~~~~~~~

Note: Available since 6.0.0 (Mitaka)

The name or ID of QoS policy to attach to this network.

String value expected.

Can be updated without replacement.

Value must be of type neutron.qos_policy


shared
~~~~~~

Whether this network should be shared across all tenants. Note that
the default policy setting restricts usage of this attribute to
administrative users only.

Boolean value expected.

Can be updated without replacement.

Defaults to "False".


tenant_id
~~~~~~~~~

The ID of the tenant which will own the network. Only administrative
users can set the tenant identifier; this cannot be changed using
authorization policies.

String value expected.

Updates cause replacement.


value_specs
~~~~~~~~~~~

Extra parameters to include in the request. Parameters are often
specific to installed hardware or extensions.

Map value expected.

Can be updated without replacement.

Defaults to "{}".


Attributes
----------


admin_state_up
~~~~~~~~~~~~~~

The administrative status of the network.


mtu
~~~

Note: Available since 5.0.0 (Liberty)

The maximum transmission unit size(in bytes) for the network.


name
~~~~

The name of the network.


port_security_enabled
~~~~~~~~~~~~~~~~~~~~~

Note: Available since 5.0.0 (Liberty)

Port security enabled of the network.


qos_policy_id
~~~~~~~~~~~~~

Note: Available since 6.0.0 (Mitaka)

The QoS policy ID attached to this network.


show
~~~~

Detailed information about resource.


status
~~~~~~

The status of the network.


subnets
~~~~~~~

Subnets of this network.


tenant_id
~~~~~~~~~

The tenant owning this network.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: OS::Neutron::Net
       properties:
         admin_state_up: Boolean
         dhcp_agent_ids: [Value, Value, ...]
         name: String
         port_security_enabled: Boolean
         qos_policy: String
         shared: Boolean
         tenant_id: String
         value_specs: {...}


OS::Neutron::Port
=================

A resource for managing Neutron ports.

A port represents a virtual switch port on a logical network switch.
Virtual instances attach their interfaces into ports. The logical port
also defines the MAC address and the IP address(es) to be assigned to
the interfaces plugged into them. When IP addresses are associated to
a port, this also implies the port is associated with a subnet, as the
IP address was taken from the allocation pool for a specific subnet.


Required Properties
-------------------


network
~~~~~~~

Note: Available since 2014.2 (Juno)

Network this port belongs to. If you plan to use current port to
assign Floating IP, you should specify fixed_ips with subnet. Note if
this changes to a different network update, the port will be replaced.

String value expected.

Updates cause replacement.

Value must be of type neutron.network


Optional Properties
-------------------


admin_state_up
~~~~~~~~~~~~~~

The administrative state of this port.

Boolean value expected.

Can be updated without replacement.

Defaults to "True".


allowed_address_pairs
~~~~~~~~~~~~~~~~~~~~~

Additional MAC/IP address pairs allowed to pass through the port.

List value expected.

Updates cause replacement.

*List contents:*


allowed_address_pairs.*
~~~~~~~~~~~~~~~~~~~~~~~

Map value expected.

Updates cause replacement.

*Map properties:*


allowed_address_pairs.*.ip_address
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

IP address to allow through this port.

String value expected.

Updates cause replacement.

Value must be of type net_cidr


allowed_address_pairs.*.mac_address
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

MAC address to allow through this port.

String value expected.

Updates cause replacement.

Value must be of type mac_addr


binding:vnic_type
~~~~~~~~~~~~~~~~~

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


device_id
~~~~~~~~~

Device ID of this port.

String value expected.

Can be updated without replacement.


device_owner
~~~~~~~~~~~~

Name of the network owning the port. The value is typically
network:floatingip or network:router_interface or network:dhcp.

String value expected.

Can be updated without replacement.


fixed_ips
~~~~~~~~~

Desired IPs for this port.

List value expected.

Can be updated without replacement.

*List contents:*


fixed_ips.*
~~~~~~~~~~~

Map value expected.

Can be updated without replacement.

*Map properties:*


fixed_ips.*.ip_address
~~~~~~~~~~~~~~~~~~~~~~

IP address desired in the subnet for this port.

String value expected.

Can be updated without replacement.

Value must be of type ip_addr


fixed_ips.*.subnet
~~~~~~~~~~~~~~~~~~

Note: Available since 2014.2 (Juno)

Subnet in which to allocate the IP address for this port.

String value expected.

Can be updated without replacement.

Value must be of type neutron.subnet


mac_address
~~~~~~~~~~~

MAC address to give to this port.

String value expected.

Updates cause replacement.

Value must be of type mac_addr


name
~~~~

A symbolic name for this port.

String value expected.

Can be updated without replacement.


port_security_enabled
~~~~~~~~~~~~~~~~~~~~~

Note: Available since 5.0.0 (Liberty)

Flag to enable/disable port security on the port. When disable this
feature(set it to False), there will be no packages filtering, like
security-group and address-pairs.

Boolean value expected.

Can be updated without replacement.


qos_policy
~~~~~~~~~~

Note: Available since 6.0.0 (Mitaka)

The name or ID of QoS policy to attach to this port.

String value expected.

Can be updated without replacement.

Value must be of type neutron.qos_policy


security_groups
~~~~~~~~~~~~~~~

Security group IDs to associate with this port.

List value expected.

Can be updated without replacement.


value_specs
~~~~~~~~~~~

Extra parameters to include in the request.

Map value expected.

Can be updated without replacement.

Defaults to "{}".


replacement_policy
~~~~~~~~~~~~~~~~~~

Note: DEPRECATED since 6.0.0 (Mitaka) - Replacement policy used to work
  around flawed nova/neutron port interaction which has been fixed
  since Liberty.

Note: Available since 2014.2 (Juno)

Policy on how to respond to a stack-update for this resource.
REPLACE_ALWAYS will replace the port regardless of any property
changes. AUTO will update the existing port for any changed
update-allowed property.

String value expected.

Can be updated without replacement.

Defaults to "AUTO".

Allowed values: REPLACE_ALWAYS, AUTO


Attributes
----------


admin_state_up
~~~~~~~~~~~~~~

The administrative state of this port.


allowed_address_pairs
~~~~~~~~~~~~~~~~~~~~~

Additional MAC/IP address pairs allowed to pass through a port.


device_id
~~~~~~~~~

Unique identifier for the device.


device_owner
~~~~~~~~~~~~

Name of the network owning the port.


fixed_ips
~~~~~~~~~

Fixed IP addresses.


mac_address
~~~~~~~~~~~

MAC address of the port.


name
~~~~

Friendly name of the port.


network_id
~~~~~~~~~~

Unique identifier for the network owning the port.


port_security_enabled
~~~~~~~~~~~~~~~~~~~~~

Note: Available since 5.0.0 (Liberty)

Port security enabled of the port.


qos_policy_id
~~~~~~~~~~~~~

Note: Available since 6.0.0 (Mitaka)

The QoS policy ID attached to this port.


security_groups
~~~~~~~~~~~~~~~

A list of security groups for the port.


show
~~~~

Detailed information about resource.


status
~~~~~~

The status of the port.


subnets
~~~~~~~

A list of all subnet attributes for the port.


tenant_id
~~~~~~~~~

Tenant owning the port.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: OS::Neutron::Port
       properties:
         admin_state_up: Boolean
         allowed_address_pairs: [{"ip_address": String, "mac_address": String}, {"ip_address": String, "mac_address": String}, ...]
         binding:vnic_type: String
         device_id: String
         device_owner: String
         fixed_ips: [{"subnet": String, "ip_address": String, "subnet_id": String}, {"subnet": String, "ip_address": String, "subnet_id": String}, ...]
         mac_address: String
         name: String
         network: String
         port_security_enabled: Boolean
         qos_policy: String
         security_groups: [Value, Value, ...]
         value_specs: {...}


OS::Neutron::PortPair
=====================

Note: UNSUPPORTED since 7.0.0 (Newton)

A resource for neutron networking-sfc port-pair.

This plug-in requires networking-sfc>=1.0.0. So to enable this
plug-in, install this library and restart the heat-engine.

A Port Pair represents a service function instance. The ingress port
and the egress port of the service function may be specified. If a
service function has one bidirectional port, the ingress port has the
same value as the egress port.


Required Properties
-------------------


egress
~~~~~~

ID or name of the egress neutron port.

String value expected.

Updates cause replacement.

Value must be of type neutron.port


ingress
~~~~~~~

ID or name of the ingress neutron port.

String value expected.

Updates cause replacement.

Value must be of type neutron.port


Optional Properties
-------------------


description
~~~~~~~~~~~

Description for the Port Pair.

String value expected.

Can be updated without replacement.


name
~~~~

Name for the Port Pair.

String value expected.

Can be updated without replacement.


service_function_parameters
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Dictionary of service function parameter. Currently only
correlation=None is supported.

Map value expected.

Updates cause replacement.

Defaults to "{'correlation': None}".


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
       type: OS::Neutron::PortPair
       properties:
         description: String
         egress: String
         ingress: String
         name: String
         service_function_parameters: {...}


OS::Neutron::QoSDscpMarkingRule
===============================

Note: Available since 7.0.0 (Newton)

A resource for Neutron QoS DSCP marking rule.

This rule can be associated with QoS policy, and then the policy can
be used by neutron port and network, to provide DSCP marking QoS
capabilities.

The default policy usage of this resource is limited to administrators
only.


Required Properties
-------------------


dscp_mark
~~~~~~~~~

DSCP mark between 0 and 56, except 2-6, 42, 44, and 50-54.

Integer value expected.

Can be updated without replacement.

Allowed values: 0, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32,
34, 36, 38, 40, 46, 48, 56


policy
~~~~~~

ID or name of the QoS policy.

String value expected.

Updates cause replacement.

Value must be of type neutron.qos_policy


Optional Properties
-------------------


tenant_id
~~~~~~~~~

The owner tenant ID of this rule.

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
       type: OS::Neutron::QoSDscpMarkingRule
       properties:
         dscp_mark: Integer
         policy: String
         tenant_id: String


OS::Neutron::RBACPolicy
=======================

Note: Available since 6.0.0 (Mitaka)

A Resource for managing RBAC policy in Neutron.

This resource creates and manages Neutron RBAC policy, which allows to
share Neutron networks to subsets of tenants.


Required Properties
-------------------


action
~~~~~~

Action for the RBAC policy.

String value expected.

Updates cause replacement.


object_id
~~~~~~~~~

ID or name of the RBAC object.

String value expected.

Updates cause replacement.


object_type
~~~~~~~~~~~

Type of the object that RBAC policy affects.

String value expected.

Updates cause replacement.


target_tenant
~~~~~~~~~~~~~

ID of the tenant to which the RBAC policy will be enforced.

String value expected.

Can be updated without replacement.


Optional Properties
-------------------


tenant_id
~~~~~~~~~

The owner tenant ID. Only required if the caller has an administrative
role and wants to create a RBAC for another tenant.

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
       type: OS::Neutron::RBACPolicy
       properties:
         action: String
         object_id: String
         object_type: String
         target_tenant: String
         tenant_id: String


OS::Neutron::SecurityGroup
==========================

Note: Available since 2014.1 (Icehouse)

A resource for managing Neutron security groups.

Security groups are sets of IP filter rules that are applied to an
instance's networking. They are project specific, and project members
can edit the default rules for their group and add new rules sets. All
projects have a "default" security group, which is applied to
instances that have no other security group defined.


Optional Properties
-------------------


description
~~~~~~~~~~~

Description of the security group.

String value expected.

Can be updated without replacement.


name
~~~~

A string specifying a symbolic name for the security group, which is
not required to be unique.

String value expected.

Can be updated without replacement.


rules
~~~~~

List of security group rules.

List value expected.

Can be updated without replacement.

Defaults to "[]".

*List contents:*


rules.*
~~~~~~~

Map value expected.

Can be updated without replacement.

*Map properties:*


rules.*.direction
~~~~~~~~~~~~~~~~~

The direction in which the security group rule is applied. For a
compute instance, an ingress security group rule matches traffic that
is incoming (ingress) for that instance. An egress rule is applied to
traffic leaving the instance.

String value expected.

Can be updated without replacement.

Defaults to "ingress".

Allowed values: ingress, egress


rules.*.ethertype
~~~~~~~~~~~~~~~~~

Ethertype of the traffic.

String value expected.

Can be updated without replacement.

Defaults to "IPv4".

Allowed values: IPv4, IPv6


rules.*.port_range_max
~~~~~~~~~~~~~~~~~~~~~~

The maximum port number in the range that is matched by the security
group rule. The port_range_min attribute constrains the port_range_max
attribute. If the protocol is ICMP, this value must be an ICMP type.

Integer value expected.

Can be updated without replacement.

The value must be in the range 0 to 65535.


rules.*.port_range_min
~~~~~~~~~~~~~~~~~~~~~~

The minimum port number in the range that is matched by the security
group rule. If the protocol is TCP or UDP, this value must be less
than or equal to the value of the port_range_max attribute. If the
protocol is ICMP, this value must be an ICMP type.

Integer value expected.

Can be updated without replacement.

The value must be in the range 0 to 65535.


rules.*.protocol
~~~~~~~~~~~~~~~~

The protocol that is matched by the security group rule. Valid values
include tcp, udp, and icmp.

String value expected.

Can be updated without replacement.


rules.*.remote_group_id
~~~~~~~~~~~~~~~~~~~~~~~

The remote group ID to be associated with this security group rule. If
no value is specified then this rule will use this security group for
the remote_group_id. The remote mode parameter must be set to
"remote_group_id".

String value expected.

Can be updated without replacement.

Value must be of type neutron.security_group


rules.*.remote_ip_prefix
~~~~~~~~~~~~~~~~~~~~~~~~

The remote IP prefix (CIDR) to be associated with this security group
rule.

String value expected.

Can be updated without replacement.

Value must be of type net_cidr


rules.*.remote_mode
~~~~~~~~~~~~~~~~~~~

Whether to specify a remote group or a remote IP prefix.

String value expected.

Can be updated without replacement.

Defaults to "remote_ip_prefix".

Allowed values: remote_ip_prefix, remote_group_id


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
       type: OS::Neutron::SecurityGroup
       properties:
         description: String
         name: String
         rules: [{"port_range_max": Integer, "remote_mode": String, "direction": String, "remote_group_id": String, "protocol": String, "ethertype": String, "remote_ip_prefix": String, "port_range_min": Integer}, {"port_range_max": Integer, "remote_mode": String, "direction": String, "remote_group_id": String, "protocol": String, "ethertype": String, "remote_ip_prefix": String, "port_range_min": Integer}, ...]


OS::Neutron::SecurityGroupRule
==============================

Note: Available since 7.0.0 (Newton)

A resource for managing Neutron security group rules.

Rules to use in security group resource.


Required Properties
-------------------


security_group
~~~~~~~~~~~~~~

Security group name or ID to add rule.

String value expected.

Updates cause replacement.

Value must be of type neutron.security_group


Optional Properties
-------------------


description
~~~~~~~~~~~

Description of the security group rule.

String value expected.

Updates cause replacement.


direction
~~~~~~~~~

The direction in which the security group rule is applied. For a
compute instance, an ingress security group rule matches traffic that
is incoming (ingress) for that instance. An egress rule is applied to
traffic leaving the instance.

String value expected.

Updates cause replacement.

Defaults to "ingress".

Allowed values: ingress, egress


ethertype
~~~~~~~~~

Ethertype of the traffic.

String value expected.

Updates cause replacement.

Defaults to "IPv4".

Allowed values: IPv4, IPv6


port_range_max
~~~~~~~~~~~~~~

The maximum port number in the range that is matched by the security
group rule. The port_range_min attribute constrains the port_range_max
attribute. If the protocol is ICMP, this value must be an ICMP code.

Integer value expected.

Updates cause replacement.

The value must be in the range 0 to 65535.


port_range_min
~~~~~~~~~~~~~~

The minimum port number in the range that is matched by the security
group rule. If the protocol is TCP or UDP, this value must be less
than or equal to the value of the port_range_max attribute. If the
protocol is ICMP, this value must be an ICMP type.

Integer value expected.

Updates cause replacement.

The value must be in the range 0 to 65535.


protocol
~~~~~~~~

The protocol that is matched by the security group rule. Allowed
values are ah, dccp, egp, esp, gre, icmp, icmpv6, igmp, ipv6-encap,
ipv6-frag, ipv6-icmp, ipv6-nonxt, ipv6-opts, ipv6-route, ospf, pgm,
rsvp, sctp, tcp, udp, udplite, vrrp and integer representations
[0-255].

String value expected.

Updates cause replacement.

Defaults to "tcp".

Allowed values: 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49,
50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66,
67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83,
84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100,
101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114,
115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128,
129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142,
143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156,
157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170,
171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184,
185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198,
199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212,
213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226,
227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240,
241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254,
255, ah, dccp, egp, esp, gre, icmp, icmpv6, igmp, ipv6-encap,
ipv6-frag, ipv6-icmp, ipv6-nonxt, ipv6-opts, ipv6-route, ospf, pgm,
rsvp, sctp, tcp, udp, udplite, vrrp


remote_group
~~~~~~~~~~~~

The remote group name or ID to be associated with this security group
rule.

String value expected.

Updates cause replacement.

Value must be of type neutron.security_group


remote_ip_prefix
~~~~~~~~~~~~~~~~

The remote IP prefix (CIDR) to be associated with this security group
rule.

String value expected.

Updates cause replacement.

Value must be of type net_cidr


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
       type: OS::Neutron::SecurityGroupRule
       properties:
         description: String
         direction: String
         ethertype: String
         port_range_max: Integer
         port_range_min: Integer
         protocol: String
         remote_group: String
         remote_ip_prefix: String
         security_group: String


OS::Neutron::Subnet
===================

A resource for managing Neutron subnets.

A subnet represents an IP address block that can be used for assigning
IP addresses to virtual instances. Each subnet must have a CIDR and
must be associated with a network. IPs can be either selected from the
whole subnet CIDR, or from "allocation pools" that can be specified by
the user.


Required Properties
-------------------


network
~~~~~~~

Note: Available since 2014.2 (Juno)

The ID of the attached network.

String value expected.

Updates cause replacement.

Value must be of type neutron.network


Optional Properties
-------------------


allocation_pools
~~~~~~~~~~~~~~~~

The start and end addresses for the allocation pools.

List value expected.

Can be updated without replacement.

*List contents:*


allocation_pools.*
~~~~~~~~~~~~~~~~~~

Map value expected.

Can be updated without replacement.

*Map properties:*


allocation_pools.*.end
~~~~~~~~~~~~~~~~~~~~~~

End address for the allocation pool.

String value expected.

Can be updated without replacement.

Value must be of type ip_addr


allocation_pools.*.start
~~~~~~~~~~~~~~~~~~~~~~~~

Start address for the allocation pool.

String value expected.

Can be updated without replacement.

Value must be of type ip_addr


cidr
~~~~

The CIDR.

String value expected.

Updates cause replacement.

Value must be of type net_cidr


dns_nameservers
~~~~~~~~~~~~~~~

A specified set of DNS name servers to be used.

List value expected.

Can be updated without replacement.

Defaults to "[]".


enable_dhcp
~~~~~~~~~~~

Set to true if DHCP is enabled and false if DHCP is disabled.

Boolean value expected.

Can be updated without replacement.

Defaults to "True".


gateway_ip
~~~~~~~~~~

The gateway IP address. Set to any of [ null | ~ | "" ] to
create/update a subnet without a gateway. If omitted when creation,
neutron will assign the first free IP address within the subnet to the
gateway automatically. If remove this from template when update, the
old gateway IP address will be detached.

String value expected.

Can be updated without replacement.


host_routes
~~~~~~~~~~~

A list of host route dictionaries for the subnet.

List value expected.

Can be updated without replacement.

*List contents:*


host_routes.*
~~~~~~~~~~~~~

Map value expected.

Can be updated without replacement.

*Map properties:*


host_routes.*.destination
~~~~~~~~~~~~~~~~~~~~~~~~~

The destination for static route.

String value expected.

Can be updated without replacement.

Value must be of type net_cidr


host_routes.*.nexthop
~~~~~~~~~~~~~~~~~~~~~

The next hop for the destination.

String value expected.

Can be updated without replacement.

Value must be of type ip_addr


ip_version
~~~~~~~~~~

The IP version, which is 4 or 6.

Integer value expected.

Updates cause replacement.

Defaults to "4".

Allowed values: 4, 6


ipv6_address_mode
~~~~~~~~~~~~~~~~~

Note: Available since 2015.1 (Kilo)

IPv6 address mode.

String value expected.

Updates cause replacement.

Allowed values: dhcpv6-stateful, dhcpv6-stateless, slaac


ipv6_ra_mode
~~~~~~~~~~~~

Note: Available since 2015.1 (Kilo)

IPv6 RA (Router Advertisement) mode.

String value expected.

Updates cause replacement.

Allowed values: dhcpv6-stateful, dhcpv6-stateless, slaac


name
~~~~

The name of the subnet.

String value expected.

Can be updated without replacement.


prefixlen
~~~~~~~~~

Note: Available since 6.0.0 (Mitaka)

Prefix length for subnet allocation from subnet pool.

Integer value expected.

Updates cause replacement.

The value must be at least 0.


subnetpool
~~~~~~~~~~

Note: Available since 6.0.0 (Mitaka)

The name or ID of the subnet pool.

String value expected.

Updates cause replacement.

Value must be of type neutron.subnetpool


tenant_id
~~~~~~~~~

The ID of the tenant who owns the network. Only administrative users
can specify a tenant ID other than their own.

String value expected.

Updates cause replacement.


value_specs
~~~~~~~~~~~

Extra parameters to include in the request.

Map value expected.

Can be updated without replacement.

Defaults to "{}".


Attributes
----------


allocation_pools
~~~~~~~~~~~~~~~~

Ip allocation pools and their ranges.


cidr
~~~~

CIDR block notation for this subnet.


dns_nameservers
~~~~~~~~~~~~~~~

List of dns nameservers.


enable_dhcp
~~~~~~~~~~~

'true' if DHCP is enabled for this subnet; 'false' otherwise.


gateway_ip
~~~~~~~~~~

Ip of the subnet's gateway.


host_routes
~~~~~~~~~~~

Additional routes for this subnet.


ip_version
~~~~~~~~~~

Ip version for the subnet.


name
~~~~

Friendly name of the subnet.


network_id
~~~~~~~~~~

Parent network of the subnet.


show
~~~~

Detailed information about resource.


tenant_id
~~~~~~~~~

Tenant owning the subnet.


HOT Syntax
----------

::

   heat_template_version: 2015-04-30
   ...
   resources:
     ...
     the_resource:
       type: OS::Neutron::Subnet
       properties:
         allocation_pools: [{"end": String, "start": String}, {"end": String, "start": String}, ...]
         cidr: String
         dns_nameservers: [Value, Value, ...]
         enable_dhcp: Boolean
         gateway_ip: String
         host_routes: [{"destination": String, "nexthop": String}, {"destination": String, "nexthop": String}, ...]
         ip_version: Integer
         ipv6_address_mode: String
         ipv6_ra_mode: String
         name: String
         network: String
         prefixlen: Integer
         subnetpool: String
         tenant_id: String
         value_specs: {...}


OS::Nova::KeyPair
=================

Note: Available since 2014.1 (Icehouse)

A resource for creating Nova key pairs.

A keypair is a ssh key that can be injected into a server on launch.

**Note** that if a new key is generated setting *save_private_key* to
*True* results in the system saving the private key which can then be
retrieved via the *private_key* attribute of this resource.

Setting the *public_key* property means that the *private_key*
attribute of this resource will always return an empty string
regardless of the *save_private_key* setting since there will be no
private key data to save.


Required Properties
-------------------


name
~~~~

The name of the key pair.

String value expected.

Updates cause replacement.

The length must be in the range 1 to 255.


Optional Properties
-------------------


public_key
~~~~~~~~~~

The optional public key. This allows users to supply the public key
from a pre-existing key pair. If not supplied, a new key pair will be
generated.

String value expected.

Updates cause replacement.


save_private_key
~~~~~~~~~~~~~~~~

True if the system should remember a generated private key; False
otherwise.

Boolean value expected.

Updates cause replacement.

Defaults to "False".


Attributes
----------


private_key
~~~~~~~~~~~

The private key if it has been saved.


public_key
~~~~~~~~~~

The public key.


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
       type: OS::Nova::KeyPair
       properties:
         name: String
         public_key: String
         save_private_key: Boolean


OS::Nova::Server
================

Resource for Rackspace Cloud Servers.

This resource overloads existent integrated OS::Nova::Server resource
and is used for Rackspace Cloud Servers.


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
configuration. POLL_TEMP_URL is the only supported transport on
Rackspace Cloud. This property is retained for compatibility.

String value expected.

Can be updated without replacement.

Defaults to "POLL_TEMP_URL".

Allowed values: POLL_TEMP_URL


user_data
~~~~~~~~~

User data script to be executed by cloud-init.

String value expected.

Can be updated without replacement.

Defaults to "".


user_data_format
~~~~~~~~~~~~~~~~

How the user_data should be formatted for the server. For RAW the
user_data is passed to Nova unmodified. For SOFTWARE_CONFIG user_data
is bundled as part of the software config data, and metadata is
derived from any associated SoftwareDeployment resources.

String value expected.

Updates cause replacement.

Defaults to "RAW".

Allowed values: RAW, SOFTWARE_CONFIG


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
       type: OS::Nova::Server
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
         scheduler_hints: {...}
         security_groups: [Value, Value, ...]
         software_config_transport: String
         user_data: String
         user_data_format: String
         user_data_update_policy: String


OS::Swift::Container
====================

A resource for managing Swift containers.

A container defines a namespace for objects. An object with the same
name in two different containers represents two different objects.


Optional Properties
-------------------


PurgeOnDelete
~~~~~~~~~~~~~

Note: Available since 2015.1 (Kilo)

If True, delete any objects in the container when the container is
deleted. Otherwise, deleting a non-empty container will result in an
error.

Boolean value expected.

Updates cause replacement.

Defaults to "False".


X-Account-Meta
~~~~~~~~~~~~~~

A map of user-defined meta data to associate with the account. Each
key in the map will set the header X-Account-Meta-{key} with the
corresponding value.

Map value expected.

Updates cause replacement.

Defaults to "{}".


X-Container-Meta
~~~~~~~~~~~~~~~~

A map of user-defined meta data to associate with the container. Each
key in the map will set the header X-Container-Meta-{key} with the
corresponding value.

Map value expected.

Updates cause replacement.

Defaults to "{}".


X-Container-Read
~~~~~~~~~~~~~~~~

Specify the ACL permissions on who can read objects in the container.

String value expected.

Updates cause replacement.


X-Container-Write
~~~~~~~~~~~~~~~~~

Specify the ACL permissions on who can write objects to the container.

String value expected.

Updates cause replacement.


name
~~~~

Name for the container. If not specified, a unique name will be
generated.

String value expected.

Updates cause replacement.


Attributes
----------


BytesUsed
~~~~~~~~~

The number of bytes stored in the container.


DomainName
~~~~~~~~~~

The host from the container URL.


HeadContainer
~~~~~~~~~~~~~

A map containing all headers for the container.


ObjectCount
~~~~~~~~~~~

The number of objects stored in the container.


RootURL
~~~~~~~

The parent URL of the container.


WebsiteURL
~~~~~~~~~~

The URL of the container.


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
       type: OS::Swift::Container
       properties:
         PurgeOnDelete: Boolean
         X-Account-Meta: {...}
         X-Container-Meta: {...}
         X-Container-Read: String
         X-Container-Write: String
         name: String


OS::Trove::Instance
===================

Note: Available since 2014.1 (Icehouse)

OpenStack cloud database instance resource.

Trove is Database as a Service for OpenStack. It's designed to run
entirely on OpenStack, with the goal of allowing users to quickly and
easily utilize the features of a relational or non-relational database
without the burden of handling complex administrative tasks.


Required Properties
-------------------


flavor
~~~~~~

Reference to a flavor for creating DB instance.

String value expected.

Can be updated without replacement.

Value must be of type trove.flavor


size
~~~~

Database volume size in GB.

Integer value expected.

Can be updated without replacement.

The value must be in the range 1 to 150.


Optional Properties
-------------------


availability_zone
~~~~~~~~~~~~~~~~~

Name of the availability zone for DB instance.

String value expected.

Updates cause replacement.


databases
~~~~~~~~~

List of databases to be created on DB instance creation.

List value expected.

Can be updated without replacement.

Defaults to "[]".

*List contents:*


databases.*
~~~~~~~~~~~

Map value expected.

Can be updated without replacement.

*Map properties:*


databases.*.character_set
~~~~~~~~~~~~~~~~~~~~~~~~~

Set of symbols and encodings.

String value expected.

Can be updated without replacement.

Defaults to "utf8".


databases.*.collate
~~~~~~~~~~~~~~~~~~~

Set of rules for comparing characters in a character set.

String value expected.

Can be updated without replacement.

Defaults to "utf8_general_ci".


databases.*.name
~~~~~~~~~~~~~~~~

Specifies database names for creating databases on instance creation.

String value expected.

Can be updated without replacement.

The length must be no greater than 64.

Value must match pattern: [a-zA-Z0-9_]+[a-zA-Z0-9_@?#\s]*[a-zA-Z0-9_]+


datastore_type
~~~~~~~~~~~~~~

Name of registered datastore type.

String value expected.

Updates cause replacement.

The length must be no greater than 255.


datastore_version
~~~~~~~~~~~~~~~~~

Name of the registered datastore version. It must exist for provided
datastore type. Defaults to using single active version. If several
active versions exist for provided datastore type, explicit value for
this parameter must be specified.

String value expected.

Updates cause replacement.

The length must be no greater than 255.


name
~~~~

Name of the DB instance to create.

String value expected.

Can be updated without replacement.

The length must be no greater than 255.


networks
~~~~~~~~

List of network interfaces to create on instance.

List value expected.

Updates cause replacement.

Defaults to "[]".

*List contents:*


networks.*
~~~~~~~~~~

Map value expected.

Updates cause replacement.

*Map properties:*


networks.*.fixed_ip
~~~~~~~~~~~~~~~~~~~

Fixed IPv4 address for this NIC.

String value expected.

Updates cause replacement.

Value must be of type ip_addr


networks.*.network
~~~~~~~~~~~~~~~~~~

Name or UUID of the network to attach this NIC to. Either port or
network must be specified.

String value expected.

Updates cause replacement.

Value must be of type neutron.network


networks.*.port
~~~~~~~~~~~~~~~

Name or UUID of Neutron port to attach this NIC to. Either port or
network must be specified.

String value expected.

Updates cause replacement.

Value must be of type neutron.port


replica_count
~~~~~~~~~~~~~

Note: Available since 5.0.0 (Liberty)

The number of replicas to be created.

Integer value expected.

Updates cause replacement.


replica_of
~~~~~~~~~~

Note: Available since 5.0.0 (Liberty)

Identifier of the source instance to replicate.

String value expected.

Updates cause replacement.


restore_point
~~~~~~~~~~~~~

DB instance restore point.

String value expected.

Updates cause replacement.


users
~~~~~

List of users to be created on DB instance creation.

List value expected.

Can be updated without replacement.

Defaults to "[]".

*List contents:*


users.*
~~~~~~~

Map value expected.

Can be updated without replacement.

*Map properties:*


users.*.databases
~~~~~~~~~~~~~~~~~

Names of databases that those users can access on instance creation.

List value expected.

Can be updated without replacement.

The length must be at least 1.

*List contents:*


users.*.databases.*
~~~~~~~~~~~~~~~~~~~

String value expected.

Can be updated without replacement.


users.*.host
~~~~~~~~~~~~

The host from which a user is allowed to connect to the database.

String value expected.

Can be updated without replacement.

Defaults to "%".


users.*.name
~~~~~~~~~~~~

User name to create a user on instance creation.

String value expected.

Can be updated without replacement.

The length must be no greater than 16.

Value must match pattern: [a-zA-Z0-9_]+[a-zA-Z0-9_@?#\s]*[a-zA-Z0-9_]+


users.*.password
~~~~~~~~~~~~~~~~

Password for those users on instance creation.

String value expected.

Can be updated without replacement.

Value must match pattern: [a-zA-Z0-9_]+[a-zA-Z0-9_@?#\s]*[a-zA-Z0-9_]+


Attributes
----------


hostname
~~~~~~~~

Hostname of the instance.


href
~~~~

Api endpoint reference of the instance.


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
       type: OS::Trove::Instance
       properties:
         availability_zone: String
         databases: [{"character_set": String, "name": String, "collate": String}, {"character_set": String, "name": String, "collate": String}, ...]
         datastore_type: String
         datastore_version: String
         flavor: String
         name: String
         networks: [{"port": String, "network": String, "fixed_ip": String}, {"port": String, "network": String, "fixed_ip": String}, ...]
         replica_count: Integer
         replica_of: String
         restore_point: String
         size: Integer
         users: [{"name": String, "password": String, "host": String, "databases": [String, String, ...]}, {"name": String, "password": String, "host": String, "databases": [String, String, ...]}, ...]


OS::Zaqar::Queue
================

Note: Available since 2014.2 (Juno)

A resource for managing Zaqar queues.

Queue is a logical entity that groups messages. Ideally a queue is
created per work type. For example, if you want to compress files, you
would create a queue dedicated for this job. Any application that
reads from this queue would only compress files.


Required Properties
-------------------


name
~~~~

Name of the queue instance to create.

String value expected.

Updates cause replacement.


Optional Properties
-------------------


metadata
~~~~~~~~

Arbitrary key/value metadata to store contextual information about
this queue.

Map value expected.

Can be updated without replacement.


Attributes
----------


href
~~~~

The resource href of the queue.


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
       type: OS::Zaqar::Queue
       properties:
         metadata: {...}
         name: String
