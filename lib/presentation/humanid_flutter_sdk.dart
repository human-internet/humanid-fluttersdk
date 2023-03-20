import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:humanid_flutter_sdk/bloc/login/login_cubit.dart';
import 'package:humanid_flutter_sdk/di/injector.dart';
import 'package:humanid_flutter_sdk/presentation/web_view_page.dart';
import 'package:humanid_flutter_sdk/utils/common_utils.dart';
import 'package:humanid_flutter_sdk/utils/widget_utils.dart';

class HumanIDSdk extends StatefulWidget {
  final Widget wrapperWidget;
  final Function onLoginSuccessfully;
  final List<String> priorityCountry;
  final String language;
  final String clientId;
  final String clientSecret;

  const HumanIDSdk({
    Key? key,
    required this.wrapperWidget,
    required this.onLoginSuccessfully,
    required this.priorityCountry,
    required this.language,
    required this.clientId,
    required this.clientSecret,
  }) : super(key: key);

  @override
  State<HumanIDSdk> createState() => _HumanIDSdkState();
}

class _HumanIDSdkState extends State<HumanIDSdk> {
  final LoginCubit loginCubit = locator.get();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => loginCubit,
        ),
      ],
      child: HumanIdPage(
        wrapperWidget: widget.wrapperWidget,
        onLoginSuccessfully: widget.onLoginSuccessfully,
        priorityCountry: widget.priorityCountry,
        language: widget.language,
        clientId: widget.clientId,
        clientSecret: widget.clientSecret,
      ),
    );
  }
}

class HumanIdPage extends StatefulWidget {
  final Widget wrapperWidget;
  final Function onLoginSuccessfully;
  final List<String> priorityCountry;
  final String language;
  final String clientId;
  final String clientSecret;

  const HumanIdPage({
    Key? key,
    required this.wrapperWidget,
    required this.onLoginSuccessfully,
    required this.priorityCountry,
    required this.language,
    required this.clientId,
    required this.clientSecret,
  }) : super(key: key);

  @override
  State<HumanIdPage> createState() => _HumanIdPageState();
}

class _HumanIdPageState extends State<HumanIdPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (BuildContext context, state) {
        state.when(
          loginInitialState: () {
            showLoading(context);
          },
          loginSuccessState: (loginData) {
            hideLoading(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WebViewPage(
                    webLoginUrl: loginData.webLoginUrl ?? emptyString()),
              ),
            ).then((value) {
              widget.onLoginSuccessfully(value);
            });
          },
          loginErrorState: (errorMessage) {
            hideLoading(context);
            showToast(errorMessage);
          },
        );
      },
      child: GestureDetector(
          onTap: () {
            submitWebLogin(
              language: widget.language,
              priorityCountry: widget.priorityCountry,
              clientId: widget.clientId,
              clientSecret: widget.clientSecret,
            );
          },
          child: widget.wrapperWidget),
    );
  }

  void submitWebLogin({
    required String language,
    required List<String> priorityCountry,
    required String clientId,
    required String clientSecret,
  }) {
    var priorityCountryString = priorityCountry.join(',');
    context
        .read<LoginCubit>()
        .postWebLogin(language, priorityCountryString, clientId, clientSecret);
  }
}
