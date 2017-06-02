---
permalink: /developers/guides/content
title: Working with Content
keywords: developer
last_updated: November 10, 2016
tags: []
---


# Overview

Content is an important piece of the EXP ecosystem. Any file can be considered content but more
importantly there are specific types of content that make up an experiences. Here are the important concepts:

- Content can be any type of file.
- Content is arranged in a hierarchy of folders.
- [Apps](/developers/guides/player-apps) are a specific type of content.
- URLs can be used as content (think bookmarks).
- Files are processed after upload to provide additional data for App development.

# Navigating the Content Tree

Content for each organization is arranged in a tree.  The base level of the tree is the root folder.  
The root folder is a special folder that cannot be deleted. The uuid property of the root folder is
always `root` and the name of the folder is the same as the organization name (not the display name).

An example root folder for the organization with the display name `Scala R&D` with the unique name `scalard` would be:

```json
{
  "uuid": "root",
  "name": "scalard",
  "path": "/scalard",
  "subtype": "scala:content:folder"
}

```

To traverse the tree the SDKs provide helper methods on each [Content](/developers/reference/javascript-sdk.md#content) object that allows navigating through child content.

The following example logs the name of each content item in the root folder of the current organization:

```javascript

exp.getContent('root').then(root => {
  return root.getChildren();
})
.then(children => {
  children.map(child => {
    console.log(child.document.name);
  });
});

```

To continue walking the tree you can call the `child.getChildren()` function to get the content of a folder.

*See the SDK reference for more details on the [Content](/developers/reference/javascript-sdk.md#content) resource.

# Working with Different Types of Content

Content can be any of the following four subtypes:

- Folders
- Files
- Apps
- URLs


## Folders

Folders have the subtype `scala:content:folder`.  Just like a local filesystem a folder 
is used to group content items in a hierarchical tree.

## Files

Files have the subtype `scala:content:file`. The content repository allows upload of any file type.  
Files have a `size` and `mimeType` property to help with filtering or handling different media types in your apps. 

The SDKs provide a helper function `content.getUrl()` that returns a delivery URL that can be used to include assets in your apps.

An example of including an image asset in app:

```javascript

if (file.document.mimeType.indexOf('image/') ===  0) {
  document.getElementById('myImageTag').src = file.getUrl();
}

```

### Properties
All file types are post-processed to create properties. Every file is given an `md5`, `sha1` and `sha256` checksum.

| File Type        | Properties                                                      | 
|------------------|-----------------------------------------------------------------| 
| image/jpeg       | dimensions, exif latitude, exif longitude                       | 
| image/png        | dimensions                                                      | 
| image/gif        | dimensions                                                      | 
| image/x-ms-bmp   | dimensions                                                      | 
| image/tiff       | dimensions, exif latitude, exif longitude                       | 
| video/mpeg       | dimensions, exif latitude, exif longitude, duration, frame rate | 
| video/mp4        | dimensions, exif latitude, exif longitude, duration, frame rate | 
| video/x-m4v      | dimensions, exif latitude, exif longitude, duration, frame rate | 
| video/quicktime  | dimensions, exif latitude, exif longitude, duration, frame rate | 
| video/x-flv      | dimensions, exif latitude, exif longitude, duration, frame rate | 
| video/x-matroska | dimensions, exif latitude, exif longitude, duration, frame rate | 
| video/x-ms-wmv   | dimensions, exif latitude, exif longitude, duration, frame rate | 
| video/webm       | dimensions, exif latitude, exif longitude, duration, frame rate | 
| video/ogg        | dimensions, exif latitude, exif longitude, duration, frame rate | 
| video/3gpp       | dimensions, exif latitude, exif longitude, duration, frame rate | 
| audio/mpeg       | duration                                                        | 

### Variants
Certain file types are post processed to create alternative variants of different dimensions and formats.

| File Type                               | Variants                                                                             | 
|-----------------------------------------|--------------------------------------------------------------------------------------| 
| image/jpeg                              | png thumbnails (100px, 320px, 1080px)                                                | 
| image/png                               | png thumbnails (100px, 320px, 1080px)                                                | 
| image/x-ms-bmp                          | png thumbnails (100px, 320px, 1080px)                                                | 
| image/gif                               | png thumbnails (100px, 320px, 1080px)                                                | 
| image/tiff                              | png thumbnails (100px, 320px, 1080px)                                                | 
| image/svg+xml                           | png thumbnails (100px, 320px, 1080px)                                                | 
| video/x-msvideo                         | png thumbnails of the 60th frame of the video (100px, 320px, 1080px), transcoded mp4 | 
| video/x-ms-wmv                          | png thumbnails of the 60th frame of the video (100px, 320px, 1080px), transcoded mp4 | 
| video/x-flv                             | png thumbnails of the 60th frame of the video (100px, 320px, 1080px), transcoded mp4 | 
| video/x-matroska                        | png thumbnails of the 60th frame of the video (100px, 320px, 1080px), transcoded mp4 | 
| video/quicktime                         | png thumbnails of the 60th frame of the video (100px, 320px, 1080px), transcoded mp4 | 
| video/mp4                               | png thumbnails of the 60th frame of the video (100px, 320px, 1080px)                 | 
| video/3gpp                              | png thumbnails of the 60th frame of the video (100px, 320px, 1080px), transcoded mp4 | 
| video/ogg                               | png thumbnails of the 60th frame of the video (100px, 320px, 1080px)                 | 
| video/webm                              | png thumbnails of the 60th frame of the video (100px, 320px, 1080px)                 | 
| video/mpeg                              | png thumbnails of the 60th frame of the video (100px, 320px, 1080px), transcoded mp4 | 
| video/x-m4v                             | png thumbnails of the 60th frame of the video (100px, 320px, 1080px), transcoded mp4 | 
| application/pdf                         | png thumbnails of the first page (100px, 320px, 1080px)                              | 
| Compositions in application/json format | svg image, png thumbnails (100px, 320px, 1080px)                                     | 
| application/postscript                  | svg image of first page, png thumbnails of first page (100px, 320px, 1080px)         | 

## Apps

Apps have the subtype `scala:content:app`. The content repository allows uploading an index.html file or a zip file with an index.html, JavaScript, CSS and other static assets as an app. Apps are unpacked into a folder structure.  Apps cannot be nested and are treated as a single item in the content tree.

An app **must** contain an `index.html` file in the root of the app and if there is a `manifest.json` file in the root of the app, the file must be valid json.

Considering that apps are really just a special folder, the contents of an app can be traversed in a similar way to walking the tree.

When calling `content.getChildren()` on an app be sure to set the `appContent` parameter to include app children in the results. 

For example:

```javascript

app.getChildren({ appContent: 'include' }).then(children => {
  children.map(child => {
    console.log(child.document.name);
  });
});

```

## URLs

URLs have the subtype `scala:content:url`. Much like a bookmark a URL can be saved to the content tree.  URLs are broken down so that the individual host, scheme, port, path and query can be retrieved from a content URL.

Just like files and apps the `content.getUrl()` function can be used to return the complete URL value.


