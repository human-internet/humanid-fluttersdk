import 'package:flutter/material.dart';
import 'package:humanid_flutter_sdk/ui/bottom_sheet_otp.dart';
import 'package:humanid_flutter_sdk/utils/colors.dart';
import 'package:humanid_flutter_sdk/utils/custom_button.dart';
import 'package:humanid_flutter_sdk/utils/size_config.dart';
import 'package:humanid_flutter_sdk/utils/validation_helper.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class AuthorizationScreen extends StatefulWidget {
  static String routeName = '/authorization';

  @override
  _AuthorizationScreenState createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  GlobalKey<FormState> _key = new GlobalKey();
  PhoneNumber countryCode = PhoneNumber(isoCode: 'ID');
  final TextEditingController controller = TextEditingController();
  String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _key,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(32),
                ),
                Image.asset(
                    'packages/humanid_flutter_sdk/assets/images/ic_logo_movie_db.png'),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Welcome to Movie DB',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kWhiteColor, fontSize: 16),
                ),
                SizedBox(
                  height: 21,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Verify your phone number to connect anonymously with Movie DB',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            print(number.phoneNumber);
                          },
                          onInputValidated: (bool value) {
                            print(value);
                          },
                          selectorConfig: SelectorConfig(
                            backgroundColor: kPrimaryColor,
                            selectorType: PhoneInputSelectorType.DIALOG,
                          ),
                          ignoreBlank: false,
                          validator: validationPhone,
                          autoValidateMode: AutovalidateMode.disabled,
                          textStyle: TextStyle(color: kWhiteColor),
                          inputDecoration: InputDecoration(
                              hintText: 'Phone Number',
                              hintStyle:
                                  TextStyle(fontSize: 14.0, color: kWhiteColor),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kWhiteColor),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kWhiteColor),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: kWhiteColor),
                              ),
                              focusColor: kWhiteColor,
                              hoverColor: kWhiteColor),
                          selectorTextStyle: TextStyle(color: kWhiteColor),
                          initialValue: countryCode,
                          textFieldController: controller,
                          formatInput: false,
                          keyboardType: TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          onSaved: (PhoneNumber number) {
                            setState(() {
                              phoneNumber = number.phoneNumber;
                            });
                            print('On Saved: $number');
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomButton(
                          textColor: kDarkBlueColor,
                          btnColor: kLightOrangeColor,
                          text: 'ENTER',
                          press: () {
                            _key.currentState.save();
                            if (_key.currentState.validate()) {
                              showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (BuildContext buildContext) {
                                    return BottomSheetOtp(
                                        phoneNumber: phoneNumber);
                                  });
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  'OTP verification is managed by an independent 3rd party. Number & fingerprints are never visible to humanID or Movie DB. Learn More',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 10,
                      fontWeight: FontWeight.w300),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: SizedBox(
                    width: 150,
                    child: CustomButton(
                      textColor: kWhiteColor,
                      btnColor: kPrimaryColor,
                      text: 'Cancel',
                      press: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
