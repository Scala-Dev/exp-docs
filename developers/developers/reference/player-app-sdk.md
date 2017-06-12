---
permalink: /developers/reference/player-app-sdk
title: Player App SDK Reference
keywords: developer
last_updated: April 20, 2016
tags: []
---


# Namespaces

At load time, player apps have access to the global variable `exp`. This is a full running instance of the [javascript SDK](/developers/reference/javascript-sdk), but has two additional namespaces: `exp.app` and `exp.player`. Inside of an application, `exp.app` is a reference to the current app.

# URL Paramters

The following parameters can be added to the player url as query params or hash params:

- `host` Specify the authentication host (the api server) to use. Default is `api.goexp.io`.
- `debug` Enable debugging. Will stop player from restarting to leave logs accessible.
- `uuid` The uuid of the device or consumer app to use for authentication.
- `secret` The device's secret. We suggest using hash params to keep the secret off the wire.
- `apiKey` The consumer app's api key.
- `experience` The uuid of the experience to play.


# App

**`app.config`**

The apps configuration. Always an object.

```javascript
window.load = function () {
  document.getElementById('my-div').textContent = exp.app.config.text;
};
```

**`app.options`**

The options used to play the app.

```javascript
const myTemplateUuid = exp.app.options.template;
// exp.app.config === exp.app.options.config
```

**`app.element`**

The DOM element wrapping the app.

```javascript

// hide yourself!
exp.app.element.style.visibility = 'hidden';


// 

```


**`app.play()`**

Play the app. Returns a promise that resolves when playback is finished or rejects if playback was interrupted. Apps shouldn't try to play themselves.

```javascript

// Launch an app and play it.
exp.player.launch(options).then(function (app) { app.play(); });

```

**`app.stop()`**

Stop playback and remove the app gracefully. The app will enter the "finished" state for brief period of time for transitions to occur.


**`app.abort(error)`**

Stop playback and remove the app abruptly. The app will be detached from the DOM immediately. Optionally pass in an `error` to indicate why playback was stopped. Apps can call this method to indicate that there is some problem with playback. Apps can also use this method to stop the playback of other apps.



```javascript

// Abort yourself.
exp.app.abort(new Error('Something awful happened and I had to stop.'));

```



# Player

## Loading and Playing Apps

**`exp.player.load(options)`**

Loads an app given the [app launch options](#app-launch-options). Returns a promise that resolves to an [app](#app) that is ready to play.

**`exp.player.play(options)`**

Loads and plays an app given the [app launch options](#app-launch-options). Returns a promise that resolves when playback is finished, or rejects if playback was interrupted.


## Restarting and Pairing

**`exp.player.restart()`**

Restarts the player.


**`exp.player.pair(credentials)`**

Pairs the player. `credentials` is an object with fields `uuid` and `secret`/`apiKey`.


**`exp.player.unpair()`**

Unpairs and restarts the player.

# Positioning Apps in the DOM

Apps are styled to fill the available absolutely positioned space, i.e.

```css
app {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
}
```

Apps outside of any relative or absolute positioned parents will fill their parent and stack on top of eachother. To bring an app into the flow of the DOM put the app inside of a relatively positionined container.

# App Launch Options

**One** of the following options must be specified:

Name | Type | Description
--- | --- | ---
template | string | The UUID of the app template to use.
content | string or Array | A single UUID or url, or an array of UUIDs and URLs.
key | string | The key of an app within the player's experience.

Optional options:

Name | Type | Description
--- | --- | ---
container | DOM Element | The DOM element to load the app into. Defaults to the parent's container.
config | object | Configuration options for the app.
duration | number | The number of milliseconds the app should play for if the app doesn't have its own intrinsic duration.
forceDuration | boolean | Whether or not to force the app use the provided/default duration.

Specifying a list of content items will automatically generate a slideshow. The default behavior is that the slideshow will play for 60s, i.e. `{ forceDuration: true, duration: 60000 }`. We recommend specifying a duration as this behavior is likely to change.
