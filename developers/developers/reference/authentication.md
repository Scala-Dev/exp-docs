---
permalink: /developers/reference/authentication
title: Authentication
keywords: developer, authentication
last_updated: April 20, 2016
tags: [auth]
---



# Overview

**This is an advanced topic. Our SDKs handle authentication automatically.**

Most requests to EXP, and a connection to the EXP network, require a valid authentication token. To obtain a token, [supply credentials](#exchanging-credentials-for-a-token) in an HTTP POST to `/api/auth/login`, or [exchange an existing valid token](#refreshing-a-token) for a new one by sending an authenticated HTTP POST request to `/api/auth/token`. Authentication tokens are short lived, ~hours, and must be exchanged for a new token before they expire.

To make an authenticated request, supply the authentication token in the `Authorization` header of the HTTP request, i.e.

```
Authorization: Bearer [token]
```

In addition to authentication tokens, a long lived "restricted token" can also be used for read-only access certain resources, like content. The restricted token can be attached to an HTTP request as a cookie with name `_rt`, or as a query parameter, i.e.

```
/api/endpoint?_rt=[restricted token]`
```




# Exchanging Credentials for a Token

To obtain an authentication token or restricted token, send a POST request to ```/api/auth/login``` with a JSON payload containing login credentials. If successful, the response will be a [authentication response payload](#authentication-response-payload).

## User Credentials

User's must supply their `username` and `password`. If no `organization` is specified, the most recently used organization will be automatically chosen.

```json
{
  "username": "[username]",
  "password": "[password]",
  "organization": "[organization] (optional)"
}
```


## Device Credentials

Device's must supply a `type` field of `device`, and a JWT containing the UUID, signed by the `secret`. See [jwt.io](http://jwt.io).

```javascript
const payload = JSON.stringify({
  "type": "device",
  "token": JWT.sign({ uuid: '[uuid]' }, '[secret]')
});
```


## Consumer App Credentials

Consumer apps must supply a `type` field of `consumerApp` and a JWT minimally containing the consumer app UUID, signed by the consumer app `api key`. See [jwt.io](http://jwt.io).

```javascript
const payload = JSON.stringify({
  "type": "consumerApp",
  "token": jwt.sign({ uuid: '[uuid]' }, '[api key]')
});
```


# Refreshing a Token

To refresh a token, send an authenticated HTTP POST request to `/api/auth/token'. The response will be an [authentication payload](#authentication-payload-response) with a new token if your current token was valid.



# Authentication Response Payload

The authentication response payload is a JSON object containing the following properties:
- api.host: The API host.
- network.host: The EXP network host.
- identity: Information about the identity associated with the supplied credentials.
- token: The authentication token.
- expiration: The UNIX time in milliseconds when the token will expire.
- restrictedToken: The restricted token.

Here is an example response payload:

```json
{
  "api": {
    "host": "https://api.goexp.io"
  },
  "network": {
    "host": "https://network27.goexp.io"
  },
  "identity": {
    "type": "user",
    "organization": "scala",
    "username": "testuser@email.com",
    "role": "owner",
    "connectionId": "ac2fc636-c04c-4842-a0d1-fe381ffdc665"
  },
  "token": "Ijoib3duZXIiLCJjb25uZWN0",
  "expiration": 1461110658536,
  "restrictedToken": "jE0NjExMDE2NTgsImV4c"
}

```
