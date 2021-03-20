<p align="center">  
  <img src="https://raw.githubusercontent.com/bluenumberfoundation/humanid-fluttersdk/master/human-id-logo.png" width="200" height="200">
</p>  
  
<h1 align="center">HumanID Flutter SDK</h1>  
  
<p align="center">  
<a href="https://github.com/bluenumberfoundation/humanid-documentation/edit/master/README.md">General Documentation</a> •  
<a href="https://github.com/bluenumberfoundation/humanid-documentation/blob/master/contributing.md">Contributing</a> •   
<a href="https://github.com/bluenumberfoundation/humanid-documentation/blob/master/gallery.md">Gallery</a> •   
<a href="https://github.com/bluenumberfoundation/humanid-documentation/blob/master/faq.md">FAQ</a>  
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
  humanid_flutter_sdk: ^0.0.4
```  
  
## Credentials Access  
  
Get the appId and appSecret by dropping us an email [developers@human-id.org](mailto:developers@human-id.org).  

## How to use  
  
#### Configure HumanId SDK inside a press function

```dart
import 'package:humanid_flutter_sdk/ui/human_id_sdk.dart';
import 'package:humanid_flutter_sdk/utils/authorization_arguments.dart';
import 'package:humanid_flutter_sdk/utils/routes.dart';
  
configureHumanIdSDK(
                context: context,
                arguments: AuthorizationArguments(
                  appName: 'YOUR_APP_NAME',
                  iconUrl: 'YOUR_APP_ICON',
                  clientId: 'YOUR_CLIENT_ID',
                  clientSecret: 'YOUR_CLIENT_SECRET',
                ),
                onSuccessLogin: (accessToken) {
                  setState(() {
                    token = accessToken;
                  });
                }), 
```  
 

## You're set!
Now you can integrate your Flutter app to humanID. See the full [sample](https://github.com/bluenumberfoundation/humanid-fluttersdk/tree/master/example) here to learn more.

## License
Copyright 2019-2020 Bluenumber Foundation Licensed under the GNU General Public License v3.0
