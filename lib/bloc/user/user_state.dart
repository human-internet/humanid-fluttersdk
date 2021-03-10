import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/response/login_item.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/response/otp_item.dart';

abstract class UserState extends Equatable {
  final String message;
  final LoginItem loginItem;
  final OtpItem otpItem;

  const UserState({this.message, this.loginItem, this.otpItem});

  @override
  List<Object> get props => [];
}

class InitialUserState extends UserState {}

class Loading extends UserState {}

class Error extends UserState {
  final String errorMessage;

  const Error(this.errorMessage);

  List<Object> get props => [errorMessage];

  @override
  String toString() => 'Error (message : $errorMessage)';
}

class LoginHasData extends UserState {
  const LoginHasData({@required LoginItem loginItem})
      : super(loginItem: loginItem);
}

class RequestOtpHasData extends UserState {
  const RequestOtpHasData({@required OtpItem otpItem})
      : super(otpItem: otpItem);
}
