import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:humanid_flutter_sdk/bloc/user/user_bloc.dart';
import 'package:humanid_flutter_sdk/data/user/user_data_store.dart';
import 'package:humanid_flutter_sdk/ui/authorization_screen.dart';
import 'package:humanid_flutter_sdk/ui/human_id_sdk.dart';
import 'package:humanid_flutter_sdk/ui/otp_screen.dart';

final Map<String, WidgetBuilder> routes = {
  AuthorizationScreen.routeName: (context) => BlocProvider(
        create: (context) {
          return UserBloc(repository: UserDataStore());
        },
        child: AuthorizationScreen(),
      ),
  OtpScreen.routeName: (context) => BlocProvider(
        create: (context) {
          return UserBloc(repository: UserDataStore());
        },
        child: OtpScreen(),
      ),
  HumanIDSDK.routeName: (_) => HumanIDSDK()
};
