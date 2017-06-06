---
permalink: /updates/release-notes
title: Release Notes
keywords: developer
tags: [updates]
---

## May 2017 Release

- Android SDK 5.0.0 [click here](https://github.com/ScalaInc/exp-android-sdk/releases/tag/v5.0.0).

  - First Eagle release for Android SDK for single tenant

- IOS SDK 5.0.0 [click here](https://github.com/ScalaInc/exp-ios-sdk/releases/tag/v5.0.0).

  - First Eagle release for IOS SDK for single tenant


## December 2016 Release

- With the latest release, we made breaking changes to the github and bitbucket feed response format to fix the naming of properties that were inconsistent with the other feed formats.

- Changes to an experience now cause a graceful transition from the old experience to the new instead of restarting the player.

- Android SDK v1.0.6 [click here](https://github.com/ScalaInc/exp-android-sdk/releases/tag/v1.0.6).
  
  - Added `Create`, `Delete`, `Update`, `Refresh` to Exp model.

  - Added setProperty to Exp model.

- IOS SDK v1.0.6 [click here](https://github.com/ScalaInc/exp-ios-sdk/releases/tag/v1.0.6).
  
  - Added `Create`, `Delete`, `Update`, `Refresh` to Exp model.
  
  - Added `setProperty` to Exp model.


## November 2016 Release

- IOS SDK v1.0.5 [view this release](https://github.com/ScalaInc/exp-ios-sdk/releases/tag/v1.0.5).
 
  - Added Swift 3.0 support - **if you're using previous version there are breaking changes**.
 	
  - Added Sequencetype extension for SearchResults to iterate the response.

  - Updated all the project dependencies to the latest stable release. 

- Android SDK v1.0.5 [view this release](https://github.com/ScalaInc/exp-android-sdk/releases/tag/v1.0.5).

  - Added implements Iterable<T> for SearchResults to iterate the response.  

  - Updated all the project dependencies to the latest stable release. 

- New version of exp-cli with a new `deploy` feature to upload apps from your development environment. [View on NPM](https://www.npmjs.com/package/exp-cli).

- Added support for datepicker and timepicker type in app manifest

- Added restart, pair, and unpair methods to player app SDK. [View documentation](/developers/reference/player-app-sdk.md#restarting-and-pairing)

- The player app Slideshow is now called Playlist.

- The global social media app now supports Yammer feeds.

  

## October 2016 Release

- Added a weekly schedule view

- Added Yammer to integrations

## September 2016 Release

- Meeting Room App

  - Now supports multi-day events

  - Now updates immediately when events become active

## August 2016 Release

- Javascript SDK v1.0.4

  - Added `total` fields on most query responses to support pagination.

  - Most queries now support filtering with query params.

  - Auth can now be passed directly into `EXP.start`

- Player updates

  - Apps now support `app.stop()` for graceful shutdown.

  - Can now add `window.stop` method to app `window`. Will be called when app is stopped but before its unloaded.

- Manifest.json

  - We now support Device, Thing and Location selection fields in app settings.

- Added LinkedIn [integration](/developers/guides/feeds.md#integrations)

