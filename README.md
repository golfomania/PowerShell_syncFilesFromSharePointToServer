# PowerShell_syncFilesFromSharePointToServer

The target is to create a PowerShell script to sync files from SharePoint to a local server using a service account.

## SharePoint

A new Website is created in SharePoint.

Two a additional document library is created.

- The default document library is used as source for the files to sync down
- the additional document library is used as place where the already synced files are moved to to avois overwriting

## get SP site id

To Get Site Collection ID, hit this URL in the browser: https://< tenant >.sharepoint.com/sites/< site-url >/\_api/site/id

## app registration

create app registration with permission "Files.ReadWrite.All" and "Sites.ReadWrite.All"

## create self signed certificate

https://www.youtube.com/watch?v=7Bkv9J9mVr0
see .ps1 file, then upload to app registration

## install PowerShell SDK

https://learn.microsoft.com/en-us/powershell/microsoftgraph/installation?view=graph-powershell-1.0

## app-ony auth with PowerShell SDK

https://learn.microsoft.com/en-us/powershell/microsoftgraph/app-only?view=graph-powershell-1.0&tabs=azure-portal

https://www.vcloudnine.de/use-app-only-authentication-with-the-microsoft-graph-powershell-sdk/

## get metadata from file

https://learn.microsoft.com/en-us/graph/api/driveitem-get?view=graph-rest-1.0&tabs=http

## download files from SharePoint to local server

see .ps1 file

https://learn.microsoft.com/en-us/graph/api/driveitem-move?view=graph-rest-1.0&tabs=powershell

## not worked / not made to work

- add & change custom metadata field

  ```
  check status of custom matadata field "downloaded"
  Write-Host $file.ListItem.Fields.AdditionalProperties.downloaded
  ```

- Compare Hash

https://superuser.com/questions/1643084/how-to-not-overwrite-existing-files

https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.files/update-mgdriveitem?view=graph-powershell-1.0

### use app registration with permission only a specific site / step 1 (not tested)

https://devblogs.microsoft.com/microsoft365dev/controlling-app-access-on-specific-sharepoint-site-collections/

With Graph Permission on Sites.Selected
and admin consent

### set permissions on SharePoint site / step 2 (not tested)

```
POST https://graph.microsoft.com/v1.0/sites/{siteId}/permissions

Content-Type: application/json

{

"roles": ["write"],

"grantedToIdentities": [{

    "application": {

      "id": "<app id>",

      "displayName": "<name of app>" // must not match

    }

}]

}
```

https://blog.topedia.com/2022/08/sites-selected-berechtigung-in-sharepoint-und-microsoft-graph-api/

https://techcommunity.microsoft.com/t5/microsoft-sharepoint-blog/develop-applications-that-use-sites-selected-permissions-for-spo/ba-p/3790476
