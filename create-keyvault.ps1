#
#  assumes that you've already logged in (az login)
#

param(
    [Parameter(mandatory=$true)]
    [string] $initials
)

$location = "southcentralus"
$resNumber = (get-random -minimum 1000 -maximum 9999 | out-string) -replace "`n", ""
$resourceGroupName = $initials + "Resources" + $resNumber
$keyVaultName = $initials + "KeyVault" + $resNumber

write-host "Resource Group: $resourceGroupName"
write-host "Key Vault: $keyVaultName"


az group create --location $location --name $resourceGroupName
az keyvault create --resource-group $resourceGroupName --name $keyVaultName


