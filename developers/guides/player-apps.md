---
permalink: /developers/guides/player-apps
title: Player Apps
keywords: developer
last_updated: April 20, 2016
tags: []
---


# Overview

A player app is an HTML5 web application. Unlike a traditional web
page, a player app might have a very narrow purpose, i.e. to play a
video, monitor other running apps, or just listen for and respond to
external events. An app can be a little as a microservice, or as big
as a full angular user interface. Here are the important concepts:

- Apps are just HTML5 web pages.
- Apps can access and define configuration options.
- Apps run inside iframes within the player.
- Many apps can be playing simultaneously.
- Apps can launch other apps, and manage and interact with other apps.
- Apps have access to a running instance of the Player App SDK which includes the Javascript SDK.


# Player App Lifecycle

## Summary

Apps travel through 5 states during their lifecycle:

- `loading`: The app is being loaded.
- `ready` : The app can begin playback immediately.
- `playing` : The app is playing.
- `finished` : The app has finished playback.
- `unloaded` : The app has been detached from the DOM. He's dead, Jim.

An app can bind `load`, `play`, and `unload` methods to the window to
control their lifecycle.


## Loading and `window.load()`

When the DOM of the app has been loaded, the player attaches the
Player App SDK to the window of the app.

The player will then look for a `load` method on the app's window. The
`load` method is then called if it exists.

If no load method is provided, the player will immediately move the
app into the `ready` state.

If the load method returns a promise, the player will hold the app in
the `loading` state until the promise has resolved. The expectation
for all apps is that once load is completed that playback can begin
immediately.


```javascript

window.load = function () {
  // Return a promise that resolves when I'm ready to play.
};

```

## Playback and `window.play()`

When an app has entered the `ready` state, `app.play()` tells
the player to transition the app into the `playing` state.

The player will then look in the app window for a `play` method. If a
`play` method is defined, it is called.

If there is no play method or the play method does not return a
promise, the app will remain in the `playing` state until the
duration specified in the launch options (or the default duration) is reached.

If the play method returns a promise, the player will play the app
until either the promise is resolved/rejected OR if `forceDuration` is `true` and the duration specified in the launch options (or the default duration) has elapsed.

## Stopping: `window.stop()`

When an app enters the `finished` state, there is a short delay to
allow any visual transitions to resolve before the player transitions
the app into the `unloaded` state.

When the `finished` state is entered the player will look for a method named `stop` on the app window and call it. This is an opportunity for an app to prepare for being unloaded or queue internal transition out visuals.


## Unloading: `window.unload()`

Just before detaching the app from the DOM, the player looks for an
`unload` method on the app window and calls it if it exists. Note that
unlike `load` and `play` unload must perform its actions syncrounsly.

The player will then detach the app from the DOM. A reference to an
`unloaded` app is just a useless remnant that should be discarded to
release any remaining memory footprint.



## Errors and Aborting

When an app is aborted, the player immediately unloads the app. Apps
can be manually aborted by calling `app.abort()`. If the `load()` and
`play()` methods throw an error or return a rejected promise, the app
will also be aborted.

```javascript

// All of these will cause the app to be aborted.

window.load = function () {
  throw new Error();
};

window.play = function () {
  return Promise.reject();
};

window.play = function () {
  exp.app.abort();
};

```


# Parent Child Relationships

When an app launches another app, a parent-child relationship is
formed between the two apps, regardless of whether or not that
relationship is mirrored in the DOM. If the parent is aborted, the
children are aborted as well.



# Configuration

Apps can include a `manifest.json` alongside their `index.html` to
specify configuration options that app needs to run, along with
default values for those options. These options are shown in the user
interface. See the Player App Manifest reference materials for more
information (COMING SOON).



# Example: Video Player App

This example is a simple video player. It requires a single
configuration option, the source url of the video to play.

The load method puts the source url into the video element and returns
a promise that resolves when the video is ready to play.

The play method returns a promise that resolves when the video has
finished playing.

```html
<html>
  <head>
    <script src="main.js"></script>
  </head>
  <body><video id="video"></video></body>
</html>

```


```javascript

function load () {
  console.debug('App is now loading.');
  return new Promise(function (resolve) {
    var video = document.getElementById('video');
    video.oncanplay = resolve;
    video.setAttribute('src', exp.app.config.src);
  });
}


function play () {
  return new Promise(function (resolve) {
    var video = document.getElementById('video');
    video.onended = resolve;
    video.play();
  });
}


```

Once this app is uploaded to EXP and can be referenced by uuid, any player app in your organization can launch a video by url by simply calling:

```javascript

var options = { template: '[uuid]', config: { url: '[url]' }
exp.player.launch(options).then(function (app) {
    app.play().then(function () { console.log('The video is finished!'); });
});


```

An interesting exercise would be to add the ability to configure the
video to play multiple times, or loop.

Another interesting exercise would be to write an app that plays a
series of video apps with different urls, i.e. a video slideshow.


# Example: Image Viewer App

This example is a simple image player. It requires a single
configuration option, the source url of the image to play.

The load method puts the source url into the image element and returns
a promise that resolves when the image is loaded.

No play method is defined because images do not have a begining or end.


```html
<html>
  <head>
    <script src="main.js"></script>
  </head>
  <body><img id="image"></img></body>
</html>

```


```javascript

function load () {
  return new Promise(function (resolve) {
    var image = document.getElementById('image');
    image.onload = resolve;
    image.setAttribute('src', exp.app.config.src);
  });
}

```

*Once this app is uploaded to EXP and can be referenced by uuid, any player app in your organization can launch a video by url by simply calling:

```javascript

var options = { template: '[uuid]', config: { url: '[url]' }
exp.player.launch(options).then(function (app) {
    app.play().then(function () { console.log('The image was shown!'); });
});


```
