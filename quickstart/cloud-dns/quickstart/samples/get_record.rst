.. code-block:: csharp

  DomainId domainId = new DomainId("{domainId}");
  Task<ReadOnlyCollection<DnsRecord>> recordsList = 
	(await cloudDNSProvider.ListRecordsAsync(
		domainId, 
		DnsRecordType.Mx, 
		null, 
		null, 
		null, 
		null, 
		CancellationToken.None)).Item1.GetAllPagesAsync(CancellationToken.None, null);

.. code-block:: go

  // Not currently supported by this SDK

.. code-block:: java

  RecordApi recordApi = cloudDNSApi.getRecordApi({domainId}});

  RecordDetail record = recordApi.get({recordId}});

.. code-block:: javascript

  rackspace.getRecord(myZone, '{recordId}', function (err, rec) {
    if (err) {
      console.dir(err);
      return;
    }
    console.log('Record ' + rec.name + ' was successfully retrieved.');
  });

.. code-block:: php

  // First define your record's ID
  $recordId = '{recordId}';

  // Alternatively, if you do not know your record ID:
  $records = $domain->recordList(array(
      'name' => 'imap.example.com',
      'type' => 'MX'
  ));

  foreach ($records as $record) {
      $recordId = $record->id;
      break;
  }

  // Now, to get the full record object:
  $record = $domain->record($recordId);

.. code-block:: python

  record = domain.get_record('{recordId}')

.. code-block:: ruby

  record = my_zone.records.get('{recordId}')

.. code-block:: sh

  curl -X GET $ENDPOINT/domains/{domainId}/records/{recordId} \
    -H "X-Auth-Token: $TOKEN" \
    -H "Content-Type: application/json" | python -m json.tool
