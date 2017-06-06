---
permalink: /developers/tutorials/quickstart
title: Configuring an Experience
keywords: developer
last_updated: April 12, 2016
tags: [getting_started]
---

# Creating Your First Experience

The easiest way to get content onto a screen is to create an experience using the Playlist App.
An experience is made up of the configuration and scheduling needed for a player to show content.

## First Things First
Before we get started, make sure you have access to an EXP player.  The [Scala EXP Player](https://chrome.google.com/webstore/detail/scala-exp-player/effhcaaecikakknjnpmkaojnpfcoblik) is available as a Chrome App in the Chrome Web Store.  

If you're just kicking the tires the easiest way to get to a player is by opening [https://player.goexp.io](https://player.goexp.io) in the [Google Chrome Web Browser](https://www.google.com/chrome/).


## Let's Go!
To get started create an experience using the Playlist Experience template and upload some content in the app settings menu.

![Create and Configure an Experience](/images/developers/quickstart/create-and-configure.gif "Create and Configure an Experience")

An Experience Template is a set of canned app configuration with scheduling.  The Playlist Experience template has one app (the Playlist App) and a 24/7 schedule for that single app.

Open your player to get a pairing code.

![Player Showing Pairing Code](/images/developers/quickstart/player-pairing-code.png "Player Showing Pairing Code")

Create a device in your experience using the pairing code from the player.

![Create a Player with Pairing Code](/images/developers/quickstart/pair-player.gif "Create a Player with Pairing Code")

## All Set
That's it! You should now have content playing on your player.

You can find more information about the player using the hidden player menu by clicking near the bottom left corner of the screen.
![Hidden Player Menu](/images/developers/quickstart/player-menu-app.png "Hidden Player Menu")

You're ready to start writing your own custom apps, take a look at the documentation for [Player App Development]({{site.baseurl}}/developers/tutorials/player-apps).
