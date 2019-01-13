New-AzureRmResourceGroup -Name docker-engine-api -Location "Australia East"

New-AzureRmNetworkSecurityGroup -Name "NSG-DockerClient" -Location "Australia East" ResourceGroupName

Get-AzureNetworkSecurityGroup -Name "NSG-FrontEnd" `
  | Set-AzureNetworkSecurityRule -Name ssh-rule `
  -Action Allow -Protocol TCP -Type Inbound -Priority 200 `
  -SourceAddressPrefix 10.0.1.0/24  -SourcePortRange '*' `
  -DestinationAddressPrefix '*' -DestinationPortRange 22
