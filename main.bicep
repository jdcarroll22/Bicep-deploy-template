param location string = resourceGroup().location

module storageModule './modules/storage-account/storage-account.bicep' = {
  name: 'JeffDeployment'
  params: {
    storageAccountName: 'myUniqueStorageAccountName'
    location: location
    skuName: 'Standard_LRS'
    kind: 'StorageV2'
  }
}
