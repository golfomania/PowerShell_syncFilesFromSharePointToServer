#####################################
# connect to MS Graph using app registration and certificate
#####################################

Connect-MgGraph -ClientID 'client_id_of_your_app_registration' -TenantId 'your_tenant_id'  -CertificateThumbprint 'from_app_registration'

#####################################
# get drive ID for default 
#####################################
Import-Module Microsoft.Graph.Files
Import-Module Microsoft.Graph.Sites


# get all drives of site
Get-MgSiteDrive -SiteId 'id_of_your_SP_site'

# get default drive of site
$driveID = Get-MgSiteDefaultDrive -SiteId 'xxx'
# Write-Host $driveID.Id

# get children of drive in root
$rootItemID = Get-MgDriveRoot -DriveId $driveID.Id

# get children of root
Get-MgDriveItemChild -DriveId $driveID.Id -DriveItemId $rootItemID.Id

# get children of test folder
$FilesinFolder = Get-MgDriveItemChild -DriveId $driveID.Id -DriveItemId 'id_of_folder_from_previous_step' -ExpandProperty 'listItem'


#####################################
# download each file (overwrites existing files)
#####################################
foreach ($file in $FilesinFolder)
{
    Get-MgDriveItemContent -DriveId $driveID.Id -DriveItemId $file.Id -OutFile 'local_path_where_to_save_file'
}




