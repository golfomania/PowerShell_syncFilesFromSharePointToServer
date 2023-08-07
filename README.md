# PowerShell_syncFilesFromSharePointToServer

## app registration

create app registration only for specific SharePoint
https://devblogs.microsoft.com/microsoft365dev/controlling-app-access-on-specific-sharepoint-site-collections/

With Graph Premission on Sites.Selected
and admin consent

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

see https://blog.topedia.com/2022/08/sites-selected-berechtigung-in-sharepoint-und-microsoft-graph-api/

see https://techcommunity.microsoft.com/t5/microsoft-sharepoint-blog/develop-applications-that-use-sites-selected-permissions-for-spo/ba-p/3790476
