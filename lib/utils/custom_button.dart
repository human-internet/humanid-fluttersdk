import 'package:flutter/material.dart';

import 'colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    this.text,
    this.press,
    this.btnColor,
    this.textColor,
  }) : super(key: key);
  final String text;
  final Function press;
  final Color btnColor, textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: FlatButton(
        disabledColor: kGrey2Color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: btnColor,
        onPressed: press,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: textColor),
        ),
      ),
    );
  }
}