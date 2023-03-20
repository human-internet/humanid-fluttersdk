import 'package:flutter/material.dart';
import 'package:humanid_flutter_sdk/di/injector.dart';
import 'package:humanid_flutter_sdk/presentation/humanid_flutter_sdk.dart';
import 'package:humanid_flutter_sdk/values/country_code.dart';
import 'package:humanid_flutter_sdk/values/supported_language.dart';

void main() async {
  initHumanIdSdk();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Human ID Example',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF023B60),
          title: const Text('Flutter Example app'),
        ),
        body: const ExamplePage(),
      ),
    );
  }
}

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  String token = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getTokenFromLogin(token),
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
              color: const Color(0xFF023B60),
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
      ],
    );
  }

  Widget getTokenFromLogin(String token) {
    if (token.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text('Token : $token'),
      );
    } else {
      return Container();
    }
  }
}
