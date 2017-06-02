---
permalink: /developers/tutorials/consumer-app-credentials
title: Consumer App Credentials
keywords: developer
last_updated: April 12, 2016
tags: [getting_started]
---

# What Consumer App credentials are

An app that runs on the devices of consumers is considered a consumer app. Of all the ways to connect an instance of a consumer app to EXP,
using consumer app credentials is best if you want to manage the permissions of all the devices as one.

For instance, if you wished to revoke access for all devices running a consumer app and you had authenticated using your EXP username and password,
you would have to change the password or push an update to the app revoking access. And it would affect any other apps that were
authenticated with that username and password. With consumer app credentials, all devices running a given consumer app share the same key,
which can be reset from the EXP UI.

# Creating Consumer App credentials

Consumer apps are shared across an EXP organization, and managed by an account that is an administrator in the organization. If you are logged
in as an account that can manage the organization, click Current Organization from the organization drop-down menu, then click the Consumer Apps
tab.

![Current Organization](/images/tutorials/consumer-app-credentials/current-organization.png "Current Organization")

![Consumer Apps Tab](/images/tutorials/consumer-app-credentials/consumer-apps-tab.png "Consumer Apps Tab")

Click the plus button in the top right to create a new consumer app. Fill in an appropriate name and save.

![New Consumer App Form](/images/tutorials/consumer-app-credentials/new-consumer-app-form.png "New Consumer App Form")

# Using Consumer App Credentials

The consumer app you just created has credentials already. To see them open the edit form for the consumer app by clicking the gear icon next to its name.

![Edit Consumer App Form](/images/tutorials/consumer-app-credentials/edit-consumer-app-form.png "Edit Consumer App Form")

From this dialog you can copy and paste the uuid and API Key into your app's code, or download the two values as a JSON file and include it in your app.

For the details of how to use these to authenticate your app, see the reference guide for your platform.

* [Python SDK]({{site.baseurl}}/developers/reference/python-sdk#starting-the-sdk)
* [Javascript SDK]({{site.baseurl}}/developers/reference/javascript-sdk#starting-the-sdk)
* [iOS SDK]({{site.baseurl}}/developers/reference/ios-sdk#starting-the-sdk)
* [Android SDK]({{site.baseurl}}/developers/reference/android-sdk#starting-the-sdk)

You can also click Reset API Key in this form to change the API Key value. All devices running the app that has the old value will no longer be able
to connect to EXP.

## Player URLs

Consumer app credentials can be used to authenticate an EXP player launched in a browser. Following the steps above, make a note of the UUID and API Key
of your consumer app and then enter them in the query string of a url to a player, e.g.

```
https://player.goexp.io/#uuid=7871d45b-9ce3-49be-ab98-8739dfa84693&apiKey=f305a37f9e86546e1391730d417b9c810844f2b66f89d6514c6c061c2c33322102541487c64ad53f92c2de5fe2240915
```

This URL, together with the query parameters specifying an experience and app, will play an EXP player app. For more about player urls see the
[Player URLs]({{site.baseurl}}/developers/tutorials/player-urls) guide and [Player App SDK reference]({{site.baseurl}}/developers/reference/player-app-sdk#url-parameters).
