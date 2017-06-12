---
permalink: /developers/guides/feeds
title: Working With Feeds
keywords: developer, feed, integration, facebook, google, linkedin, instagram, twitter, microsoft, shopify, square, github, weather, bitbucket, rss
last_updated: July 11, 2016
tags: []
---

<link rel="stylesheet" href="{{site.baseurl}}/_pages/developers/guides/feeds.css">

# Overview

To include data from third party data sources such as Facebook pages or local weather reports, EXP has the concept of feeds.
The data from a feed will be available to your app in a simple, unified JSON format, so that an app can easily handle different data sources
without being modified.

The feeds can be acessed through a method on your EXP SDK, so consult the reference for your platform below. This guide will have more detail
about how to use feeds and how they can be configured.

- [JavaScript SDK - Reference]({{site.baseurl}}/developers/reference/javascript-sdk)

- [Python SDK - Reference]({{site.baseurl}}/developers/reference/python-sdk)

- [Player app SDK - Reference]({{site.baseurl}}/developers/reference/player-app-sdk)

- [IOS SDK - Reference]({{site.baseurl}}/developers/reference/ios-sdk)

- [Android SDK - Reference]({{site.baseurl}}/developers/reference/android-sdk)

# Integrations
Most of the feed types in EXP require permissions to access the third party data source.
To permanently link credentials for data sources that you provide, EXP has the concept of integrations.
You can create a new integration from the integrations route (see below).
Here the required credentials can be entered and then the integration will be available to everyone in the organization.

![Data Source Integration](/images/developers/integrations.png "Data Source Integration")

## Adding an Integration
- Find the integration source that your app will use and press the ADD button.

- A redirect will happen to the login permission page of the third party online data source provider.

- Enter credentials and accept.

- The EXP integrations page will appear again.

If the integration fails, an error message will appear:

![Data Source Integration Error Message](/images/developers/integration_error.png "Data Source Integration Error")

When the integration is successfuly added it will show up under configured integrations.

![Data Source Integration](/images/developers/integrations_implemented.png "Data Source Integration Implemented")

## Updating an Integration
If for any reason the integration needs to be updated, for example a permission setting that has changed, click the integration's Update button to make changes.

## Removing an Integration
When removing an integration the EXP platform will attempt to revoke access it received from the third party provider.
Some third party providers do not allow this revoke access to happen automatically, in this case you will be shown a warning and given a link to manually remove it.

# Feeds


<table class="feed-information">
  <thead>
    <tr>
      <th>Feed Type</th>
      <th>Integration</th>
      <th>Subtype</th>
      <th>Dynamic Feed</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="category" colspan="4">Social Media</td>
    </tr>
    <tr>
      <td>
        <img src="/images/feedIcons/facebook.svg">
        Facebook
      </td>
      <td>Facebook</td>
      <td>scala:feed:facebook</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td>
        <img src="/images/feedIcons/instagram.svg">
        Instagram
      </td>
      <td>Instagram</td>
      <td>scala:feed:instagram</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td>
        <img src="/images/feedIcons/twitter.svg">
        Instagram
        Twitter
      </td>
      <td>Twitter</td>
      <td>scala:feed:twitter</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td>
        <img src="/images/feedIcons/linkedin.svg">
        LinkedIn
      </td>
      <td>LinkedIn</td>
      <td>scala:feed:linkedIn</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td class="category" colspan="4">Spreadsheet</td>
    </tr>
    <tr>
      <td>
        <img src="/images/feedIcons/google-drive.svg">
        Google Spreadsheet
      </td>
      <td>Google Drive</td>
      <td>scala:feed:googleSpreadsheet</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td>
        <img src="/images/feedIcons/one-drive.svg">
        Microsoft Spreadsheet
      </td>
      <td>Microsoft OneDrive</td>
      <td>scala:feed:microsoftSpreadsheet</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td class="category" colspan="4">Calendar</td>
    </tr>
    <tr>
      <td>
        <img src="/images/feedIcons/google-calendar.svg">
        Google Calendar
      </td>
      <td>Google Calendar</td>
      <td>scala:feed:google</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td>
        <img src="/images/feedIcons/outlook.svg">
        Microsoft Calendar
      </td>
      <td>Microsoft Calendar</td>
      <td>scala:feed:outlook</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td class="category" colspan="4">POS</td>
    </tr>
    <tr>
      <td>
        <img src="/images/feedIcons/shopify-logo.svg">
        Shopify
      </td>
      <td>Shopify</td>
      <td>scala:feed:shopify</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td>
        <img src="/images/feedIcons/square-logo.svg">
        Square
      </td>
      <td>Square</td>
      <td>scala:feed:square</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td class="category" colspan="4">Git</td>
    </tr>
    <tr>
      <td>
        <img src="/images/feedIcons/github.svg">
        GitHub
      </td>
      <td>GitHub</td>
      <td>scala:feed:gitHub</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td>
        <img src="/images/feedIcons/bitbucket.svg">
        BitBucket
      </td>
      <td>BitBucket</td>
      <td>scala:feed:bitBucket</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td class="category" colspan="4">Other</td>
    </tr>
    <tr>
      <td>
        <img src="/images/feedIcons/weather-partlycloudy.svg">
        Weather
      </td>
      <td>N/A</td>
      <td>scala:feed:weather</td>
      <td>Yes</td>
    </tr>
    <tr>
      <td>
        <img src="/images/feedIcons/rss-box.svg">
        RSS
      </td>
      <td>N/A</td>
      <td>scala:feed:rss</td>
      <td>No</td>
    </tr>
    <tr>
      <td>
        <img src="/images/feedIcons/access-point.svg">
        RSS
        Generic Endpoint
      </td>
      <td>N/A</td>
      <td>scala:feed:generic</td>
      <td>No</td>
    </tr>
  </tbody>
</table>

Feeds can be created from the feeds section and you will see a list of existing feeds:

![Feed List](/images/developers/feed.png "Feed")

## Adding a Feed
- Click the Add icon <img src="/images/plus.svg" class="icon"> in the right top corner.
- A dialog appears. Choose a valid, unique name and select the type of feed. A list of integrations will appear if required.
Depending on what type of feed is selected, multiple options can be entered such as "search" or "max items". The details of these fields are documented later in this guide.
- When done press the Save button.

![New Feed](/images/developers/feed_new.png "New Feed")

## Previewing Feed Data
Once you've created a feed, you can see what the data it is returning looks like.

- Select the feed in the list by checking the checkbox.
- Click the preview icon <img src="/images/eye.svg" class="icon"> in the top right corner.
- A dialog opens to show the preview data in JSON format.
- The data can be downloaded by pressing the Download button in the bottom right corner.

![Feed Preview](/images/developers/feed_data.png "Feed Preview Data")

## Remove Feed
- Make sure there are no apps currently running that rely on this feed.
- Select the feed in the list by checking the checkbox.
- Click the Delete icon <img src="/images/delete.svg" class="icon"> in the top right corner.

## Feed Configuration Fields

### General fields
- **Feed Name** (required): a name that is only useful to you to remember what this feed is for and identify it in a list of other feeds. e.g. *New York City weather*

### Facebook
- **Public Page** (required): the public page to pull data from.

- **Max Number of Results** (required): the amount of posts that the feed should return.

### Twitter
- **Profile/Page** (optional): the page or profile name to pull data from.

  *or*

  **Query** (optional): a query string to filter data from Twitter. As example only tweets from scalainc should look like: 'from:scalainc AND -filter:retweets AND -filter:replies'. More information about queries can be found [here](https://dev.twitter.com/rest/public/search).

- **Max Number of Results** (required): the amount of posts that the feed should return.

### Instagram
- **Profile/Page** (optional): the page or profile name to pull data from. This can be your own profile or someone else's profile or page. See [Instagram's official API docs for users](https://www.instagram.com/developer/endpoints/users/).

  *or*

  **Query** (optional): a tag name to search for. See [Instagram's official API docs for tags](https://www.instagram.com/developer/endpoints/tags/).

- **Max Number of Results** (required): the amount of posts that the feed should return.

### LinkedIn
- **Company Name/ID** (required): the page or profile name to pull data from. You must have access to the page or profile with the credentials in your LinkedIn integration.

- **Max Number of Results** (required): the amount of posts that the feed should return.

### Google Calendar
- **Calendar ID** (required): the calendarID to get the events from. You must have access to this calendar with the credentials in your Google Calendar integration.

- **Number of Days** (required): the number of days to look for events from the current date forwards.

### Microsoft Calendar
- **Calendar Name** (required): the calendar name to get the events from. You must have access to this calendar with the credentials in your Microsoft Calendar integration.

- **Number of Days** (required): the number of days to look for events from the current date forwards.

### Google Spreadsheet
- **Spreadsheet ID/File Path** (required): the ID or path to the spreadsheet file. As path backslash and forward slash can be used. e.g. *//documents//test* or *\\documents\\test* or */documents/test* or *\documents\test*.

- **Sheet Name** (optional): the sheet name you want to access the data from. If not defined first sheet name is automatically selected.

- **First Row As Header** (optional): when selecting this option the first row of the spreadsheet is used as header names. If there are headers that have the same name in the JSON result, an array of values for this header will be returned.

- **Max Number of Results** (required): the number of rows that the feed should return.

### Microsoft Spreadsheet
- **Spreadsheet ID/File Path** (required): the ID or path to the spreadsheet file. As path backslash and forward slash can be used. e.g. *//documents//test* or *\\documents\\test* or */documents/test* or *\documents\test*

- **Sheet Name** (optional): the sheet name you want to access the data from. If not defined first sheet name is automatically selected.

- **First Row As Header** (optional): when selecting this option the first row of the spreadsheet is used as header names. If there are headers that have the same name in the JSON result, an array of values for this header will be returned.

- **Max Number of Results** (required): the number of rows that the feed should return.

### Weather
<ul>
  <li>
    <strong>City, Zip, or Place</strong> (required): the location information to search for weather results. A combination of city and country can be used. e.g. <i>Amsterdam, Netherlands</i> or <i>New York, United States</i>.
  </li>
  <li class="expandable">
    <p><strong>Language Code</strong> (optional): the language code to translate the weather content. The following languages are supported:</p>

    <input id="language-checkbox" type="checkbox">
    <label for="language-checkbox"></label>

    <div class="content">
      <table class="language-table">
        <tr>
          <td>en</td>
          <td>English</td>
        </tr>
        <tr>
          <td>ru</td>
          <td>Russian</td>
        </tr>
        <tr>
          <td>it</td>
          <td>Italian</td>
        </tr>
        <tr>
          <td>es</td>
          <td>Spanish</td>
        </tr>
        <tr>
          <td>ua</td>
          <td>Ukrainian</td>
        </tr>
        <tr>
          <td>de</td>
          <td>German</td>
        </tr>
        <tr>
          <td>pt</td>
          <td>Portuguese</td>
        </tr>
      </table>
      <table class="language-table">
        <tr>
          <td>ro</td>
          <td>Romanian</td>
        </tr>
        <tr>
          <td>pl</td>
          <td>Polish</td>
        </tr>
        <tr>
          <td>fi</td>
          <td>Finnish</td>
        </tr>
        <tr>
          <td>nl</td>
          <td>Dutch</td>
        </tr>
        <tr>
          <td>fr</td>
          <td>French</td>
        </tr>
        <tr>
          <td>bg</td>
          <td>Bulgarian</td>
        </tr>
        <tr>
          <td>se</td>
          <td>Swedish</td>
        </tr>
      </table>
      <table class="language-table">
        <tr>
          <td>zh_tw</td>
          <td>Chinese Traditional</td>
        </tr>
        <tr>
          <td>zh</td>
          <td>Chinese Simplified</td>
        </tr>
        <tr>
          <td>tr</td>
          <td>Turkish</td>
        </tr>
        <tr>
          <td>hr</td>
          <td>Croatian</td>
        </tr>
        <tr>
          <td>ca</td>
          <td>Catalan</td>
        </tr>
      </table>
    </div>
  </li>
</ul>

### RSS
- **RSS feed URL** (required): a valid rss url.

- **Max Number of Results** (required): the number of rows that the feed should return.

### Generic Endpoint
- **API endpoint** (required): a valid rest api url.

- **Headers** (optional): headers required by the api call.

### Square
- **Item Types** (required): select to pull orders or products from the POS provider.

- **Max Number of Results** (required): the number of items that the feed should return.

### Shopify
- **Item Types** (required): select to pull orders or products from the POS provider. When selected there are multiple filter fields to narrow down the search, example only orders that are closed.

- **Max Number of Results** (required): the number of items that the feed should return.

### GitHub
- **Username / Organization name** (required): a valid username or organization name.

- **Repository** (required): a valid repository.

- **Max Number of Results** (required): the number of pull requests that the feed should return.

### BitBucket
- **Username / Organization name** (required): enter a valid username or organization name.

- **Repository** (required): a valid repository.

- **Max Number of Results** (required): the number of pull requests that the feed should return.

## Feed Json Structure
The structure of the JSON returned by a feed is standardized as much as possible.

At the top of the JSON structure is `search` with details about the query or search terms that generated this feed.

Then there is `details` with information including `profile`, `page`, `shop` or `account` depending on the type of feed.

Finally, the actual data of the feed is in `items`. Fields that can differ per feed are located in `metadata`. `raw` contains the original information.

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

## Using Feeds in an App Template
Once you've created a feed in EXP, you can plug it into existing apps that accept feeds. To enable feeds in your own custom apps, you have to make the appropriate
entry in the `manifest.json`. Add a type to `configTypes` with type `"feed"`  For example:

```json
{
  "name": "Weather App",
  "configTypes": [
    {
      "name": "feedId",
      "type": "feed",
      "label": "Feed",
      "required": true,
      "path": "feedConfiguration",
      "supportedTypes": [ "scala:feed:weather" ]
    }
  ]
}
```

Usually you are only intending to support a certain type of feed, so set the `supportedTypes` to the appropriate value (to see a list of types and supported types, see table above).

Once the `manifest.json` has the feed in it, you can get the feed using the EXP SDK. Using the Javascript SDK it would look something like:

```javascript
exp.getFeed(exp.app.config.feedConfiguration.uuid)
  .then(function(feed) {
    return feed.getData();
  })
  .then(function(feedData) {
    feedData.items.forEach(function(feedItem) {
      // do something with the feed item like display it
    });
  });
```


## Dynamic Feeds
In some cases it could be that numerous feeds are required by a single app. For example, showing weather data for many different locations would normally require a feed for each location.
It would take a lot of time to manually create a feed for each location and add each of them to the app in turn.

For such a use case, feeds can be created with the dynamic option set to True. Then options that would normally be configured once on the feed can instead be sent as parameters alongside the feed UUID when requesting it from EXP. In other words, instead of your app consuming the feed "as is", it will have the ability to use the feed with whatever parameters it wants, and it can change those on the fly. An app using a Weather feed set to dynamic could use the same feed to request weather data from multiple different areas.

### Creating a Dynamic Feed
- Create a feed as you would normally
- Check the Dynamic option. All other fields will be removed.

![Dynamic Feed](/images/developers/feed_dynamic.png "Feed Dynamic")

### Previewing a Dynamic Feed
Once you've created a dynamic feed, you can see what it's like to have dynamic parameters and what it returns.

- Select the feed in the list by checking the checkbox.
- Click the preview icon <img src="/images/eye.svg" class="icon"> in the top right corner.
- A dialog opens to show the preview data in JSON format. At the top of the dialog you can see the fields that are sent as parameters to EXP.
- Enter all fields required and press Preview to see the data returned.

![Feed Dynamic Preview](/images/developers/feed_dynamic_preview.png "Feed Dynamic Preview")

### Exceptions
There are a couple of feed types not available as dynamic. Currently they are RSS and Generic Endpoint.

## Feed Special Cases

### Calendar Feed "All Day Events"
When setting up a Microsoft or Google Calendar feed and selecting a All Day event the time and timezone will not be returned in the feed. By design Microsoft and Google are not not returning these values in case of all day events. In this case Clients needs to apply there own timezone. 
