import 'package:flutter/material.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/response/authorization_arguments.dart';
import 'package:humanid_flutter_sdk/ui/human_id_sdk.dart';
import 'package:humanid_flutter_sdk/utils/colors.dart';
import 'package:humanid_flutter_sdk/utils/custom_button.dart';
import 'package:humanid_flutter_sdk/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Human ID Example',
        routes: routes,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              title: const Text('Example app'),
            ),
            body: ExamplePage()));
  }
}

class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  String token;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getTokenFromLogin(token),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomButton(
            textColor: kWhiteColor,
            btnColor: kPrimaryColor,
            text: 'Continue with HumanID',
            press: () {
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
                  });
            },
          ),
        ),
      ],
    ));
  }

  Widget getTokenFromLogin(String token) {
    if (token != null) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('Token : $token'),
      );
    } else {
      return Container();
    }
  }
}
