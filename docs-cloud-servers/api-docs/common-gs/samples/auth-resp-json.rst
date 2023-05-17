.. _auth-response-example:

.. code:: 

   {
      "access": {
         "serviceCatalog": [
            {
               "endpoints": [
                  {
                     "internalURL": "https://snet-storage101.dfw1.clouddrive.com/v1/MossoCloudFS_530f8649-324c-499c-a075-2195854d52a7", 
                     "publicURL": "https://storage101.dfw1.clouddrive.com/v1/MossoCloudFS_530f8649-324c-499c-a075-2195854d52a7", 
                     "region": "DFW", 
                     "tenantId": "MossoCloudFS_530f8649-324c-499c-a075-2195854d52a7"
                  }, 
                  {
                     "internalURL": "https://snet-storage101.ord1.clouddrive.com/v1/MossoCloudFS_530f8649-324c-499c-a075-2195854d52a7", 
                     "publicURL": "https://storage101.ord1.clouddrive.com/v1/MossoCloudFS_530f8649-324c-499c-a075-2195854d52a7", 
                     "region": "ORD", 
                     "tenantId": "MossoCloudFS_530f8649-324c-499c-a075-2195854d52a7"
                  }
               ], 
               "name": "cloudFiles", 
               "type": "object-store"
            }, 
            {
               "endpoints": [
                  {
                     "publicURL": "https://servers.api.rackspacecloud.com/v1.0/010101", 
                     "tenantId": "010101", 
                     "versionId": "1.0", 
                     "versionInfo": "https://servers.api.rackspacecloud.com/v1.0", 
                     "versionList": "https://servers.api.rackspacecloud.com/"
                   }
               ], 
               "name": "cloudServers", 
               "type": "compute"
             }, 
            {
               "endpoints": [ 
                  {
                     "publicURL": "https://dfw.servers.api.rackspacecloud.com/v2/010101", 
                     "region": "DFW", 
                     "tenantId": "010101", 
                     "versionId": "2", 
                     "versionInfo": "https://dfw.servers.api.rackspacecloud.com/v2", 
                     "versionList": "https://dfw.servers.api.rackspacecloud.com/"
                  }, 
                  {
                      "publicURL": "https://ord.servers.api.rackspacecloud.com/v2/010101", 
                      "region": "ORD", 
                      "tenantId": "010101", 
                      "versionId": "2", 
                      "versionInfo": "https://ord.servers.api.rackspacecloud.com/v2", 
                      "versionList": "https://ord.servers.api.rackspacecloud.com/"
                  }
               ], 
               "name": "cloudServersOpenStack", 
               "type": "compute"
            }
         ], 
         "token": {
            "expires": "2012-09-14T15:11:57.585-05:00", 
            "id": "858fb4c2-bf15-4dac-917d-8ec750ae9baa", 
            "tenant": {
               "id": "010101", 
               "name": "010101"
            }
         }, 
         "user": {
            "RAX-AUTH:defaultRegion": "DFW", 
            "id": "170454", 
            "name": "MyRackspaceAcct", 
            "roles": [
               {
                  "description": "User Admin Role.", 
                  "id": "3", 
                  "name": "identity:user-admin"
               }
            ]
         }
      }
   }