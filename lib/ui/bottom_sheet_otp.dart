import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:humanid_flutter_sdk/bloc/user/user_bloc.dart';
import 'package:humanid_flutter_sdk/bloc/user/user_event.dart';
import 'package:humanid_flutter_sdk/bloc/user/user_state.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/request/login_request.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/request/otp_request.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/response/authorization_arguments.dart';
import 'package:humanid_flutter_sdk/utils/colors.dart';
import 'package:humanid_flutter_sdk/utils/size_config.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:progress_dialog/progress_dialog.dart';

class BottomSheetOtp extends StatefulWidget {
  final String phoneNumber, dialCode;
  final AuthorizationArguments authorizationArguments;

  const BottomSheetOtp(
      {Key key, this.phoneNumber, this.dialCode, this.authorizationArguments})
      : super(key: key);

  @override
  _BottomSheetOtpState createState() => _BottomSheetOtpState();
}

class _BottomSheetOtpState extends State<BottomSheetOtp> {
  ProgressDialog progressDialog;
  bool isCanResendOtp = false;
  String verificationCode = '';
  String deviceTypeId = '';
  String deviceId = '';

  @override
  void initState() {
    super.initState();
    progressDialog = ProgressDialog(context);
    _getDeviceId();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(700),
      child: Container(
        height: getProportionateScreenHeight(700),
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
              'We just sent a text to ${widget.phoneNumber}. We will not save or forward this number after the verification',
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
                if (state is LoginHasData) {
                  progressDialog.hide().whenComplete(() {
                    Navigator.pop(context, state.loginItem.exchangeToken.token);
                  });
                }
              },
              child:
                  BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                if (state is Loading) {
                  return otpForm(widget.authorizationArguments.clientId,
                      widget.authorizationArguments.clientSecret);
                } else if (state is LoginHasData) {
                  return otpForm(widget.authorizationArguments.clientId,
                      widget.authorizationArguments.clientSecret);
                } else if (state is Error) {
                  progressDialog.hide();
                  print(state.errorMessage);
                  Fluttertoast.showToast(msg: state.errorMessage);
                  return Container(
                    child: otpForm(widget.authorizationArguments.clientId,
                        widget.authorizationArguments.clientSecret),
                  );
                }
                return Container(
                  child: otpForm(widget.authorizationArguments.clientId,
                      widget.authorizationArguments.clientSecret),
                );
              }),
            ),
            SizedBox(
              height: 24,
            ),
            if (isCanResendOtp)
              BlocListener<UserBloc, UserState>(
                listenWhen: (previousState, state) {
                  return state is RequestOtpHasData;
                },
                listener: (context, state) {
                  Fluttertoast.showToast(msg: state.otpItem.message);
                },
                child:
                    BlocBuilder<UserBloc, UserState>(builder: (context, state) {
                  if (state is Loading) {
                    return buttonResendOtp(
                        widget.authorizationArguments.clientId,
                        widget.authorizationArguments.clientSecret);
                  } else if (state is RequestOtpHasData) {
                    progressDialog.hide();
                    return buttonResendOtp(
                        widget.authorizationArguments.clientId,
                        widget.authorizationArguments.clientSecret);
                  } else if (state is Error) {
                    progressDialog.hide();
                    print('Error Message : ${state.errorMessage}');
                    Fluttertoast.showToast(msg: state.errorMessage);
                    return Container(
                      child: buttonResendOtp(
                          widget.authorizationArguments.clientId,
                          widget.authorizationArguments.clientSecret),
                    );
                  } else {
                    return Container(
                      child: buttonResendOtp(
                          widget.authorizationArguments.clientId,
                          widget.authorizationArguments.clientSecret),
                    );
                  }
                }),
              )
            else
              buildTimerResendOtp()
          ],
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

  Widget buttonResendOtp(String clientId, String clientSecret) {
    return FlatButton(
      onPressed: () async {
        if (progressDialog.isShowing()) {
          progressDialog.hide();
        }
        await progressDialog.show();
        context.bloc<UserBloc>().add(RequestOtp(
            otpRequest: OtpRequest(
                clientId: clientId,
                clientSecret: clientSecret,
                countryCode: widget.dialCode,
                phone: widget.phoneNumber)));
      },
      child: Text('Resend code',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 10,
              color: kDarkBlueColor)),
    );
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
                  clientId: clientId,
                  clientSecret: clientSecret,
                  countryCode: widget.dialCode,
                  phone: widget.phoneNumber,
                  deviceTypeId: deviceTypeId,
                  deviceId: deviceId,
                  verificationCode: pin,
                  notifId: '1')));
        },
      ),
    );
  }

  Row buildTimerResendOtp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Resend code in ',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 10, color: kDarkBlueColor),
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
                fontSize: 10,
                color: kDarkBlueColor),
          ),
        ),
      ],
    );
  }
}
