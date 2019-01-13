New-AzureRmResourceGroup -Name docker-engine-api -Location "Australia East"

New-AzureNetworkSecurityGroup -Name "NSG-DockerClient" -Location "Australia East"

Get-AzureNetworkSecurityGroup -Name "NSG-FrontEnd" `
  | Set-AzureNetworkSecurityRule -Name docker-rule `
  -Action Allow -Protocol TCP -Type Inbound -Priority 100 `
  -SourceAddressPrefix 10.0.1.0/24  -SourcePortRange '*' `
  -DestinationAddressPrefix '*' -DestinationPortRange 2375
  
Get-AzureNetworkSecurityGroup -Name "NSG-FrontEnd" `
  | Set-AzureNetworkSecurityRule -Name ssh-rule `
  -Action Allow -Protocol TCP -Type Inbound -Priority 200 `
  -SourceAddressPrefix 10.0.1.0/24  -SourcePortRange '*' `
  -DestinationAddressPrefix '*' -DestinationPortRange 22
