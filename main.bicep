param location string = resourceGroup().location

@secure()
param adminPassword string = newGuid()

module storageModule './modules/storage-account/storage-account.bicep' = {
  name: 'JeffDeployment'
  params: {
    storageAccountName: 'myniquedfgjhdghjndrsgty'
    location: location
    skuName: 'Standard_LRS'
    kind: 'StorageV2'
  }
}


module dataFactory './modules/azure-data-factory/azure-data-factory-2.bicep' = {
  name: 'jeff-carroll-adf'
  params: {
    deploymentStage: 'dev'
    applicationName: 'jeffApp'
    applicationId: 'a'
    businessUnit: 'SET'
    location: location
    tags: {
      deploymentStage: 'dev'
      applicationName: 'jeffApp'
      applicationId: 'a'
      businessUnit: 'SET'
    }
    stName: storageModule.name
    sqlServerName: sqlServer.name
    sqlDbNames: [
      db.name
    ]
  }
}

module sqlServer './modules/sql-server/sql-server.bicep' = {
  name: 'jeffSqlServer'
  
  params: {
    location: location
    administratorLogin: 'sql-server-admin'
    administratorLoginPassword: adminPassword
    sqlServerName: 'jeffSqlServer'
    
  }
}


module db './modules/sql-db/sql-db.bicep' = {
  name: 'jeffdb'

  params: {
    location: location
    sqlServerName: sqlServer.name
    databaseName: 'jeffDb'
  }
}
