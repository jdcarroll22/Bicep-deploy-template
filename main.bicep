param location string = resourceGroup().location

module storageModule './modules/storage-account/storage-account.bicep' = {
  name: 'JeffDeployment'
  params: {
    storageAccountName: 'myniquedfgjhdghjndrsgty'
    location: location
    skuName: 'Standard_LRS'
    kind: 'StorageV2'
  }
}


module dataFactory './modules/azure-data-factory/azure-data-factory.bicep' = {
  name: 'jeff-carroll-adf'
  params: {
    factoryName: 'gsdfgseertg1234sdfrw45tsg'
    location: location
    vnetName: 'Jeff-vnet'
  }
}
