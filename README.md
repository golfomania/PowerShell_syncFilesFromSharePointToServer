# PowerShell_syncFilesFromSharePointToServer

The target is to create a PowerShell script to sync files from SharePoint to a local server using a service account.

## app registration

create app registration only for specific SharePoint
https://devblogs.microsoft.com/microsoft365dev/controlling-app-access-on-specific-sharepoint-site-collections/

With Graph Premission on Sites.Selected
and admin consent

## get SP site id

To Get Site Collection ID, hit this URL in the browser: https://<tenant>.sharepoint.com/sites/<site-url>/\_api/site/id

## set permissions on SharePoint site

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

https://blog.topedia.com/2022/08/sites-selected-berechtigung-in-sharepoint-und-microsoft-graph-api/

https://techcommunity.microsoft.com/t5/microsoft-sharepoint-blog/develop-applications-that-use-sites-selected-permissions-for-spo/ba-p/3790476

## app-ony auth with PowerShell SDK

https://learn.microsoft.com/en-us/powershell/microsoftgraph/app-only?view=graph-powershell-1.0&tabs=azure-portal
