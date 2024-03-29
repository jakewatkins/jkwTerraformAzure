
$keyVaultName="--keyvault-name--"

# get values from the KV
$env:ARM_SUBSCRIPTION_ID = az keyvault secret show --vault-name $keyVaultName --name "SubscriptionId"  --query "value"
$env:ARM_CLIENT_ID = az keyvault secret show --vault-name $keyVaultName --name "tfClientId"  --query "value"
$env:ARM_CLIENT_SECRET = az keyvault secret show --vault-name $keyVaultName --name "tfSecretId"  --query "value"
$env:ARM_TENANT_ID = az keyvault secret show --vault-name $keyVaultName --name "tenantId"  --query "value"
