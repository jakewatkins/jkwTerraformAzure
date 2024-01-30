#
#
#

az login
$subscription = az account subscription list  | out-string | ConvertFrom-Json
$activeSub = $subscription[0] 
az account set --subscription $activeSub.id
