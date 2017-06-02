---
permalink: /developers/guides/real-time-communication
title: Real Time Communication
keywords: network
---

# Overview

Devices on the EXP platform can communicate with low latency via multi-cast broadcasting.

Broadcasts have a name, payload, and channel. Using the SDKs, devices can listen on channels (via websocket) for broadcasts by name, and take action upon receiving the payload. Devices can also respond to the broadcast with a response payload. The broadcaster in turn recieves an array of response payloads.

Both the broadcast and response payload must be JSON serializable types.


# Channels

Channels provide name-spacing for messaging and help reduce traffic by routing broadcasts to only devices that are actively listening on the given channel.

In addition to a channel name, channels have two flags `system` and `consumer`. The channel name can be any string, but the full channel is a combination of the organization, channel name, and these two flags. Channels with the same name, but different system or consumer flags are **NOT** the same channel.

Broadcasts sent directly by EXP system will always be on `system` channels. Users cannot emit a broadcast on a `system` channel.

Consumer app credentials are typically delivered with a mobile application to the consumer and messages from consumer apps should be treated with caution. For this reason, all broadcasts from consumer app devices can only be on `consumer` channels. Consumer apps can also only listen for messages on `consumer` channels. This allows non-consumer devices to communicate freely on non-consumer channels without having to worry about abuse of consumer app credentials.


# Sending a Broadcast

The easiest way to use the real time communication is with one of our SDKs, however, broadcasts can still be emitted with an HTTP request. Sending a broadcast is as simple as sending a HTTP POST to `/api/networks/current/broadcasts`.

```javascript
{
  "name": "myEventName",
  "payload": {
    "anything": 2,
    "anything2": ["hi!"]
  },
  "channel": {
    "name": "myChannelName",
    "consumer": true
  }
}
```

The broadcast is made up of 3 components, the channel, the message name, and the message payload. In this case the consumer flag is set.

The response to the HTTP request is a list of response payloads that were received while the HTTP request was open.

To specify the amount of wait for responses, add a `timeout` query parameter to the broadcast, specifying the number of milliseconds to wait for responses to the broadcast: i.e. `/api/networks/current/broadcasts?timeout=5000`. The HTTP request will be kept open for approximately the given timeout.


# Example: Simple Broadcast and Response using the Javascript SDK

```javascript

// Client 1
const channel = exp.getChannel('testChannel');
channel.listen('eventName', (payload, respond) => {
  if (payload && payload.text === 'hello?') respond('hi there!');
});


// Client 2
const channel = exp.getChannel('testChannel');
channel.broadcast('eventName', { text : 'hello?' }, 2000).then(response => {
  console.log(response.length); // 1
  console.log(response[0]); // 'hi there!'
});


```


# Example: Simple Broadcast and Response using the Python SDK

```python

# Client 1
channel = exp.get_channel('testChannel')
listener = channel.listen('eventName')
broadcast = listener.wait(60)
if broadcast and broadcast['text'] == 'hello?':
   broadcast.respond('hi there!')


# Client 2
channel = exp.get_channel('testChannel')
responses = channel.broadcast('eventName', { 'text': 'hello?' })
print responses  # [ 'hi there' ]


```
