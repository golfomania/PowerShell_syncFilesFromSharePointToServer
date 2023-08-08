# PowerShell_syncFilesFromSharePointToServer

The target is to create a PowerShell script to sync files from SharePoint to a local server using a service account.

## SharePoint

A new Website is created in SharePoint.

An folder is created in the default.

## app registration

create app registration with permission "Files.Read.All"

### or app registration with permission only a specific site / step 1

https://devblogs.microsoft.com/microsoft365dev/controlling-app-access-on-specific-sharepoint-site-collections/

With Graph Permission on Sites.Selected
and admin consent

### set permissions on SharePoint site / step 2

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

## get SP site id

To Get Site Collection ID, hit this URL in the browser: https://<tenant>.sharepoint.com/sites/<site-url>/\_api/site/id

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

## not solved yet

to avoid downloading files that are already on the local server

not worked

- add & change custom metadata field
- move file to another folder
