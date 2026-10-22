@description('Name of the virtual network')
param vnetName string

@description('Azure region')
param location string = resourceGroup().location

@description('Address space of the VNet')
param addressPrefix string = '10.0.0.0/16'

@description('List of subnets')
param subnets array = [
  {
    name: 'web'
    prefix: '10.0.1.0/24'
  }
  {
    name: 'app'
    prefix: '10.0.2.0/24'
  }
]

@description('Tags for the VNet')
param tags object = {}

resource vnet 'Microsoft.Network/virtualNetworks@2023-09-01' = {
  name: vnetName
  location: location
  tags: tags
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [for s in subnets: {
      name: s.name
      properties: {
        addressPrefix: s.prefix
      }
    }]
  }
}

output vnetId string = vnet.id
output vnetName string = vnet.name
output subnetNames array = [for s in subnets: s.name]
