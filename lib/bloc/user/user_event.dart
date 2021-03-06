import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/request/login_request.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/request/otp_request.dart';

abstract class UserEvent extends Equatable {
  final OtpRequest otpRequest;
  final LoginRequest loginRequest;

  const UserEvent({this.loginRequest, this.otpRequest});

  @override
  List<Object> get props => [];
}

class Login extends UserEvent {
  Login({@required LoginRequest loginRequest})
      : super(loginRequest: loginRequest);
}

class RequestOtp extends UserEvent {
  RequestOtp({@required OtpRequest otpRequest}) : super(otpRequest: otpRequest);
}
