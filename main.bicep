module storageModule './modules/storage-account/storage-account.bicep' = {
  name: deploymentName
  params: {
    storageAccountName: 'myUniqueStorageAccountName'
    location: resourceGroup().location
    skuName: 'Standard_LRS'
    accessTier: 'Hot'
    kind: 'StorageV2'
    keySource: 'Microsoft.Storage'
    blob_enabled: true
    supportsHttpsTrafficOnly: true
  }
}
