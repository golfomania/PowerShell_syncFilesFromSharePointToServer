#####################################
# connect to MS Graph using app registration and certificate
#####################################

Connect-MgGraph -ClientID 'client_id_of_your_app_registration' -TenantId 'your_tenant_id'  -CertificateThumbprint 'from_app_registration'

#####################################
# get drive ID for default 
#####################################
Import-Module Microsoft.Graph.Files
Import-Module Microsoft.Graph.Sites


# get all drives of site / use to get drive IDs
# Get-MgSiteDrive -SiteId 'id_of_your_site'

# get default drive of site
$driveID = Get-MgSiteDefaultDrive -SiteId 'id_of_your_site'

# get children of drive in root
$rootItemID = Get-MgDriveRoot -DriveId $driveID.Id

# get children of root
$ChildrenInRoot = Get-MgDriveItemChild -DriveId $driveID.Id -DriveItemId $rootItemID.Id

#####################################
# download each file and move to separate document library
#####################################
foreach ($file in $ChildrenInRoot)
{
    Get-MgDriveItemContent -DriveId $driveID.Id -DriveItemId $file.Id -OutFile 'local_path_to_save_file'

    # move file after download in separate document library
    $params = @{
	  parentReference = @{
        driveId = "id_of_new_document_library"
        id = "id_of_root_folder_of_new_document_library"
	}
    }

    Update-MgDriveItem -DriveId $driveID.Id -DriveItemId $file.Id -BodyParameter $params

}









