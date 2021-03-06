import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:humanid_flutter_sdk/bloc/user/user_bloc.dart';
import 'package:humanid_flutter_sdk/bloc/user/user_event.dart';
import 'package:humanid_flutter_sdk/bloc/user/user_state.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/request/login_request.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/response/authorization_arguments.dart';
import 'package:humanid_flutter_sdk/utils/colors.dart';
import 'package:humanid_flutter_sdk/utils/size_config.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpScreen extends StatefulWidget {
  static String routeName = '/otp';

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool isCanResendOtp = false;
  String verificationCode = '';
  String deviceTypeId = '';
  String deviceId = '';

  String phoneNumber = '81316311938', dialCode = '62';

  @override
  void initState() {
    super.initState();
    _getDeviceId();
  }

  @override
  Widget build(BuildContext context) {
    final AuthorizationArguments authorizationArguments =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Container(
        height: getProportionateScreenHeight(700),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          child: Column(
            children: [
              SizedBox(
                height: 13,
              ),
              SvgPicture.asset(
                  'packages/humanid_flutter_sdk/assets/images/ic_line_bottom_sheet.svg'),
              SizedBox(
                height: 17,
              ),
              SvgPicture.asset(
                  'packages/humanid_flutter_sdk/assets/images/ic_logo_humanid_landscape.svg'),
              SizedBox(
                height: 17,
              ),
              Text(
                'humanID is the independent & open online ID - giving back privacy, and the internet, to humans. Learn About Our Mission',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Verification Number',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: kGrey1Color),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'We just sent a text to ${phoneNumber}. We will not save or forward this number after the verification',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: kGrey1Color),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Please enter the 4 digit code you received as SMS',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: kGrey1Color),
              ),
              SizedBox(
                height: 24,
              ),
              BlocListener<UserBloc, UserState>(
                listenWhen: (previousState, state) {
                  return state is LoginHasData;
                },
                listener: (context, state) {
                  Navigator.pop(context);
                },
                child:
                    BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                  if (state is Loading) {
                    return otpForm(authorizationArguments.clientId,
                        authorizationArguments.clientSecret);
                  } else if (state is LoginHasData) {
                    Fluttertoast.showToast(
                        msg: state.loginItem.exchangeToken.token);
                    return otpForm(authorizationArguments.clientId,
                        authorizationArguments.clientSecret);
                  } else if (state is Error) {
                    print(state.errorMessage);
                    Fluttertoast.showToast(msg: state.errorMessage);
                    return Container(
                      child: otpForm(authorizationArguments.clientId,
                          authorizationArguments.clientSecret),
                    );
                  }
                  return Container(
                    child: otpForm(authorizationArguments.clientId,
                        authorizationArguments.clientSecret),
                  );
                }),
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
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

  Widget otpForm(String clientId, String clientSecret) {
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
        onCompleted: (pin) {
          setState(() {
            verificationCode = pin;
          });
          context.bloc<UserBloc>().add(Login(
              loginRequest: LoginRequest(
                  clientId: clientId,
                  clientSecret: clientSecret,
                  countryCode: dialCode,
                  phone: phoneNumber,
                  deviceTypeId: deviceTypeId,
                  deviceId: deviceId,
                  verificationCode: pin,
                  notifId: '1')));
        },
      ),
    );
  }
}
