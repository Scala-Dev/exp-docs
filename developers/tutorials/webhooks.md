---
permalink: /developers/tutorials/webhooks
title: Using a Broadcast Web Hook to Fling
keywords: developer, webhook, webhooks, IFTTT, fling, video, content
last_updated: March 3, 2017
tags: []
---

<link rel="stylesheet" href="/_pages/developers/tutorials/webhooks.css">

# Overview

The definition of Web Hooks can be formulated as "user-defined HTTP(S) callbacks". These Web Hooks can be defined in the EXP interface allowing third party resources to call them. This guide will demonstrate the use of Web Hooks in EXP. We will be using IFTTT (https://ifttt.com) to fling content to a EXP player when a video in youtube is liked.
  
## prerequisite

To successfully setup this webhook example we need the following pieces in place:
 
1. A IFTTT (https://ifttt.com) Account. You can sign up for free.
2. A EXP account. (https://goexp.io). You can sing up for a demo account.
3. One EXP player running on a device. Please refer to the Tutorials on how to set this up.
4. Google account for youtube.

### IFTTT

IFTTT stands for "if this than that". They allow you to hook up multiple web-applications that can interact with each other. In this demonstration it will be the glu connecting youtube to our EXP platform using Web Hooks. For more information please visit there website at https://ifttt.com. 

# Building Your Web Hook Fling Demo

Before we can hook up **Youtube** to **EXP** using **IFTTT** we need to define a **Web Hook** in **EXP**. 

## Setup Web Hook

1. Login to **EXP**.
2. Select you organization in the right top corner and choose **"Current Organization"**.
3. Select **"Broadcast Web Hooks"**.
4. In the right top corner you can create a new **Web Hook**.
5. Enter a valid name for the **web Hook**.
6. Enter for **event name** **"fling"**.
7. Enter for **channel name** **"organization"**, this will fling content to all players in the organization. You can also select a individual player by using **UUID**, or select **location/zone**, or select **experience**. 
8. When you have saved the **Web Hook**, find it in the list and open the **details**.
9. Copy the Web Hook **URL** that we need in our **IFTTT** setup.

![Create a Web Hook](/common_images/webhook/webhook.gif "Create a Web Hook")

## Setup IFTTT

1. Login to **IFTTT**.
2. Click on **New Applet**.
3. Select this to add a trigger.
4. Search for youtube. 
5. When asked for authenticate with your youtube account.
6. Select **New Liked Video** as trigger.
7. Select that to hook up the **Web Hook**.
8. Search on **Maker**.
9. Select **Make a Web Request**.
10. In the URL box past the **Web Hook** URL from EXP.
11. Select **POST** as method.
12. Content Type **application/json**.
13. For the body enter the following Json string -> **{"content":"{{Url}}"}**. This describes when **content** needs to be played.
14. Create **Web Request** and Finish **Applet**.

![Setup IFTTT](/common_images/webhook/webhook2.gif "Setup IFTTT")

## Test Setup

1. Open your Applets in **IFTTT** and select the Youtube Setup.
2. Be sure that the Applet is in the **On** status.
3. Click on the **Check Now** button.
4. Go to **Youtube** and select a movie to like.
5. Now the **Web Hook** will be called and the players will run the **Youtube** video.
6. There could be some time lag depending on your internet connection.

# Recap

Great now you got your fist **Web Hook** setup running. As you have seen creation of a **Web Hooks** in **EXP** is a relative easy task. Using Tools like **IFTTT** helps you bind 3rd party **web apps** to EXP.  