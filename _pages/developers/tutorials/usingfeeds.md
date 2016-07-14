---
permalink: /developers/tutorials/usingfeeds/
title: Using Feeds
keywords: developer
last_updated: July 11, 2016
tags: []
---

# Overview
`HTML Apps` may require `third party data` integration, think of POS or News information. 
The `EXP platform` provides a variety of third party connectors called `FEEDS`.
This tutorial will show you, how to set up a `FEED` in the `EXP platform` and integrate the data returned in a Angular HTML app.

# RSS HTML APP
We are going to create a standalone `Angular HTML App` that will pull RSS news information from the `EXP platform`.
To get the RSS news data form the `EXP platform` we will use the `EXP JavaScript SDK` to help us make a connection.
For more info on the `EXP JavaScript SDK`, please check the [Developer Guide - Reference](http://docs.goexp.io/). 

## Setup Feed
In the `EXP platform` we are going to setup a `RSS FEED`. We will use this News RSS url from the internet: `http://feeds.bbci.co.uk/news/rss.xml`

- Login to `EXP` and select feeds.

- Click the `ADD` button and give the feed a valid unique name like `BBC NEWS`.

- Select `RSS` as `FEED` type.

- Enter the URL `http://feeds.bbci.co.uk/news/rss.xml`.

- Set the `max results` to 30.

- Click the `SAVE` button.

![Uploading an App](/common_images/tutorials/feed_tutorial_1.png "feed tutorial 1")

- Select the `FEED` and click on the `PREVIEW` button to test the `FEED`.

![Uploading an App](/common_images/tutorials/feed_tutorial_2.png "feed tutorial 2")

- To get the `UUID` of the `FEED` please access the [API docs page](https://api.goexp.io/public/docs/).

- Authenticate with a valid account and go to the `FEEDS` section. 

![Uploading an App](/common_images/tutorials/feed_tutorial_3.png "feed tutorial 3")

## Create Consumer App
To grand the `EXP JavaScript SDK` access to the `FEED` we need to create a `consumer app` in the `EXP platform`.
  
- Go to `Current Organisation`

- Select `Consumer App`

- Create a new add and call it `RSSNEWS`

- Select the properties of the `Consumer App`

- Copy the `UUID` and `API KEY`

![Uploading an App](/common_images/tutorials/feed_tutorial_4.png "feed tutorial 4")

## App Start Point
This is the starting point of the `Angular RSS HTML` app. 
We are using `Bower` to manage the `Angular modules` and later the EXP SDK. 
Alternative the modules can also be `downloaded` by hand and included, or `CDN` links can be used. 

1. [Angular - Reference](https://angularjs.org/)

2. [Bower - Reference](https://bower.io/)

3. [EXP Javascript SDK - Reference](http://docs.goexp.io/developers/reference/javascript-sdk-1.0.0/)

- Copy the HTML code and add this to the `index.html` file in your project directory:

```html
<!DOCTYPE html>
<html lang="en" ng-app="RSSNewsAPP">
<head>
    <meta charset="UTF-8">
    <title>RSS News App</title>
</head>
<body style="width: 100%;height: 100%;background-color: antiquewhite" ng-controller="rssDataController">
<div style="width: 80%;margin: 0 auto">
    <h1> {{ provider }} </h1>
    <div style="width: 100%;border-top: solid;border-top-width: thin"></div>
</div>
<div style="width: 80%;margin: 0 auto;overflow: auto">
    <div style="width: 100%;margin: 0 auto" ng-repeat="item in rssItems">
        <h3> {{ item.title }} </h3>
        {{ item.text }}
        <div style="width: 100%;border-top: solid;border-top-width: thin;border-top-color: lightgray"></div>
    </div>
</div>
</body>
<script type="text/javascript" src="bower_components/angular/angular.min.js"></script>
<script type="text/javascript" src="app.js"></script>
</html>
```

- Copy the JavaScript code and add this to the `app.js` file in your project directory:
 
```javascript
app = angular.module('RSSNewsAPP',[]);

app.controller('rssDataController',['$scope', function($scope){
    $scope.rssItems = [{title: 'David Cameron prepares to hand over to Theresa May', text:'David Cameron defends his achievements in his final Prime Minister\'s Questions before leaving No 10 for the final time and handing over power to Theresa May.'}];
    $scope.provider = 'BBC TOP STORIES';
}]);
```

Preview the `Angular HTML app` in the browser to check if it works correctly. 
 
## EXP JavaScript SDK
The `Angular HTML app` has a `controller` that has two scope variables, rssItems and provider.
At the moment the `scope variables` in the `Angular HTML app` contains dummy data. 
At this point we will add the `EXP JavaScript SDK` to get live `data`.
    
- Using `Bower` do the following command to install the `EXP JavaScript SDK`.

```bash
bower install exp-sdk -save
```

- Include the `exp-sdk` in the `index.html` file:

```html
<!DOCTYPE html>
<html lang="en" ng-app="RSSNewsAPP">
<head>
    <meta charset="UTF-8">
    <title>RSS News App</title>
</head>
<body style="width: 100%;height: 100%;background-color: antiquewhite;font-family: Arial" ng-controller="rssDataController">
<div style="width: 80%;margin: 0 auto">
    <h1> { { provider } } </h1>
    <div style="width: 100%;border-top: solid;border-top-width: thin"></div>
</div>
<div style="width: 80%;margin: 0 auto;overflow: auto">
    <div style="width: 100%;margin: 0 auto" ng-repeat="item in rssItems">
        <h3> { { item.title } } </h3>
        { { item.text } }
        <div style="width: 100%;border-top: solid;border-top-width: thin;border-top-color: lightgray"></div>
    </div>
</div>
</body>
<script type="text/javascript" src="bower_components/angular/angular.min.js"></script>
<script type="text/javascript" src="bower_components/exp-sdk/exp-sdk.js"></script>
<script type="text/javascript" src="app.js"></script>
</html>
```

## Connecting to EXP SKD
Now that the `exp-sdk.js` is added to the `Angular HTML app` the `EXP` object is available to connect to the `EXP platform`. 

We will add all `consumerKey credentials` and the `UUID` of the `FEED` to the project. We need this information to make a connection to the `EXP platform`. 

- Add 2 value objects to the `app.js` file and enter your credentials.


```javascript
app = angular.module('RSSNewsAPP',[]);

app.value('consumeKey', {
    "uuid": "your consumer UUID",
    "apiKey": "your consumer apiKey"
});

app.value('rssFeed', {'uuid': 'You RSS feed UUID'});

app.controller('rssDataController',['$scope', function($scope){
    $scope.rssItems = [{title: 'David Cameron prepares to hand over to Theresa May', text:'David Cameron defends his achievements in his final Prime Minister\'s Questions before leaving No 10 for the final time and handing over power to Theresa May.'}];
    $scope.provider = 'BBC TOP STORIES';
}]);
```

We will use a `Angular factory` to provide the data from the EXP RSS `FEED`. In this factory the `connection` is made and the `FEED data` is requested from the `EXP platform`.

- Add the factory to the `app.js` file.

```javascript
app = angular.module('RSSNewsAPP',[]);

app.value('consumeKey', {
    "uuid": "your consumer UUID",
    "apiKey": "your consumer apiKey"
});

app.value('rssFeed', {'uuid': 'You RSS feed UUID'});

app.factory('expDataFactory', ['consumeKey', 'rssFeed', function (consumeKey, rssFeed) {

    // Authenticating as a consumer app.
    var exp = EXP.start({
        uuid: consumeKey.uuid,
        apiKey: consumeKey.apiKey
    });

    return {
        'getRSSData': function () {
            return exp.getFeed(rssFeed.uuid)
                .then(function (feed) {
                    return feed.getData();
                })

        }
    }

}]);

app.controller('rssDataController',['$scope', function($scope){
    $scope.rssItems = [{title: 'David Cameron prepares to hand over to Theresa May', text:'David Cameron defends his achievements in his final Prime Minister\'s Questions before leaving No 10 for the final time and handing over power to Theresa May.'}];
    $scope.provider = 'BBC TOP STORIES';
}]);
```

We can now call this factory from the `controller` and populate the `scope variables` with the data.

- Modify the controller as seen below in the `app.js` file. The interval option will refresh the `RSS data` every `30 seconds`.

```javascript
app = angular.module('RSSNewsAPP',[]);

app.value('consumeKey', {
    "uuid": "your consumer UUID",
    "apiKey": "your consumer apiKey"
});

app.value('rssFeed', {'uuid': 'You RSS feed UUID'});

app.factory('expDataFactory', ['consumeKey', 'rssFeed', function (consumeKey, rssFeed) {

    // Authenticating as a consumer app.
    var exp = EXP.start({
        uuid: consumeKey.uuid,
        apiKey: consumeKey.apiKey
    });

    return {
        'getRSSData': function () {
            return exp.getFeed(rssFeed.uuid)
                .then(function (feed) {
                    return feed.getData();
                })

        }
    }

}]);

app.controller('rssDataController', ['$scope','$interval', 'expDataFactory', function ($scope, $interval, expDataFactory) {

    // call data from factory
    var getRSSData = function(){
        expDataFactory.getRSSData()
            .then(function (data) {
                if(data){
                    $scope.rssItems = data.items;
                    $scope.provider = data.details.description;
                    $scope.$apply();
                }
            });
    };

    // initial call
    getRSSData();
    // interval call every 30 seconds
    $interval(getRSSData,3000);

}]);
```

We will now modify the `HTML` page to add images from the `RSS FEED`.

- Copy this HTML version in `index.html`.

```html
<!DOCTYPE html>
<html lang="en" ng-app="RSSNewsAPP">

<head>
    <meta charset="UTF-8">
    <title>RSS News App</title>
</head>

<body style="width: 100%;height: 100%;background-color: antiquewhite;font-family: Arial" ng-controller="rssDataController">
<div style="width: 80%;margin: 0 auto">
    <h1>{ { provider } }</h1>
    <div style="width: 100%;border-top: solid;border-top-width: thin"></div>
</div>
<div style="width: 80%;margin: 0 auto;overflow: auto">
    <div style="width: 100%;margin: 0 auto" ng-repeat="item in rssItems">
        <table style="width: 100%;">
            <tr>
                <td rowspan="2" style="width: 10%"><img ng-src={ { item.metadata.media.thumbnail[0]['$'].url } } style="height: 100px"></td>
                <td colspan="2" style="vertical-align:top;font-weight: bold;height: 10%">{ { item.metadata.title } }</td>
            </tr>
            <tr>
                <td colspan="2" style="vertical-align:top">{ { item.text } }</td>
            </tr>
            <tr>
                <td colspan="3" style="width: 100%;border-top: solid;border-top-width: thin;border-top-color: lightgray"></td>
            </tr>
        </table>
    </div>
</div>
</body>

<script type="text/javascript" src="bower_components/angular/angular.min.js"></script>
<script type="text/javascript" src="bower_components/exp-sdk/exp-sdk.js"></script>
<script type="text/javascript" src="app.js"></script>

</html>
```

## End Result
When running the `Angular HTML app` you should be able to see a result like this:
 
![Uploading an App](/common_images/tutorials/feed_tutorial_5.png "feed tutorial 5")

# Conclusion
That’s it! You have now learned the basics of how to `integrate FEED data` using the `EXP JavaScript SDK`. 

Scala offers a List of `SDK's` for multiple program languages:

- [Python SDK - Reference](http://docs.goexp.io/developers/reference/python-sdk/)

- [Player app SDK - Reference](http://docs.goexp.io/developers/reference/player-app-sdk/)

- [IOS SDK - Reference](http://docs.goexp.io/developers/reference/ios-sdk/)

- [Android SDK - Reference](http://docs.goexp.io/developers/reference/android-sdk/)
