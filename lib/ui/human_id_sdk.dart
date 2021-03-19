import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:humanid_flutter_sdk/bloc/user/user_bloc.dart';
import 'package:humanid_flutter_sdk/bloc/user/user_event.dart';
import 'package:humanid_flutter_sdk/bloc/user/user_state.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/request/otp_request.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/response/authorization_arguments.dart';
import 'package:humanid_flutter_sdk/ui/otp_screen.dart';
import 'package:humanid_flutter_sdk/utils/colors.dart';
import 'package:humanid_flutter_sdk/utils/custom_button.dart';
import 'package:humanid_flutter_sdk/utils/size_config.dart';
import 'package:humanid_flutter_sdk/utils/validation_helper.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class HumanIDSDK extends StatefulWidget {
  static String routeName = '/humanid_sdk';

  @override
  _HumanIDSDKState createState() => _HumanIDSDKState();
}

class _HumanIDSDKState extends State<HumanIDSDK> {
  GlobalKey<FormState> _key = new GlobalKey();
  PhoneNumber countryCode = PhoneNumber(isoCode: 'ID');
  final TextEditingController controller = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  String phoneNumber, dialCode;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final AuthorizationArguments authorizationArguments =
        ModalRoute.of(context).settings.arguments;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: kWhiteColor,
      statusBarColor: kPrimaryColor,
    ));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            autovalidateMode: AutovalidateMode.always,
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
                SizedBox(
                  height: getProportionateScreenHeight(37),
                ),
                CachedNetworkImage(
                  imageUrl: authorizationArguments.iconUrl,
                  height: 80,
                  width: 80,
                ),
                SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Text(
                    '${authorizationArguments.appName} will not receive any of your personal information.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: kGrey1Color),
                  ),
                ),
                SizedBox(
                  height: 51,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                          'packages/humanid_flutter_sdk/assets/images/ic_padlock.svg'),
                      Text(
                        'Your phone number is deleted after verification',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: kGrey1Color),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                phoneNumberTextField(authorizationArguments),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 40),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: kBlackColor,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Learn more about our mission to restore privacy.',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: kDarkBlue2Color),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget phoneNumberTextField(AuthorizationArguments authorizationArguments) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                dialCode = number.dialCode.replaceAll('+', '');
                phoneNumber = number.phoneNumber;
              },
              onInputValidated: (bool value) {},
              selectorConfig: SelectorConfig(
                backgroundColor: kPrimaryColor,
                selectorType: PhoneInputSelectorType.DIALOG,
              ),
              ignoreBlank: false,
              validator: validationPhone,
              autoValidateMode: AutovalidateMode.disabled,
              textStyle: TextStyle(color: kGrey1Color),
              inputDecoration: InputDecoration(
                  hintText: 'Phone Number',
                  hintStyle: TextStyle(fontSize: 14.0, color: kGrey4Color),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kGrey4Color),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: kGrey4Color),
                  ),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: kGrey4Color),
                  ),
                  focusColor: kWhiteColor,
                  hoverColor: kWhiteColor),
              selectorTextStyle: TextStyle(color: kGrey1Color),
              initialValue: countryCode,
              textFieldController: controller,
              formatInput: false,
              keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
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
              Navigator.pushNamed(context, OtpScreen.routeName,
                      arguments: AuthorizationArguments(
                          appName: authorizationArguments.appName,
                          iconUrl: authorizationArguments.iconUrl,
                          clientId: authorizationArguments.clientId,
                          clientSecret: authorizationArguments.clientSecret,
                          dialCode: dialCode,
                          phoneNumber: controller.text))
                  .then((token) => _closePage(token));
            },
            child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
              if (state is Loading) {
                return buttonLoading();
              } else if (state is RequestOtpHasData) {
                return buttonRequestOtp(authorizationArguments.clientId,
                    authorizationArguments.clientSecret);
              } else if (state is Error) {
                print('Error Message : ${state.errorMessage}');
                Fluttertoast.showToast(msg: state.errorMessage);
                return Container(
                  child: buttonRequestOtp(authorizationArguments.clientId,
                      authorizationArguments.clientSecret),
                );
              } else {
                return Container(
                  child: buttonRequestOtp(authorizationArguments.clientId,
                      authorizationArguments.clientSecret),
                );
              }
            }),
          ),
        ],
      ),
    );
  }

  void _closePage(String token) async {
    await Future.delayed(const Duration(milliseconds: 100))
        .then((value) => Navigator.pop(context, token));
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
        padding: const EdgeInsets.fromLTRB(32.0, 8, 32, 8),
        child: SizedBox(
            width: 2,
            height: 24,
            child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(kDarkBlueColor),
            )),
      ),
    ));
  }
}
