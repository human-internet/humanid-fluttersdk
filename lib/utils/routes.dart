import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:humanid_flutter_sdk/bloc/user/user_bloc.dart';
import 'package:humanid_flutter_sdk/data/user/user_data_store.dart';
import 'package:humanid_flutter_sdk/ui/human_id_sdk.dart';
import 'package:humanid_flutter_sdk/ui/otp_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HumanIDSDK.routeName: (context) => BlocProvider(
        create: (context) {
          return UserBloc(repository: UserDataStore());
        },
        child: HumanIDSDK(),
      ),
  OtpScreen.routeName: (context) => BlocProvider(
        create: (context) {
          return UserBloc(repository: UserDataStore());
        },
        child: OtpScreen(),
      ),
};
