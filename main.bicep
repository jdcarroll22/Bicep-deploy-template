param location string = resourceGroup().location

module storageModule './modules/storage-account/storage-account.bicep' = {
  name: 'Jeff Deployment'
  params: {
    storageAccountName: 'myUniqueStorageAccountName'
    location: location
    skuName: 'Standard_LRS'
    accessTier: 'Hot'
    kind: 'StorageV2'
    keySource: 'Microsoft.Storage'
    blob_enabled: true
    supportsHttpsTrafficOnly: true
  }
}
