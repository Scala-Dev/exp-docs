---
permalink: /developers/reference/manifest
title: Manifest.json Reference
keywords: manifest
---

The `manifest.json` is an optional file that can be included in the root of your custom app.
Besides providing metadata about your app such as its name and how it will appear to users in the
EXP UI, the manifest's primary purpose is to specify how your app will be configured. For instance, if you want your
app to allow a custom message or image to be shown, you would put the appropriate lines in your `manifest.json`.

## Metadata options
These options affect how your app appears to users of the app who are configuring it through the EXP UI.

```json
{
  "name": "Example App",
  "icon": "pencil",
  "background": "grey",
  "description": "An app that's an example"
}
```

**`name`**
The name for the app in the UI.

**`icon`**
The icon for the app in the UI.

**`background`**
The background color of the app in the UI.

**`description`**
A short description of the purpose of the app.

## Content configuration
In addition to the metadata properties, there are the `configTypes` and `config` properties.

`configTypes` is an array of objects, each object standing for a UI control which saves data to your experience. Each type is a different UI control for different way of presenting the user with a choice, including select dropdowns, lists of content, upload regions, simple text inputs, and checkboxes.

`config` is an object that serves as the "default" configuration object new instances of your app will have.

```json
{
  "name": "Example App",
  "configTypes": [
    {
      "name": "message",
      "type": "text",
      "label": "Message",
      "path": "userMessage",
      "required": false
    }
  ],
  "config": {
    "userMessage": "Default greeting message!"
  }
}
```

**`name`**
A required field that serves as a unique key (identifier) for this control

**`type`**
The type of value this is configuration for. The possible types of configuration objects are catalogued below.

**`label`**
The label shown to the user in the EXP UI.

**`path`**
The path in the `app.config` object to which this value will be stored.

**`required`**
A boolean value (default `false`) which, if true, will not let the user save changes to the app config unless
the value is present.

**`multiItem`**
A boolean value which is true if you are allowing an array of content to be configured. For instance, in a slideshow
with multiple pieces of content in a row this would be true.

**`supportedTypes`**
For types like `feed` that have a subtype of acceptable values, this property is an array of types that can be assigned to the field.


### configType: text
An input for a simple text message. Its value is a string and in the UI the user will edit it with a text input.

```json
{
  "configTypes": [
    {
      "name": "message",
      "type": "text",
      "label": "Message",
      "path": "userMessage",
      "required": false
    }
  ],
  "config": {
    "userMessage": "Default greeting message!"
  }
}
```

The attribute `pattern` is optional. If supplied, it causes the text element corresponding to this config object to validate
that its value matches the supplied pattern. It follows the rules of the [browser's pattern matching](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input#pattern).

The attribute `patternMessage` can be set, if you set a `pattern`. It is the message shown to the user if they try to enter a value
that doesn't match. If `patternMessage` isn't specified then it will just say "Invalid format".

```json
{
  "configTypes": [
    {
      "name": "ipAddress",
      "type": "text",
      "label": "IP Address",
      "path": "ipAddress",
      "required": false,
      "pattern": "\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b",
      "patternMessage": "Value must be an IP Address"
    }
  ],
  "config": {
    "ipAddress": "999:999:999:999"
  }
}
```

### configType: textarea
Similar to the `text` config type, but it defines a `<textarea>` where the user will enter their text. Textareas are better suited
than the simple `text` config type if the input is possibly going to have multiple line breaks.

The attribute `rows` is optional. If supplied, it causes the textarea eleemnt corresponding to this config object to generate a `<textarea>`
of the given height.

```json
{
  "configTypes": [
    {
      "name": "message",
      "type": "textarea",
      "label": "Message",
      "path": "userMessage",
      "required": false,
      "rows": 4
    }
  ],
  "config": {
    "userMessage": "Default greeting message!"
  }
}
```

### configType: number
A number field. Optionally supports `min` and `max` attributes.

```json
{
  "configTypes": [
    {
      "name": "waitTime",
      "type": "number",
      "label": "Wait Time (seconds)",
      "path": "waitTime",
      "min": 0,
      "max": 60
    }
  ],
  "config": {
    "waitTime": 5
  }
}
```

### configType: urlInput
A text field that is validated to be sure it's a URL.

```json
{
  "configTypes": [
    {
      "name": "homepage",
      "type": "urlInput",
      "label": "URL to homepage",
      "path": "homepage",
      "required": true
    }
  ],
  "config": {
    "homepage": ""
  }
}
```

### configType: checkbox
A checkbox input for a user to set a value to true or false.

```json
{
  "configTypes": [
    {
      "name": "showAdvertisement",
      "type": "checkbox",
      "label": "Show Advertisement",
      "path": "showAdvertisement"
    }
  ],
  "config": {
    "showAdvertisement": true
  }
}
```

### configType: slider
A slider input for a user to set a value.

The slider will snap to increments of size `step`.

```json
{
  "configTypes": [
    {
      "name": "speed",
      "type": "slider",
      "label": "Speed",
      "step": 5,
      "min": 0,
      "max": 200,
      "path": "speed",
      "required": true
    }
  ],
  "config": {
    "speed": 50
  }
}
```

### configType: content
A selector for generic content that can be uploaded to EXP. The user can choose to upload a piece of content or choose one from the content tree.

The content selector supports the `multiItem` option, if set to `true` then the user can upload multiple pieces of content.

Usually, you will want to add the `restriction` property to only allow the specified content types. If you are going to restrict to only
image, video or audio then instead of this config type, use `image`, `video` or `audio` which are identical but for that restriction (see below).

A full list of content types that can be restricted to:

* `"folder"`

* `"app"`

* `"image"`

* `"youtube"`

* `"url"`

* `"video"`

* `"pdf"`

* `"file"`

* `"composition"`

* `"audio"`

* `"vector"`

* `"code"`


```json
{
  "configTypes": [
    {
      "name": "promotionalContent",
      "type": "content",
      "label": "Promotional Content",
      "path": "promotionalContent",
      "multiItem": false,
      "required": true,
      "restriction": ["image", "video"]
    }
  ]
}
```

### configType: image
A selector for an image that will then be available to your app. The user can choose to upload an image or choose one from the content tree.

```json
{
  "configTypes": [
    {
      "name": "logo",
      "type": "image",
      "label": "Sidebar Logo",
      "path": "sidebarLogo",
      "multiItem": false,
      "required": false
    }
  ],
  "config": {}
}
```

### configType: video
A selector for a video that will then be available to your app. The user can choose to upload a video or choose one from the content tree.

```json
{
  "configTypes": [
    {
      "name": "highlights",
      "type": "video",
      "label": "Product Highlights",
      "path": "highlights",
      "multiItem": true,
      "required": false
    }
  ],
  "config": {
    "highlights": []
  }
}
```

### configType: audio
A selector for an audio file that will then be available to your app. The user can choose to upload an audio file or choose one from the content tree.

```json
{
  "configTypes": [
    {
      "name": "jingle",
      "type": "audio",
      "label": "Commercial Jingle",
      "path": "jingle",
      "multiItem": false,
      "required": false
    }
  ],
  "config": {}
}
```

### configType: feed
A selector for a feed of data that your app will consume. Feeds are configurable from the UI by users and can then be assigned to apps.

For this type, `supportedTypes` should be supplied with the type of feed you are expecting. Possible values include

* `"scala:feed:weather"`

* `"scala:feed:rss"`

* `"scala:feed:google"`

* `"scala:feed:outlook"`

* `"scala:feed:square"`

* `"scala:feed:shopify"`

* `"scala:feed:instagram"`

* `"scala:feed:facebook"`

* `"scala:feed:twitter"`

```json
{
  "configTypes": [
    {
      "name": "weather",
      "type": "feed",
      "label": "Weather Feed",
      "path": "weatherFeed",
      "required": true,
      "supportedTypes": [ "scala:feed:weather" ]
    }
  ],
  "config": {
  }
}
```

For types like feed for which it doesn't make sense to have a default value, leave the value out of the `config` object.

### configType: color
A color selector. Often used for letting the user configure a theme for your app.

```json
{
  "configTypes": [
    {
      "name":"primary",
      "type":"color",
      "label":"Primary Color",
      "required":true,
      "path":"primaryColor"
    }
  ],
  "config": {
    "primaryColor": "#F5F5DC"
  }
}
```

### configType: select
A drop-down selection of different values. There should be an
additional config parameter supplied called `options` that lists the possible values and what they should be labeled.

```json
{
  "configTypes": [
    {
      "name":"temp",
      "type":"select",
      "label":"Temperature",
      "required":true,
      "path":"temperature",
      "options":[
        {
          "label":"Celsius",
          "value":"c"
        },
        {
          "label":"Fahrenheit",
          "value":"f"
        }
      ]
    }
  ],
  "config": {
    "temperature": "f"
  }
}
```

### configType: app
Allows the user to select one or more apps from the current experience or import apps from their content tree.

Also allows the user to choose or upload content. The stored data is the `config` object of the [app launch options](/developers/reference/player-app-sdk.md#app-launch-options) available at `exp.app.config[<path>]` during player app runtime.

If you only want the user to be able to set one piece of content, use this object but set `multiItem` to `false`.

Can be restricted to certain types of content, along the same lines as the `content` config type.

```json
{
  "configTypes": [
    {
      "name": "content",
      "type": "app",
      "label": "Content For App",
      "required": true,
      "path": "contentItems",
      "restriction": ["video", "image"],
      "multiItem": false
    }
  ],
  "config": {
    "content": "[]"
  }
}
```

### configType: device
A selector for users to configure one or more devices for their app. For example, the app
might pull data from a `server` device that is configurable on an app-by-app basis.

If you only want the user to be able to set one device, use this object but set `multiItem` to `false`.

The usual use case for this is that only one or a few device types can be assigned. Define a `restriction` param, which is an array
of permitted device types. Possible values that can be restricted to are:

* `"scala:device:player"`

* `"scala:device:embedded"`

* `"scala:device:mobile"`

* `"scala:device:server"`

* `"scala:device:webbrowser"`

* `"scala:device:chromebox"`

* `"scala:device:android"`

```json
{
  "configTypes": [
    {
      "name": "photoServer",
      "type": "device",
      "multiItem": false,
      "label": "Photo Server",
      "required": true,
      "path": "server",
      "restriction": ["scala:device:server"]
    }
  ],
  "config": {}
}
```

### configType: thing
A selector for users to configure one or more things for their app.

If you only want the user to be able to set one thing, use this object but set `multiItem` to `false`.

The usual use case for this is that only one or a few thing types can be assigned. Define a `restriction` param, which is an array
of permitted thing types. Possible values that can be restricted to are:

* `"scala:thing:beacon"`

* `"scala:thing:endpoint"`

* `"scala:thing:rfid"`

* `"scala:thing:hueBulb"`

* `"scala:thing:hueBridge"`

```json
{
  "configTypes": [
    {
      "name": "nearbyBeacons",
      "type": "thing",
      "multiItem": true,
      "label": "Nearby Beacons",
      "required": false,
      "path": "nearbyBeacons",
      "restriction": ["scala:thing:beacon"]
    }
  ],
  "config": {
    "nearbyBeacons": []
  }
}
```

### configType: location
A selector for users to configure one or more locations for their app.

If you only want the user to be able to set one location, use this object but set `multiItem` to `false`.

```json
{
  "configTypes": [
    {
      "name": "zone",
      "type": "location",
      "multiItem": false,
      "label": "Zone",
      "required": false,
      "path": "zone"
    }
  ],
  "config": {}
}
```

### configType: date
A selector for users to configure a date for their app.

Takes a `min` and `max` optional parameter in the format `MM/DD/YYYY`.

```json
{
  "configTypes": [
    {
      "name": "promotionDay",
      "type": "date",
      "label": "Promotion Day",
      "required": true,
      "path": "promotionDay",
      "min": "10/15/2016"
    }
  ],
  "config": {
  }
}
```

### configType: time
A selector for users to configure a time for their app.

```json
{
  "configTypes": [
    {
      "name": "storeOpen",
      "type": "time",
      "label": "Store Open",
      "required": true,
      "path": "storeOpen"
    }
  ],
  "config": {
  }
}
```
