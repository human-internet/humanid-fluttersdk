<p align="center">  
  <img src="https://raw.githubusercontent.com/bluenumberfoundation/humanid-fluttersdk/master/human-id-logo.png" width="200" height="200">
</p>  

<h1 align="center">HumanID Flutter SDK</h1>  

<p align="center">  
<a href="https://github.com/human-internet/humanid-documentation/edit/master/README.md">General Documentation</a> •  
<a href="https://github.com/human-internet/humanid-documentation/blob/master/contributing.md">Contributing</a> •   
<a href="https://github.com/human-internet/humanid-documentation/blob/master/gallery.md">Gallery</a> •   
<a href="https://github.com/human-internet/humanid-documentation/blob/master/faq.md">FAQ</a>  
</p>  

<p align="center">  
Meet humanID - An anonymous online identity, enabling platforms to offer the speed and comfort of social logins, while guaranteeing absolute privacy and protecting our communities by permanently blocking bots, spams, and trolls.  
</p>  

## Requirements
- Dart
- Flutter SDK

Please update to the latest stable SDK!


## Installation
##### pubspec.yaml
```
dependencies:
  humanid_flutter_sdk: ^0.0.5
```  

## Credentials Access

Create an account and an app at our [developer console](https://developers.human-id.org).

## How to use

#### Init HumanId SDK
```dart
void main() {
  initHumanIdSdk();
  runApp(const MyApp());
}
```
#### Configure HumanId SDK
Put HumanId SDK on the page you want to implement, and dont forget to set client id and client secret from your account

```dart
import 'package:flutter/material.dart';
import 'package:humanid_flutter_sdk/di/injector.dart';
import 'package:humanid_flutter_sdk/presentation/humanid_flutter_sdk.dart';
import 'package:humanid_flutter_sdk/values/country_code.dart';
import 'package:humanid_flutter_sdk/values/supported_language.dart';

HumanIDSdk(
    language: SupportedLanguage.ENGLISH_US,
    priorityCountry: [
        CountryCode.UNITED_STATES,
        CountryCode.INDONESIA,
        CountryCode.JAPAN,
         ],
    clientId: 'PUT_YOUR_CLIENT_ID',
    clientSecret: 'PUT_YOUR_CLIENT_SECRET',
    wrapperWidget: Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: const Color(0xFF075070),
        ),
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
    child: const Text(
         'Continue with HumanID',
         style: TextStyle(
             color: Colors.white,
             fontSize: 14,
             fontWeight: FontWeight.w700),
         ),
         ),
    onLoginSuccessfully: (exchangedToken) {
        setState(() {
             token = exchangedToken;
        });
        },
    ),
```  

#### Set Language
There are several language lists from the SDK, and you can set language for the SDK
```dart
HumanIDSdk(
    language: SupportedLanguage.ENGLISH_US,
    )
```

#### Set Priority Country
There are several country lists from the SDK, and you can set your priority countries for the SDK
```dart
HumanIDSdk(
    priorityCountry: [
        CountryCode.UNITED_STATES,
        CountryCode.INDONESIA,
        CountryCode.JAPAN,
         ],
    )
```

#### Get exchanged token
You can get a exchanged token from this callback
```dart
 onLoginSuccessfully: (exchangedToken) {
        setState(() {
             token = exchangedToken;
        });
    },
```


## You're set!
Now you can integrate your Flutter app to humanID. See the full [sample](https://github.com/human-internet/humanid-fluttersdk/tree/master/example) here to learn more.

## License
Copyright 2019-2020 Bluenumber Foundation Licensed under the GNU General Public License v3.0
