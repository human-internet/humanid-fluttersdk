import 'package:flutter/material.dart';
import 'package:humanid_flutter_sdk/humanid_flutter_sdk.dart';

final Map<String, WidgetBuilder> routes = {
  HumanIdSDK.routeName: (context) => HumanIdSDK(),
};
