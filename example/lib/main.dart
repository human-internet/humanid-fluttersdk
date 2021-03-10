import 'package:flutter/material.dart';
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
  static String routeName = '/example_page';

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
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
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext buildContext) {
                  return HumanIDSDK(
                    appName: 'Example App',
                    iconUrl:
                        'https://isscroberto.files.wordpress.com/2017/12/movie_logo.png',
                    clientId: 'MOBILE_m65nshUmT9BDchwFEKdz',
                    clientSecret:
                        '12FZ3llRg5KFDuJFLftOxlQof1DKBtgL7mZrY4AE1zaM78o1Fvza2IZdKjdxT45Q',
                    onSuccessLogin: (String token) {
                      print("TOKEN : $token");
                    },
                  );
                });
          },
        ),
      ),
    ));
  }
}
