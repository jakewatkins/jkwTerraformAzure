#
#
#

$keyvault = "jwkvCoreVault1223"

write-host "Creating Managed Service Identity (MSI) for Terraform"
$subscription = (az account list --query "[?isDefault]" | out-string | convertfrom-json)
write-host "Tenant & Subscription: $($subscription.tenantId) -  $($subscription.id)"

$tfmsi = (az ad sp create-for-rbac --name mytf-msi --role Contributor --scopes “/subscriptions/$($subscription.id)” | out-string | convertfrom-json)

write-host "MSI: $($tfmsi.appId) - $($tfmsi.password)"

write-host "Storing values in keyvault"
az keyvault secret set --name “tfClientId” --vault-name $keyvault --value $tfmsi.appId
az keyvault secret set --name “tfClientSecret” --vault-name $keyvault --value $tfmsi.password
az keyvault secret set --name “subscriptionId” --vault-name $keyvault --value $subscription.id
az keyvault secret set --name “tenantId” --vault-name $keyvault --value $subscription.tenantId

