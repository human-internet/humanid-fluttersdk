import 'package:flutter/material.dart';
import 'package:humanid_flutter_sdk/humanid_flutter_sdk.dart';
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
  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: "Main Navigator");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
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
  static String routeName = '/human_id_sdk_page';

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          textColor: kWhiteColor,
          btnColor: kPrimaryColor,
          text: 'Continue with HumanID',
          press: () {
            Navigator.pushNamed(context, HumanIdSDK.routeName);
          },
        ),
      ),
    ));
  }
}
