# Get the existing Compute VM
$vm1 = Get-AzVM -Name "AZWPPDBSEF003" -ResourceGroupName "ef-1-pp-euw-sqlhrlgl-rsg-01"

New-AzSqlVM -Name $vm1.Name -ResourceGroupName $vm1.ResourceGroupName -Location $vm1.Location `
-LicenseType "AHUB" -SqlManagementType "Full"


# Get the existing Compute VM
#$vm2 = Get-AzVM -Name "AZWPRDBSEF005" -ResourceGroupName "ef-1-pr-euw-EFFN-rsg-01"

#New-AzSqlVM -Name $vm2.Name -ResourceGroupName $vm2.ResourceGroupName -Location $vm2.Location `
#-LicenseType "AHUB" -SqlManagementType "Full"