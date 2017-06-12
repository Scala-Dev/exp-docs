---
permalink: /developers/tutorials/usingfeeds
title: Using Feeds
keywords: developer
last_updated: July 11, 2016
tags: []
---

# Overview
HTML Apps may require third party data `integration`, perhaps you want to setup a point of sale (POS) or display news information.
The EXP platform provides a data aggregator with a variety of third party connectors called `feeds`.
This tutorial will show how to set up a feed in the EXP platform and integrate the data returned in an Angular JS HTML App.

# RSS HTML APP
As a example on how feed integrations works, we are going to create an Angular JS HTML App that will pull Facebook postings from the EXP platform.
This `Angular HTML App` will run in a EXP player and will use the [EXP Player APP SDK](/developers/reference/player-app-sdk) to get the Facebook data form the EXP platform.
For more info on the `EXP SDK's`, please check the [Developer Guide - Reference](#more-resources).

## Setup Feed
In the EXP platform we are going to setup a Facebook feed that will pull postings from the the scala Facebook page.

- Login to EXP and navigate to `Integrations`.

- Click the `Facebook` icon to create a integration. Follow the onscreen instructions, you have to enter valid facebook credentials.

![tutorial](/common_images/tutorials/feed_tutorial_1.png "feed tutorial 1")

- After you've successfully authorized and granted permission to EXP, click on `Feeds` in the menu on the left.

- Click the `ADD` button on the right top side and give the feed a valid unique name like `Scala Facebook Feed`.

- Select `Facebook` as feed type.

- Select `Static`.

- Enter the Facebook page name `scala`.

- Set the `max results` to 30.

- Click the `SAVE` button.

![tutorial](/common_images/tutorials/feed_tutorial_2.png "feed tutorial 2")

- Select the `FEED` and click on the `PREVIEW` button to test the `FEED`.

![tutorial](/common_images/tutorials/feed_tutorial_3.png "feed tutorial 3")

## EXP player SDK
The [EXP Player APP SDK](/developers/reference/player-app-sdk) will automatically be injected into all HTML apps running on an EXP player.
The EXP player fires a Javascript `load` function when the `SDK` is loaded.
From here the `SDK` can be accessed using the `exp` object.
For example getting configuration information: `exp.app.config`.

## App Start Point
This is the starting point of the Angular RSS HTML app.
We are using `Bower` to manage the `Angular modules`.
Alternatively, the modules can also be downloaded manually and included, or CDN links can be used.

1. [Angular - Reference](https://angularjs.org/)

2. [Angular Material - Reference](https://material.angularjs.org/latest/)

3. [Bower - Reference](https://bower.io/)

- Copy the HTML code and add this to the `index.html` file in your project directory:

```html

    <!DOCTYPE html>
    <html ng-app="facebookApp">

        <head>
            <meta charset="UTF-8">
            <title>Facebook APP</title>
            <link href="bower_components/angular-material/angular-material.min.css" rel="stylesheet">
            <link href="style/style.css" rel="stylesheet">
        </head>

        <body ng-controller="mainController" class="main_container">

        <md-toolbar class="tool_bar" layout="row" layout-align="center center">

            <div layout="row" layout-align="start center" class="title_container">
                <h1><span>{{pageName | uppercase}}</span></h1>
            </div>

            <div flex></div>

            <div class="image_container" layout="row" layout-align="center center">
                <img ng-src="{{pageLogo}}" class="image">
            </div>

        </md-toolbar>

        <md-content class="content_container">
            <md-grid-list md-cols="4" md-row-height="16:9">
                <md-grid-tile ng-repeat="message in messages" ng-style="message.background">

                    <div class="tile_content" layout="column" layout-align="start start">
                        <h2>{{message.text}}</h2>
                    </div>

                    <md-grid-tile-footer>
                        <div layout="row" class="footer_container">
                            <div>
                                <h3>{{message.created}}</h3>
                            </div>
                            <div flex>

                            </div>
                            <div>
                                <h3>{{message.date | date:'dd-MM-yyyy'}}</h3>
                            </div>
                        </div>
                    </md-grid-tile-footer>

                </md-grid-tile>
            </md-grid-list>
        </md-content>

        </body>
        <script src="bower_components/angular/angular.min.js" type="text/javascript"></script>
        <script src="bower_components/angular-material/angular-material.min.js" type="text/javascript"></script>
        <script src="bower_components/angular-animate/angular-animate.min.js" type="text/javascript"></script>
        <script src="bower_components/angular-aria/angular-aria.min.js" type="text/javascript"></script>

        <script src="scripts/app.js" type="text/javascript"></script>
    </html>

```

- Copy the JavaScript code and add this to the `app.js` file in your project directory:

```javascript

    'use strict';

    var app = angular.module('facebookApp',['ngMaterial']);

    app.controller('mainController',['$scope', function($scope){

        function getRandomColor() {
            var letters = '0123456789ABCDEF'.split('');
            var color = '#';
            for (var i = 0; i < 6; i++ ) {
                color += letters[Math.floor(Math.random() * 16)];
            }
            return color;
        }

        $scope.pageLogo = 'http://scala.com/wp-content/uploads/2012/07/scala-logo.png';
        $scope.pageName = 'Scala';
        $scope.messages = [
            {
                text:'How does Scala’s digital signage software work? Scala goes beyond traditional digital signage solutions. Curious about our extensive and proven capabilities?',
                date:'2016-06-20T08:44:32.000Z',
                created:'Scala | Digital Signage',
                background: {'background-color':getRandomColor()}
            }
        ];

    }]);

```

- When using `bower` you can add this to the `bower.json` file, and then run bower install:

```json
    {
      "name": "FacebookApp",
      "authors": [
        "SCALA <info@scala.com>"
      ],
      "description": "",
      "main": "",
      "license": "MIT",
      "homepage": "",
      "ignore": [
        "**/.*",
        "node_modules",
        "bower_components",
        "test",
        "tests"
      ],
      "dependencies": {
        "angular": "^1.5.8",
        "angular-material": "^1.0.9"
      }
    }
```

Check if the `app.js` and `angular modules` can be found and that the links in the `index.html` are ok.
Preview the `Angular HTML app` in the browser to check if it works correctly.

## EXP player SDK
The `Angular HTML app` uses a `controller` that has scope variables to `bind data` to the HTML file.
At the moment the `scope variables` in the `Angular HTML app` contains dummy data.
Goal is to `populate` these scope variables with data from our `SCALA Facebook FEED` receiving from `EXP`.

### Manifest File
Before start implementing the data in the `angular HTML App`, a configuration file can be added using a `manifest.json`.
This configuration file is placed in the root of the project.
In principle we are creating a App Template from the `angular HTML App` this way, allowing a `EXP user` to select a `FEED` or set a interval duration.

- Create a file called manifest.json in the root of the `Angular HTML App` and add this code:

```json
    {
      "name":"Facebook App",
      "icon":"web",
      "description":"display post information from facebook page",
      "background":"blue",
      "configTypes":[
        {
          "name":"feed",
          "type":"feed",
          "label":"Facebook Feed",
          "required":true,
          "path":"feed",
          "supportedTypes": ["scala:feed:facebook"]
        },
        {
          "name":"refreshRateSeconds",
          "type":"number",
          "min": 2,
          "label":"Refresh Rate (seconds)",
          "required":true,
          "path":"refreshRateSeconds"
        }
      ],
      "config":{
        "refreshRateSeconds": 600
      }
    }
```

Now we created an `App Template` from the `Angular HTML App` that can be configured.
A user can now select a `Facebook FEED` and `refresh interval` for the data in the `EXP platform`.

Looking in the manifest file the configTypes array allows to create properties to select in the `EXP platform`.

Available property types are:

1. `feed`: to select a feed.
2. `number`: to enter number values.
3. `text`: to enter text values.
4. `select`: a selection of options.
5. `image`: to select a image file.
6. `color`: to select a HTML color value.
7. `app`: to select any type of EXP content.

The config section will be used to set `default` values for the `Angular HTML App`.
To `access` these values using the 'EXP Player SDK', simple use the `exp` object and reference to the path name like: `exp.app.config.refreshRateSeconds`

### The load function
When the `load function` is fired the `Scala Player` is ready injecting the `exp object`, at that moment we can load all `angular code` and start the `Angular HTML App`.
The `Scala Player` can only fire this function when it's created in the `Angular HTML App`.

- Remove the `ng-app` option in the `index.html` page:

```html

    <!DOCTYPE html>
        <html>

            <head>
                <meta charset="UTF-8">
                <title>Facebook APP</title>
                <link href="bower_components/angular-material/angular-material.min.css" rel="stylesheet">
                <link href="style/style.css" rel="stylesheet">
            </head>

            <body ng-controller="mainController" class="main_container">

            <md-toolbar class="tool_bar" layout="row" layout-align="center center">

                <div layout="row" layout-align="start center" class="title_container">
                    <h1><span>{{pageName | uppercase}}</span></h1>
                </div>

                <div flex></div>

                <div class="image_container" layout="row" layout-align="center center">
                    <img ng-src="{{pageLogo}}" class="image">
                </div>

            </md-toolbar>

            <md-content class="content_container">
                <md-grid-list md-cols="4" md-row-height="16:9">
                    <md-grid-tile ng-repeat="message in messages" ng-style="message.background">

                        <div class="tile_content" layout="column" layout-align="start start">
                            <h2>{{message.text}}</h2>
                        </div>

                        <md-grid-tile-footer>
                            <div layout="row" class="footer_container">
                                <div>
                                    <h3>{{message.created}}</h3>
                                </div>
                                <div flex>

                                </div>
                                <div>
                                    <h3>{{message.date | date:'dd-MM-yyyy'}}</h3>
                                </div>
                            </div>
                        </md-grid-tile-footer>

                    </md-grid-tile>
                </md-grid-list>
            </md-content>

            </body>
            <script src="bower_components/angular/angular.min.js" type="text/javascript"></script>
            <script src="bower_components/angular-material/angular-material.min.js" type="text/javascript"></script>
            <script src="bower_components/angular-animate/angular-animate.min.js" type="text/javascript"></script>
            <script src="bower_components/angular-aria/angular-aria.min.js" type="text/javascript"></script>

            <script src="scripts/app.js" type="text/javascript"></script>
        </html>

```


- Bootstrap the App name in the load function, modify the app.js code:

```javascript

    'use strict';

    var app = angular.module('facebookApp',['ngMaterial']);

    // fires from EXP player
    function load () { angular.bootstrap(document.body, ['facebookApp']); }

    app.controller('mainController',['$scope', function($scope){

        function getRandomColor() {
            var letters = '0123456789ABCDEF'.split('');
            var color = '#';
            for (var i = 0; i < 6; i++ ) {
                color += letters[Math.floor(Math.random() * 16)];
            }
            return color;
        }

        $scope.pageLogo = 'http://scala.com/wp-content/uploads/2012/07/scala-logo.png';
        $scope.pageName = 'Scala';
        $scope.messages = [
            {
                text:'How does Scala’s digital signage software work? Scala goes beyond traditional digital signage solutions. Curious about our extensive and proven capabilities?',
                date:'2016-06-20T08:44:32.000Z',
                created:'Scala | Digital Signage',
                background: {'background-color':getRandomColor()}
            }
        ];

    }]);

```

### Access EXP object
Now that we are loading all `angular code` from the `load function` we can access the `exp object` safely in the angular controller.

- Create a function to get the feed Data using the `exp object`. Populate the data into the `$scope variables`.

- Controller should be modified like this:

```javascript
    'use strict';

    var app = angular.module('facebookApp',['ngMaterial']);

    // fires from EXP player
    function load () { angular.bootstrap(document.body, ['facebookApp']); }

    app.controller('mainController',['$scope','$interval', function($scope, $interval){

        $scope.pageLogo = '';
        $scope.pageName = '';
        $scope.messages = [];

        var getRandomColor = function() {
            var letters = '0123456789ABCDEF'.split('');
            var color = '#';
            for (var i = 0; i < 6; i++ ) {
                color += letters[Math.floor(Math.random() * 16)];
            }
            return color;
        };

        // get feed from EXP
        var getFeedData = function(){
            exp.getFeed(exp.app.config.feed.uuid)
                .then(function(feed){
                    return feed.getData();
                })
                .then(function(data){

                    $scope.pageLogo = data.details.imageUrl;
                    $scope.pageName = data.details.name;
                    $scope.messages = [];

                    for(var index=0; index<data.items.length;index++){

                        var tempText = '';
                        if(data.items[index].text.length > 210){
                            tempText = data.items[index].text.substr(1, 207) + '...';
                        }else{
                            tempText = data.items[index].text;
                        }

                        $scope.messages.push({
                            text: tempText,
                            date: data.items[index].date,
                            created: data.items[index].createdByDisplay,
                            background: {'background-color':getRandomColor()}
                        })
                    }

                    $scope.$apply();
                });
        };

        getFeedData();
        $interval(getFeedData, (exp.app.config.refreshRateSeconds * 1000))

    }]);
```

As you can see the `exp.getFeed` will get the `FEED` Object according to a `UUID` that we receive from the `config` object.
Then the `getData` function can be called to receive the json data from the `EXP platform`. These methods are `async` and work with the promise objects.

## End Result
To get the Angular HTML App running in EXP you have to preform a couple of steps:

- `Zip` your root dir including all files, `index.html` should be in the root. The `EXP platform` will `extract` this automatically when uploaded.

- Logon to the `EXP platform` and click on content.

- Select `Upload App Template`.

![Uploading an App](/common_images/tutorials/feed_tutorial_6.png "feed tutorial 6")

- When you save this the Template is available in the `EXP platform`.

- Go to Experiences and create a `Empty Experience`.

- Select `Apps` and add your App Template.

- Click on `App settings` button and set the properties.

![Uploading an App](/common_images/tutorials/feed_tutorial_7.png "feed tutorial 7")

- Add a `Player` and setup a `scheduling`.

When running the `Angular HTML app` you should be able to see a result like this:

![Uploading an App](/common_images/tutorials/feed_tutorial_5.png "feed tutorial 5")

# Conclusion
That’s it! You have now learned the basics of how to `integrate FEED data` using the `EXP Player SDK`.
You can download the finished demo application here: [facebookApp](https://github.com/ScalaInc/exp-app-boilerplates/tree/master/facebookApp)

Scala offers a List of `SDK's` for multiple program languages:

- [Python SDK - Reference](/developers/reference/python-sdk)

- [Player app SDK - Reference](/developers/reference/player-app-sdk)

- [IOS SDK - Reference](/developers/reference/ios-sdk)

- [Android SDK - Reference](/developers/reference/android-sdk)
