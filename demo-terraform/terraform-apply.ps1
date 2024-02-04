#
#
#

$keyVaultName="--keyvault-name--"

# get values from the KV
$subscriptionId= az keyvault secret show --vault-name $keyVaultName --name "SubscriptionId"  --query "value"
$client_id=az keyvault secret show --vault-name $keyVaultName --name "tfClientId"  --query "value"
$client_secret=az keyvault secret show --vault-name $keyVaultName --name "tfSecretId"  --query "value"
$tenant_id=az keyvault secret show --vault-name $keyVaultName --name "tenantId"  --query "value"

terraform apply -auto-approve  -var "subscription_id=$subscriptionId" -var "client_id=$client_id" -var "client_secret=$client_secret" -var "tenant_id=$tenant_id"
