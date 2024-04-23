module storageModule './modules/storage-account/storage-account.bicep' = {
  name: deploymentName
  params: {
    storageAccountName: 'myUniqueStorageAccountName'
    location string = resourceGroup().location
    skuName string = 'Standard_LRS'
    accessTier string = 'Hot'
    kind string = 'StorageV2'
    keySource string = 'Microsoft.Storage'
    blob_enabled bool = true
    supportsHttpsTrafficOnly bool = true
  }
}
