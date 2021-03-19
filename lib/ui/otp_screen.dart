import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:humanid_flutter_sdk/bloc/user/user_bloc.dart';
import 'package:humanid_flutter_sdk/bloc/user/user_event.dart';
import 'package:humanid_flutter_sdk/bloc/user/user_state.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/request/login_request.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/request/otp_request.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/response/authorization_arguments.dart';
import 'package:humanid_flutter_sdk/utils/colors.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:progress_dialog/progress_dialog.dart';

class OtpScreen extends StatefulWidget {
  static String routeName = '/otp_screen';

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  ProgressDialog progressDialog;
  bool isCanResendOtp = false;
  String verificationCode, deviceTypeId, deviceId;

  @override
  void initState() {
    super.initState();
    progressDialog = ProgressDialog(context);
    _getDeviceId();
  }

  @override
  Widget build(BuildContext context) {
    final AuthorizationArguments authorizationArguments =
        ModalRoute.of(context).settings.arguments;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: kWhiteColor,
      statusBarColor: kPrimaryColor,
    ));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  color: kDarkBlueColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                          'packages/humanid_flutter_sdk/assets/images/ic_logo_humanid_white.svg'),
                      SizedBox(
                        width: 17,
                      ),
                      Text(
                        'Anonymous Login with humanID',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: kWhiteColor,
                            fontSize: 17),
                      )
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 85, 50, 23),
                child: Text(
                  'Verify Your Phone Number',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: kGrey1Color),
                ),
              ),
              Text(
                'Please enter the 4-digit code you received as SMS to',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: kGrey1Color,
                    fontSize: 14),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                '+${authorizationArguments.dialCode} ${authorizationArguments.phoneNumber}',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: kDarkBlue2Color,
                    fontSize: 14),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'After successful verification, your number will be deleted permanently. Only a random identifier will be stored. ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: kGrey1Color,
                      fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 33),
                child: BlocListener<UserBloc, UserState>(
                  listenWhen: (previousState, state) {
                    return state is LoginHasData;
                  },
                  listener: (context, state) {
                    if (state is LoginHasData) {
                      progressDialog.hide().whenComplete(() {
                        Fluttertoast.showToast(
                            msg:
                                'You’re successfully logged in. Your data has been securely erased.');
                        Navigator.pop(
                            context, state.loginItem.exchangeToken.token);
                      });
                    }
                  },
                  child: BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                    if (state is Loading) {
                      return otpForm(authorizationArguments);
                    } else if (state is LoginHasData) {
                      return otpForm(authorizationArguments);
                    } else if (state is Error) {
                      progressDialog.hide();
                      print(state.errorMessage);
                      Fluttertoast.showToast(msg: state.errorMessage);
                      return Container(
                        child: otpForm(authorizationArguments),
                      );
                    }
                    return Container(
                      child: otpForm(authorizationArguments),
                    );
                  }),
                ),
              ),
              if (isCanResendOtp)
                BlocListener<UserBloc, UserState>(
                  listenWhen: (previousState, state) {
                    return state is RequestOtpHasData;
                  },
                  listener: (context, state) {
                    Fluttertoast.showToast(msg: state.otpItem.message);
                  },
                  child: BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                    if (state is Loading) {
                      return buttonResendOtp(authorizationArguments);
                    } else if (state is RequestOtpHasData) {
                      progressDialog.hide();
                      return buildTimerResendOtp();
                    } else if (state is Error) {
                      progressDialog.hide();
                      print('Error Message : ${state.errorMessage}');
                      Fluttertoast.showToast(msg: state.errorMessage);
                      return Container(
                        child: buttonResendOtp(authorizationArguments),
                      );
                    } else {
                      return Container(
                        child: buttonResendOtp(authorizationArguments),
                      );
                    }
                  }),
                )
              else
                buildTimerResendOtp()
            ],
          ),
        ),
      ),
    );
  }

  Widget otpForm(AuthorizationArguments authorizationArguments) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: OTPTextField(
        length: 4,
        width: MediaQuery.of(context).size.width,
        fieldWidth: 80,
        style: TextStyle(fontSize: 17),
        textFieldAlignment: MainAxisAlignment.spaceAround,
        fieldStyle: FieldStyle.underline,
        onCompleted: (pin) async {
          setState(() {
            verificationCode = pin;
          });

          progressDialog = ProgressDialog(context);
          if (progressDialog.isShowing()) {
            progressDialog.hide();
          }

          await progressDialog.show();
          context.bloc<UserBloc>().add(Login(
              loginRequest: LoginRequest(
                  clientId: authorizationArguments.clientId,
                  clientSecret: authorizationArguments.clientSecret,
                  countryCode: authorizationArguments.dialCode,
                  phone: authorizationArguments.phoneNumber,
                  deviceTypeId: deviceTypeId,
                  deviceId: deviceId,
                  verificationCode: pin,
                  notifId: '1')));
        },
      ),
    );
  }

  Widget buttonResendOtp(AuthorizationArguments authorizationArguments) {
    return FlatButton(
      onPressed: () async {
        if (progressDialog.isShowing()) {
          progressDialog.hide();
        }
        await progressDialog.show();
        context.bloc<UserBloc>().add(RequestOtp(
            otpRequest: OtpRequest(
                clientId: authorizationArguments.clientId,
                clientSecret: authorizationArguments.clientSecret,
                countryCode: authorizationArguments.dialCode,
                phone: authorizationArguments.phoneNumber)));
      },
      child: Text('Resend code',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: kDarkBlueColor)),
    );
  }

  Widget buildTimerResendOtp() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Resend code in ',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: kDarkBlueColor),
          ),
          TweenAnimationBuilder(
            onEnd: () async {
              setState(() {
                isCanResendOtp = true;
              });
            },
            tween: Tween(begin: 60.0, end: 0.0),
            duration: Duration(seconds: 60),
            builder: (_, value, child) => Text(
              "${value.toInt()}s",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: kDarkBlueColor),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _getDeviceId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      deviceTypeId = '2';
      var iosDeviceInfo = await deviceInfo.iosInfo;
      deviceId = iosDeviceInfo.identifierForVendor;
    } else {
      deviceTypeId = '1';
      var androidDeviceInfo = await deviceInfo.androidInfo;
      deviceId = androidDeviceInfo.androidId;
    }
  }
}
