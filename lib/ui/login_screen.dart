import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:humanid_flutter_sdk/ui/authorization_screen.dart';
import 'package:humanid_flutter_sdk/utils/colors.dart';
import 'package:humanid_flutter_sdk/utils/custom_button.dart';
import 'package:humanid_flutter_sdk/utils/size_config.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PhoneNumber number = PhoneNumber(isoCode: 'ID');
    final TextEditingController controller = TextEditingController();
    SizeConfig().init(context);
    return SafeArea(
      child: Container(
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                    'packages/humanid_flutter_sdk/assets/images/ic_patern_bg_login.svg')),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80.0, bottom: 70),
                  child: Center(
                    child: SvgPicture.asset(
                        'packages/humanid_flutter_sdk/assets/images/ic_logo_humanid.svg'),
                  ),
                ),
                Text(
                  'Login',
                  style: TextStyle(fontSize: 14, color: kGray1Color),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal : 30.0, vertical: 30),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            print(number.phoneNumber);
                          },
                          onInputValidated: (bool value) {
                            print(value);
                          },
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.DROPDOWN,
                          ),
                          hintText: 'Your Phone Number',
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: TextStyle(color: Colors.black),
                          initialValue: number,
                          textFieldController: controller,
                          formatInput: false,
                          keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                          onSaved: (PhoneNumber number) {
                            print('On Saved: $number');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal :30.0),
                  child: CustomButton(
                    btnColor: kPrimaryColor,
                    textColor: kWhiteColor,
                    text: 'LOGIN',
                    press: (){
                      Navigator.pushNamed(context, AuthorizationScreen.routeName);
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

