---
permalink: /developers/guides/feeds/
title: Feeds
keywords: developer
last_updated: July 11, 2016
tags: []
---

# Overview
`Experiences` created in the `EXP platform` may want to include `third party data sources` in some cases.
The `EXP platform` has a build in data aggregator that simplifies getting data in your `Experiences`.
We `unified` the data sources as much if possible to a `simple Json format`, this way a app can easily `switch` between sources without being `modified`.
`FEEDS` can be accessed in a app or via one of the available EXP SDK's.

- [JavaScript SDK - Reference](http://docs.goexp.io/developers/reference/javascript-sdk-1.0.0/)

- [Python SDK - Reference](http://docs.goexp.io/developers/reference/python-sdk/)

- [Player app SDK - Reference](http://docs.goexp.io/developers/reference/player-app-sdk/)

- [IOS SDK - Reference](http://docs.goexp.io/developers/reference/ios-sdk/)

- [Android SDK - Reference](http://docs.goexp.io/developers/reference/android-sdk/)

# Integration
Most of the `FEEDS` in the `EXP platform` require permissions to access the online `third party` data source. 
The `EXP platform` has an integration section that allows authenticating each online data source. 
Here the required `credentials` can be associated with an `organization`. 
Each user of this `organization` will have access to these `integrations`.

![Data Source Integration](/common_images/developers/integrations.png "Data Source Integration")

## Adding a Integration
- Find the `integration` source that your app will use and press the `ADD` button. 

- A `redirect` will happen to the login permission page of the `third party` online data source provider.

- Enter `credentials` and `accept`. 

- The `integrations` page will appear again. 

When the `integration` is successful added it's `registered` under configured `integrations`.

![Data Source Integration](/common_images/developers/integrations_implemented.png "Data Source Integration Implemented")

## Updating Integration
If for any reason the `integration` needs to be updated, for example a permission setting that has changed, the `UPDATE` button can be selected. 

## Removing a Integration
When removing a `integration` the `EXP platform` will attempt to `revoke access` it received from the `third party` provider. 
Some `third party` providers do not allow this `revoke access` to happen automatically, in this case the `EXP platform` will show a warning and give a `link` to manually remove it.
     
# Feed Sources
The `EXP platform` supports multiple `third party` online data feed sources. Not all of then `require` a `integration`.
We can list them by category:

## Social media

1. `Facebook` -> integration Facebook
2. `Instagram` -> integration Instagram
3. `Twitter` -> integration Twitter

## Spreadsheet

1. `Google Spreadsheet` -> integration Google Drive
2. `Microsoft Spreadsheet` -> integration Microsoft oneDrive

## Calendar

1. `Google Calendar` -> integration Google Calendar
2. `Microsoft Calendar` -> integration Microsoft Calendar

## POS

1. `Shopify` -> integration Shopify
2. `Square` -> integration Square

## Git

1. `Github` -> integration Github
2. `BitBucket` -> integration BitBucket

## Other

1. `Weather` -> no integration
2. `RSS` -> no integration
3. `Generic` -> no integration

# FEEDS
After `integrations` are added to the `EXP platform` `FEEDS` can be created in the `FEEDS` section.
In here, the default view is a list of `FEEDS` already created. Icons will show what `type` of `FEED` is defined. 
Other info like `created`, `modified` and `search` is also displayed in this view.

![Feed](/common_images/developers/feed.png "Feed")

## Add feed
- Select the `ADD` button on the right top corner to add a `FEED`.

![Feed](/common_images/developers/feed_add.png "Adding New Feed")

- When `ADD` is selected a popup box appears. A unique `name` must be entered and a `FEED` type can be selected. A list appears of `integrations` if required.
Depending on what `FEED` is selected multiple options can be entered like `search`, `max number of results` and more. The `details` of these fields will be highlighted later in this `guide`. 

- When done press the `SAVE` button.

![Feed](/common_images/developers/feed_new.png "New Feed")
 
## Viewing data
When a `FEED` is created and added to the list a `preview` of the data can be generated.
 
- Select the `FEED` in the list by selecting the checkbox. 
- In the top right a `preview` icon appears. This triggers a feed `preview` generation.

![Feed](/common_images/developers/feed_preview.png "Feed Preview Button")

- A dialog opens to show the preview data in `JSON` format. 
- The `data` can be downloaded pressing the `DOWNLOAD` button in the bottom right corner.

![Feed](/common_images/developers/feed_data.png "Feed Preview Data")

## Remove Feed
In the `FEED` main list, select the feed that needs to be deleted using the `checkbox`. Select the delete `icon` to remove the `FEED`.

`WARNING` it is possible that there are currently apps using this `FEED` that is to be deleted!

![Feed](/common_images/developers/feed_delete.png "Feed Delete")

## Feed Configuration Fields
When a `FEED` is created multiple `configuration fields` can be entered. This section will describe these `fields` per `FEED`.

### General fields
`Feed Name` (required): All feeds require a unique feed name. 

### Facebook
`Profile/Page` (required): enter the page or profile name to pull data from. When getting a profile your account needs to have access to it.

`Max Results` (required): enter the amount of posts that needs to be collected.

### Twitter
`Profile/Page` (optional): enter the page or profile name to pull data from.

OR

`Query` (optional): enter a query string to filter data from twitter. More information can be found here `https://dev.twitter.com/rest/public/search`.  

`Max Number of Results` (required): enter the amount of posts that needs to be collected.

### Instagram
`Profile/Page` (optional): enter the page or profile name to pull data from.

OR

`Query` (optional): enter a tag name to search for.  

`Max Number of Results` (required): enter the amount of posts that needs to be collected.

### Google Calendar
`Calendar ID` (required): enter the calendarID to get the events from. Please make sure that the integration account has access to this calendar.
 
`Number of Days` (required): enter the number of days to look for event from the current date forwards.

### Microsoft Calendar
`Calendar Name` (required): enter the calendar name to get the events from. Please make sure that the integration account has access to this calendar.
 
`Number of Days` (required): enter the number of days to look for event from the current date forwards.

### Google Spreadsheet
`Spreadsheet ID/File Path` (required): enter the ID or path to the spreadsheet file. As path backslash and forward slash can be used. As example `//documents//test or \\documents\\test or /documents/test or \documents\test` 

`Sheet Name` (optional): enter the sheet name you want to access the data from. If not defined first sheet name is automatically selected.

`First Row As Header` (optional): when selecting this option the first row of the spreadsheet is used as header names. If there are headers that have the same name in the Json result a array of values for this header will be returned.

`Max Number of Results` (required): enter the amount of rows that needs to be collected.

### Microsoft Spreadsheet
`Spreadsheet ID/File Path` (required): enter the ID or path to the spreadsheet file. As path backslash and forward slash can be used. As example `//documents//test or \\documents\\test or /documents/test or \documents\test` 

`Sheet Name` (optional): enter the sheet name you want to access the data from. If not defined first sheet name is automatically selected.

`First Row As Header` (optional): when selecting this option the first row of the spreadsheet is used as header names. If there are headers that have the same name in the Json result a array of values for this header will be returned.

`Max Number of Results` (required): enter the amount of rows that needs to be collected.

### Weather
`City, Zip, or Place` (required): enter the location information to search for weather results. A US ZIP code, an airport code or the combination of city and country names can be used. For example: `90210`, `EWR`, `amsterdam, netherlands` or `new york, united states`

`Language Code` (optional): enter the language code to translate the weather content. Following languages are supported:
 
`AF	Afrikaans |
AL	Albanian |
AR	Arabic |
HY	Armenian |
AZ	Azerbaijani |
EU	Basque |
BY	Belarusian |
BU	Bulgarian |
LI	British English |
MY	Burmese |
CA	Catalan |
CN	Chinese - Simplified |
TW	Chinese - Traditional |
CR	Croatian |
CZ	Czech |
DK	Danish |
DV	Dhivehi |
NL	Dutch |
EN	English |
EO	Esperanto |
ET	Estonian |
FA	Farsi |
FI	Finnish |
FR	French |
FC	French Canadian |
GZ	Galician |
DL	German |
KA	Georgian |
GR	Greek |
GU	Gujarati |
HT	Haitian Creole |
IL	Hebrew |
HI	Hindi |
HU	Hungarian |
IS	Icelandic |
IO	Ido |
ID	Indonesian |
IR	Irish Gaelic |
IT	Italian |
JP	Japanese |
JW	Javanese |
KM	Khmer |
KR	Korean |
KU	Kurdish |
LA	Latin |
LV	Latvian |
LT	Lithuanian |
ND	Low German |
MK	Macedonian |
MT	Maltese |
GM	Mandinka |
MI	Maori |
MR	Marathi |
MN	Mongolian |
NO	Norwegian |
OC	Occitan |
PS	Pashto |
GN	Plautdietsch |
PL	Polish |
BR	Portuguese |
PA	Punjabi |
RO	Romanian |
RU	Russian |
SR	Serbian |
SK	Slovak |
SL	Slovenian |
SP	Spanish |
SI	Swahili |
SW	Swedish |
CH	Swiss |
TL	Tagalog |
TT	Tatarish |
TH	Thai |
TR	Turkish |
TK	Turkmen |
UA	Ukrainian |
UZ	Uzbek |
VU	Vietnamese |
CY	Welsh |
SN	Wolof |
JI	Yiddish - transliterated |
YI	Yiddish - unicode` 

### RSS
`RSS feed URL` (required): enter a valid rss url.  

`Max Number of Results` (required): enter the amount of rows that needs to be collected.

### Generic Endpoint
`API endpoint` (required): enter a valid rest api url.

`Headers` (optional): enter headers required by the api call.

### Square
`Max Number of Results` (required): enter the amount of items that needs to be collected.

`Item Types` (required): select to pull orders or products from the POS provider.

### Shopify
`Max Number of Results` (required): enter the amount of items that needs to be collected.

`Item Types` (required): select to pull orders or products from the POS provider. When selected there are multiple filter fields to narrow down the search, example only orders that are closed.

### GitHub
`organization name / user name` (required): enter a valid username or organisation name.

`Repository` (required): enter a valid repository.

`Max Number of Results` (required): enter the amount of Pull Requests that needs to be received.

### BitBucket
`organization name / user name` (required): enter a valid username or organisation name.

`Repository` (required): enter a valid repository.

`Max Number of Results` (required): enter the amount of Pull Requests that needs to be received.

## Feed Json Structure
The structure of the `Json feed` that the `EXP platform` returns when calling a `FEED` is `unified` as much if possible. 
In the top of the Json structure the `search details` are found with details on the requested `FEED` like what `url` is called or what is `searched` on.
Then the `details` of the requested follows in the structure, including `profile`, `page`, `shop` or `account` info depending on the `FEED` requested.
The `items` section is the actual `data` returned from the `FEED` search. Fields that can differ per feed is located in the `metadata` field. The `raw` field contains the original information.  
   
```json
{
  "search": { ... info about the search ... },
  "details": { ... profile, page, shop, or account info ... },
  "items":[
    "date": "",
    "text": "",
    "shares": 0,
    "likes": 0,
    "comments": 0,
    "images": [ { "url": "" } ],
    "videos": [ { "url": "" } ],
    "links": [ { "url": "" } ],
    "metadata": {
      "startDate": "",
      "endDate": "",
      "high": { "c": 0, "f": 0 },
      "low": { "c": 0, "f": 0 },
      "current": { "c": 0, "f": 0 },
      "amount": 0
    }
    "tags":[], // array of strings
    "createdBy": "",
    "createdByDisplay": "",
    "type": "",
    "raw": { ... original data from search ...}
  ]
}
```

## Dynamic Feeds
In some cases the search value for a `FEED` is not know prior to requesting the data. For example requesting `weather information` depending on the `location` of a device which may change over time.

In this case `FEEDS` can be created with the `dynamic` option. All other options can then be sent as `parameters` using the `EXP SDK's`.

### Create Dynamic Feed
- In the feed section click on the `ADD` button.

- Select a valid `name` for the `FEED`.

- Select a `type` and `integration`.

- Check the `dynamic` option. All other fields will be `removed`.

![Uploading an App](/common_images/developers/feed_dynamic.png "Feed Dynamic")

### Preview 
The `FEED` can be tested in the `EXP platform` when selecting the feed in the feed list and clicking the preview `icon`. 
A `preview modal` appears. On top you can find the `fields` that are send as parameters next to the UUID.
Enter all fields required and press `PREVIEW` to see the data returned. 
  
![Uploading an App](/common_images/developers/feed_dynamic_preview.png "Feed Dynamic Preview")

### Exceptions
There are a couple of `FEEDS` not available as `dynamic`. They are the `RSS` and `Generic` feed types.  
