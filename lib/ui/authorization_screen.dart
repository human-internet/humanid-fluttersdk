import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:humanid_flutter_sdk/bloc/user/user_bloc.dart';
import 'package:humanid_flutter_sdk/bloc/user/user_event.dart';
import 'package:humanid_flutter_sdk/bloc/user/user_state.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/request/otp_request.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/response/authorization_arguments.dart';
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
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  String phoneNumber, dialCode;

  @override
  Widget build(BuildContext context) {
    final AuthorizationArguments authorizationArguments =
        ModalRoute.of(context).settings.arguments;
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
                Image.network(
                  authorizationArguments.iconUrl,
                  width: 70,
                  height: 40,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Welcome to ${authorizationArguments.appName}',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kWhiteColor, fontSize: 16),
                ),
                SizedBox(
                  height: 21,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    'Verify your phone number to connect anonymously with ${authorizationArguments.appName}',
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
                            dialCode = number.dialCode.replaceAll('+', '');
                            phoneNumber = number.phoneNumber;
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
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      BlocListener<UserBloc, UserState>(
                        listenWhen: (previousState, state) {
                          return state is RequestOtpHasData;
                        },
                        listener: (context, state) {
                          _showModalBottomSheetOtp(authorizationArguments);
                        },
                        child: BlocBuilder<UserBloc, UserState>(
                            builder: (context, state) {
                          if (state is Loading) {
                            return buttonLoading();
                          } else if (state is RequestOtpHasData) {
                            return buttonRequestOtp(
                                authorizationArguments.clientId,
                                authorizationArguments.clientSecret);
                          } else if (state is Error) {
                            print('Error Message : ${state.errorMessage}');
                            Fluttertoast.showToast(msg: state.errorMessage);
                            return Container(
                              child: buttonRequestOtp(
                                  authorizationArguments.clientId,
                                  authorizationArguments.clientSecret),
                            );
                          } else {
                            return Container(
                              child: buttonRequestOtp(
                                  authorizationArguments.clientId,
                                  authorizationArguments.clientSecret),
                            );
                          }
                        }),
                      ),
                    ],
                  ),
                ),
                Text(
                  'OTP verification is managed by an independent 3rd party. Number & fingerprints are never visible to humanID or ${authorizationArguments.appName}. Learn More',
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

  void _showModalBottomSheetOtp(AuthorizationArguments authorizationArguments) {
    Future<void> future = showModalBottomSheet<void>(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext buildContext) {
          return BlocProvider.value(
            value: BlocProvider.of<UserBloc>(context),
            child: BottomSheetOtp(
              phoneNumber: controller.text,
              dialCode: dialCode,
              authorizationArguments: AuthorizationArguments(
                  clientId: authorizationArguments.clientId,
                  clientSecret: authorizationArguments.clientSecret),
            ),
          );
        });
    future.then((void value) => _closeModal(value));
  }

  void _closeModal(void value) async {
    print('modal closed');
    await Future.delayed(const Duration(milliseconds: 100))
        .then((value) => Navigator.pop(context));
  }

  Widget buttonRequestOtp(String clientId, String clientSecret) {
    return Expanded(
      child: CustomButton(
        textColor: kDarkBlueColor,
        btnColor: kLightOrangeColor,
        text: 'ENTER',
        press: () {
          _key.currentState.save();
          if (_key.currentState.validate()) {
            print(controller.text);
            FocusScope.of(context).unfocus();
            context.bloc<UserBloc>().add(RequestOtp(
                otpRequest: OtpRequest(
                    clientId: clientId,
                    clientSecret: clientSecret,
                    countryCode: dialCode,
                    phone: controller.text)));
          }
        },
      ),
    );
  }

  Widget buttonLoading() {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          color: kLightOrangeColor, borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(28.0, 8, 28, 8),
        child: SizedBox(
            width: 2,
            height: 24,
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(kDarkBlueColor),
            )),
      ),
    ));
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
