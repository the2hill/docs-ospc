

Authentication
-----------------

To use this service you have to authenticate first. To do this, you will need
your Rackspace username and API key. Your username is the one you use to login
to the Cloud Control Panel at http://mycloud.rackspace.com/.

To find your API key, use the instructions in
`View and reset your API key <https://support.rackspace.com/how-to/view-and-reset-your-api-key/>`_.

You can specify a default **region**. Here is a list of available regions:

* DFW (Dallas-Fort Worth, TX, US)
* HKG (Hong Kong, China)
* IAD (Blacksburg, VA, US)
* LON (London, England)
* SYD (Sydney, Australia)

Some users have access to another region in ORD (Chicago, IL). New users will
not have this region.

Once you have these pieces of information, you can pass them into the SDK by
replacing **{username}**, **{apiKey}**, and **{region}** with your info:
