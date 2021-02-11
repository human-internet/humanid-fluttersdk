import 'package:flutter/material.dart';
import 'package:humanid_flutter_sdk/humanid_flutter_sdk.dart';
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
            title: const Text('Example app'),
          ),
          body: ExamplePage()
        ));
  }
}

class ExamplePage extends StatelessWidget {
  static String routeName = '/human_id_sdk_page';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          child: Text('Login'),
          onPressed: () =>
              Navigator.pushNamed(context, HumanIdSDK.routeName),
        ),
      ),
    );
  }
}
