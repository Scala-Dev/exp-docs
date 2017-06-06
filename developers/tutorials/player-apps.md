---
permalink: /developers/tutorials/player-apps
title: Getting Started With Player App Development
keywords: developer
last_updated: April 12, 2016
tags: [getting_started]
---

# What an EXP Player App Is

## It consists of HTML, CSS, Javscript and a configuration file
Your app consists of a directory of one or more files, the most important of which is the `index.html`.
When the app is scheduled to be played in an EXP player, the `index.html` will be displayed on the player, with any
styles or script tags included in the index file also being loaded as you would expect.

## Your App has Access to the EXP Javascript SDK
A running instance of the EXP Javascript SDK is available on the `window` object to be used by your javascript. It will be used to get
dynamic content and broadcast events to other devices in the experience.

## Explicit authentication is unnecessary
When an app using the Javascript SDK is running inside of a player, the player itself has already has been authenticated by the
pairing process.

## It has dynamic configuration
Your app can be written to be flexible about its content. For instance, in a slideshow app the images and videos are not
part of the app itself, but configured from the EXP UI after the app has been added to an experience. Your app will
indicate what configuration options it will have through its `manifest.json` file, which is explained more in the
Hello World example.


# Hello World for EXP Player Apps
This is a walkthrough for how to make your own custom app in EXP. Our goal is to show you:

* what the bare minimum necessary files are for an EXP app to work on a player
* how to get access to the config object that will allow you to configure your apps from the EXP interface
* how to upload your app and get it running on a debug player

## 1. The `index.html`
To get started with an EXP app, make a new directory and put a file called `index.html` into it. The directory
containing `index.html` is what we'll eventually upload to EXP. Write the following in your `index.html`:

    <!DOCTYPE html>
    <html>
      <head>
        <link href='//fonts.googleapis.com/css?family=Roboto:100' rel='stylesheet' type='text/css'>
        <style>
          html { font-family: 'Roboto', sans-serif; color: #7E57C2; background-color: #FFF }
        </style>
      </head>
      <body>
        <h1>Let's get started!</h1>
      </body>
    </html>

So far, it is a very simple HTML document that simply shows a static header in a nice font. In fact, an `index.html`
with anything at all in it (that's valid HTML) is all that's necessary for an app, and we could just upload it right now.
We'll spruce it up a bit more before uploading it though.

## 2. Showing dynamic content
Showing some HTML on a screen is useful, but it's not the main strength of EXP. The real reason we want to write an EXP app
is to show dynamic content loaded from the cloud. For our Hello World app we will inject the simplest possible dynamic content into our
page -- some text.

Modify the `index.html` to include a div in which to put the string and an external javascript file. It should look like:

    <!DOCTYPE html>
    <html>
      <head>
        <link href='//fonts.googleapis.com/css?family=Roboto:100' rel='stylesheet' type='text/css'>
        <style>
          html { font-family: 'Roboto', sans-serif; color: #7E57C2; background-color: #FFF }
        </style>
      </head>
      <body>
        <h1>Let's get started!</h1>
        <div id="message-container"></div>

        <script src="main.js"></script>
      </body>
    </html>

And create a `main.js` file alongside the `index.html` file with the following contents:

    'use strict';

    function play() {
      var message = exp.app.config.message;
      var container = document.getElementById('message-container');
      
      container.innerHTML = message;
    }

What happens in this bit of Javascript is that we execute some logic within the function `play`. The `play` function is
called automatically by EXP when the app is ready to go, so all our logic must be initiated from within it.

For our Hello World app, we want to show some text on the screen, so we put the text from `exp.app.config` into the container div.

## 3. Setting up configuration
Finally, we must create the `manifest.json` file alongside the `index.html` and `main.js` files. The manifest should exist
in every EXP app, and contains information about the app like its name as well as what there is that can be configured.
For our app it will be:

    {
      "name": "Hello World",
      "configTypes": [{
        "name": "message",
        "type": "text",
        "label": "Message to User",
        "required": false,
        "path": "message"
      }],
      "config": {
        "message": ""
      }
    }

The above manifest allows one text field configuration parameter for an app. The most important line to take note of in this
manifest is where we set `"path": "message"`. In `main.js` we depend on this path being set up that way with the line:

    var message = exp.app.config.message;

The initial state of the config object is being set in the manifest too. We set `message` to be a blank string.

## 4. Uploading and Testing the App
The code for the app is now complete. Compress the app directory into a .zip file and upload it as a content item to the content tree.
After clicking "Upload App", you will be prompted to enter a name and upload the file. 

![Uploading an App](/images/developers/playerApps/uploading_an_app.gif "Uploading an App")

From the Experiences route, create a new experience (choose "Empty Experience" rather than "From Template"), then from the apps tab add a new instance of the app we just wrote.

![Making an Experience](/images/developers/playerApps/making_an_experience.gif "Making an Experience")

From the app settings menu for the instance of the app we just added, configure the message.

![App Settings](/images/developers/playerApps/app_settings.png "App Settings")

From the Schedule tab, add a new day plan that runs our app at all times of the day, and assign that day plan to the current day.

![Scheduling an Experience](/images/developers/playerApps/scheduling_an_experience.gif "Scheduling an Experience")

Now, we have an experience with our app included and scheduled to run. The last step is assigning a device to show whatever is
scheduled to be running right now. If you don't already have a player set up and added in EXP, do so now by adding a new device
from the Devices tab of the experience and entering the pairing code from <a href="https://player.goexp.io" target="blank">player.goexp.io</a>. If you
already have a player set up, add that to the experience instead.

As soon as the device is added we should see the player showing something like:

![Hello World Player](/images/developers/hello_world_player.png "Hello World Player")

# Conclusion
That's it! You have now learned the basics of how to create an EXP player app.

To learn more about what's possible with an EXP player app, read the documentation for the [EXP Javascript SDK]({{site.baseurl}}/developers/reference/javascript_sdk_reference).
