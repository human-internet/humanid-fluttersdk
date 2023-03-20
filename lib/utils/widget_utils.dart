import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:humanid_flutter_sdk/presentation/reusable/loading_dialog.dart';

void showToast(String message) {
  Fluttertoast.showToast(msg: message);
}

void showLoading(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => const LoadingDialog(),
  );
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}

Widget showDefaultDialog(
    {Widget? title, Widget? content, required List<Widget> actions}) {
  if (Platform.isAndroid) {
    return AlertDialog(
      title: title,
      content: content,
      actions: actions,
    );
  } else {
    return CupertinoAlertDialog(
      title: title,
      content: content,
      actions: actions,
    );
  }
}
