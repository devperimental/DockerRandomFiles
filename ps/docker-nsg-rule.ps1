Get-AzureNetworkSecurityGroup -Name "NSG-FrontEnd" `
  | Set-AzureNetworkSecurityRule -Name docker-rule `
  -Action Allow -Protocol TCP -Type Inbound -Priority 100 `
  -SourceAddressPrefix 10.0.1.0/24  -SourcePortRange '*' `
  -DestinationAddressPrefix '*' -DestinationPortRange 2375