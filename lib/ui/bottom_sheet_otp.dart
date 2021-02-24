import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:humanid_flutter_sdk/utils/colors.dart';
import 'package:humanid_flutter_sdk/utils/size_config.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class BottomSheetOtp extends StatefulWidget {
  final String phoneNumber;

  const BottomSheetOtp({Key key, this.phoneNumber}) : super(key: key);

  @override
  _BottomSheetOtpState createState() => _BottomSheetOtpState();
}

class _BottomSheetOtpState extends State<BottomSheetOtp> {
  bool isCanResendOtp = false;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  color: kGray1Color),
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
                  color: kGray1Color),
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
                  color: kGray1Color),
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: OTPTextField(
                length: 4,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 80,
                style: TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
                onCompleted: (pin) {
                  print("Completed: " + pin);
                },
              ),
            ),
            SizedBox(
              height: 24,
            ),
            if (isCanResendOtp)
              FlatButton(
                onPressed: () {
                  print('RESEND');
                },
                child: Text('Resend code',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        color: kDarkBlueColor)),
              )
            else
              buildTimerResendOtp()
          ],
        ),
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
          onEnd: () {
            setState(() {
              isCanResendOtp = true;
            });
          },
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
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
