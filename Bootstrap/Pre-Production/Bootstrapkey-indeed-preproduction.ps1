###################################################################################################################################################################################################################
#  Terraform BootStrapper
#
#  Version 2.0.0 @ 19-08-2020
#
# Creates resources for terraform deployments
# - Resource Group
#   + KeyVault with soft delete enabled
#   + Storage Account with 7 day retention policy
#   + Container for terraform remote state files
#   + IAM polcies to allow terraform SPN access to above resources
#
# If you need to remove a keyvault with soft delete : 'Remove-AzKeyVault -VaultName $keyVaultName -InRemovedState -Location $location'
#
# For destructions see :-
# https://dev.azure.com/coopshared/azurerm-terraform-templates/_wiki/wikis/azurerm-terraform-templates.wiki/123/Bootstrap
# 
# Version History
#
# v1.0.0
# v1.0.1 minor tweaks, key vault permissions fixed.
# v2.0.0 New az modules have introduced a large number of changes
#
######################################################################################################################################################################################################################
$subscription = "EFProd01"
$location = "West Europe"
$baseServiceName = "ef-1-pp-euw"
#$keyVaultName = "ef-1-pp-euw-key2-kvl-01"                             # Key Vault name must be a 3-24 character string, containing only 0-9, a-z, A-Z, and -.
$baseNumber = "00"
#$terrformAppID = "d98820db-05c1-4a4e-b5ed-29fe08c12f64"               # Application (client) ID that terraform will use - terraform-shared-services
#$AZ_ADM_SS_Cloud_Team_OID = "467b146a-9c8a-4464-8cac-9af332ba2793"    # Object ID of AAD\AZ_ADM_SS_Cloud_Team


$tags = @{
 
    bUnit                  = "Enabling Functions";
    cc                     = "777158";
    costcenter             = "777158"; 
    dataClassification     = "Confidential";
    environment            = "Pre-Production";
    projectNum             = "PR21-0783";
    serviceName            = "IndeedUAT";
    deploymentRef          = "Terraform";
    serviceApplicationName = "IndeedUAT";
    serviceTier            = "SC3"

}


Select-AzSubscription -SubscriptionName $subscription

$resourceGroupName = $baseServiceName + "-indeedpp-" + $baseNumber
#$resourceGroupName2 = $baseServiceName + "-sqlef-" + $baseNumber
New-AzResourceGroup -Name $resourceGroupName -Location $location -Tag $tags
#New-AzResourceGroup -Name $resourceGroupName2 -Location $location -Tag $tags2

#New-AzRoleAssignment -ApplicationId $terrformAppID -ResourceGroupName $resourceGroupName1 -RoleDefinitionName "Contributor"
#New-AzRoleAssignment -ApplicationId $terrformAppID -ResourceGroupName $resourceGroupName2 -RoleDefinitionName "Contributor"

$storageAccountName = "0" + $baseNumber + ($baseServiceName -replace '-', '') + "indeedppstg"
New-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName -Location $location -Kind "StorageV2" -SkuName "Standard_LRS" -Tag $tags
$context = New-AzStorageContext -StorageAccountName $storageAccountName
Enable-AzStorageDeleteRetentionPolicy -Context $context -RetentionDays 7
New-AzStorageContainer -Name "terraform-remote-states-indeedpp" -Context $context -Permission Blob

#New-AzKeyVault -VaultName $keyVaultName -ResourceGroupName $resourceGroupName -Location $location -Tag $tags2 
#Set-AzKeyVaultAccessPolicy -VaultName $keyVaultName -ObjectID $AZ_ADM_SS_Cloud_Team_OID -PermissionsToSecrets Get
#Set-AzKeyVaultAccessPolicy -VaultName $keyVaultName -ServicePrincipalName $terrformAppID -PermissionsToSecrets Get

Write-Host "Subscription         : $subscription"
Write-Host "Resource Group Name  : $resourceGroupName"
#Write-Host "Resource Group Name2  : $resourceGroupName2"
Write-Host "Storage Account Name : $storageAccountName"
#Write-Host "Key Vault Name       : $keyVaultName"