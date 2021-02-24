import 'package:flutter/material.dart';
import 'package:humanid_flutter_sdk/ui/login_screen.dart';

class HumanIdSDK extends StatelessWidget {
  static String routeName = '/humanid_sdk';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginScreen());
  }
}
