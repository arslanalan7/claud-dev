param storageName string = 'stg${uniqueString(resourceGroup().id)}'
param location string = resourceGroup().location

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageName
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
  
  // Blob Service definition
  resource blobService 'blobServices@2021-02-01' = {
    name: 'default'
    
    // Container definition
    resource container 'containers@2021-02-01' = {
      name: 'container${uniqueString(resourceGroup().id)}'
    }
  }
}
