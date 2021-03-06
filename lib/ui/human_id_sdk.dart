import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/response/authorization_arguments.dart';
import 'package:humanid_flutter_sdk/ui/authorization_screen.dart';
import 'package:humanid_flutter_sdk/utils/colors.dart';
import 'package:humanid_flutter_sdk/utils/size_config.dart';

class HumanIDSDK extends StatelessWidget {
  static String routeName = '/humanid_sdk';
  final String appName, iconUrl, clientId, clientSecret;

  const HumanIDSDK(
      {Key key, this.iconUrl, this.appName, this.clientId, this.clientSecret})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: getProportionateScreenHeight(300),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        child: Column(
          children: [
            SizedBox(
              height: 13,
            ),
            SvgPicture.asset(
                'packages/humanid_flutter_sdk/assets/images/ic_line_bottom_sheet_white.svg'),
            SizedBox(
              height: 32,
            ),
            Image.network(
              iconUrl,
              width: 70,
              height: 40,
            ),
            SizedBox(
              height: 17,
            ),
            Text(
              appName,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: kWhiteColor),
            ),
            SizedBox(
              height: 22,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 34),
              decoration: BoxDecoration(
                  color: kWhiteColor, borderRadius: BorderRadius.circular(4)),
              child: FlatButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, AuthorizationScreen.routeName,
                      arguments: AuthorizationArguments(
                          appName: appName,
                          iconUrl: iconUrl,
                          clientId: clientId,
                          clientSecret: clientSecret));
                },
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: SvgPicture.asset(
                              'packages/humanid_flutter_sdk/assets/images/ic_logo_humanid_small.svg')),
                      Expanded(
                          flex: 8,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Continue With',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: kGrey1Color,
                                        fontSize: 12),
                                  ),
                                  SvgPicture.asset(
                                      'packages/humanid_flutter_sdk/assets/images/ic_logo_text_humanid.svg'),
                                ],
                              ),
                              Text(
                                '( recommended for full privacy)',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: kGrey3Color,
                                    fontSize: 8),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 33,
            ),
            Text(
              'I agree to $appName Terms of Service',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                  color: kLightOrangeColor),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
