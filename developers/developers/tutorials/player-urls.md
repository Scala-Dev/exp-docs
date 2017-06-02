---
permalink: /developers/tutorials/player-urls
title: Player URLs
keywords: developer
last_updated: April 12, 2016
tags: [getting_started]
---

These are the instructions for making a player which doesn't need to be paired, it just works when navigated to from a web browser at the proper URL.

# Creating a Paired Player URL

1. Create a player by entering a name and NO pairing code.

    ![Create New Device](/images/developers/playerUrls/creating_new_device.png)

2. Save the uuid and secret of the device. You will only be given this option once. There's a Download button to save it as a json file.

    ![Save Uuid and Secret](/images/developers/playerUrls/uuid_and_secret.png)

3. Add the uuid and secret to the query parameters OR hash of the player URL and use this as a web clip in Enterprise. e.g.

  ```
  https://player.goexp.io/#uuid=4f5c8b9f-90e3-41cc-b175-4f5fff4164e5&secret=30ba5f95fe4159fd1cc6dc4626ac69c38da87374b7f0b3257ee36ab29c79f3d3823607c0
  ```

  or

  ```
  https://player.goexp.io/?uuid=4f5c8b9f-90e3-41cc-b175-4f5fff4164e5&secret=30ba5f95fe4159fd1cc6dc4626ac69c38da87374b7f0b3257ee36ab29c79f3d3823607c0
  ```

# Creating a Planned Player URL (Fixed Experience or App)

In addition to making a URL that points to a specific player, it is possible to make a URL that points to a specific player and experience and app in that experience.

Start with the URL created above pointing to a device in an experience:

  ```
  https://player.goexp.io/#uuid=4f5c8b9f-90e3-41cc-b175-4f5fff4164e5&secret=30ba5f95fe4159fd1cc6dc4626ac69c38da87374b7f0b3257ee36ab29c79f3d3823607c0
  ```

Then steal the experience uuid and app key from the URL of the app config page.


![Planned Player URL](/images/developers/playerUrls/planned_player_url.png)

Add the experience uuid and app key as query params to the existing URL (it will now have four query parameters: `uuid` and `secret` which correspond to the device, and the new `experience` and `key`). The result will look like:

  ```
  https://player.goexp.io/#uuid=4f5c8b9f-90e3-41cc-b175-4f5fff4164e5&secret=30ba5f95fe4159fd1cc6dc4626ac69c38da87374b7f0b3257ee36ab29c79f3d3823607c0&experience=defa3531-3db2-4a3a-84e7-367328ad6ac4&key=56632b28-28de-471a-a92f-9f0806af184b
  ```

When specifying the experience and key parameters the device will ignore its schedule and play that specific app 24/7.

Using the experience value without the key value will force the device to ignore its configured experience and it will obey the schedule of the specified experience.
