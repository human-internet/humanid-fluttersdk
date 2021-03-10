import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/request/login_request.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/request/otp_request.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/response/login_item.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/response/otp_item.dart';
import 'package:humanid_flutter_sdk/data/user/user_data_store.dart';
import 'package:humanid_flutter_sdk/utils/error_handler.dart';

import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserDataStore repository;

  UserBloc({@required this.repository}) : super(InitialUserState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is Login) {
      yield* _mapLoginToState(event.loginRequest);
    } else if (event is RequestOtp) {
      yield* _mapRequestOtpToState(event.otpRequest);
    }
  }

  Stream<UserState> _mapLoginToState(LoginRequest loginRequest) async* {
    yield Loading();
    try {
      LoginItem loginItem = await repository.login(
          loginRequest.clientId,
          loginRequest.clientSecret,
          loginRequest.countryCode,
          loginRequest.phone,
          loginRequest.deviceTypeId,
          loginRequest.deviceId,
          loginRequest.verificationCode,
          loginRequest.notifId);
      yield LoginHasData(loginItem: loginItem);
    } on DioError catch (error) {
      var errorMessage = handleError(error);
      print(errorMessage);
      yield Error(errorMessage);
    } on Error catch (error) {
      print("Error ${error.loginItem.message}");
      yield Error("Unknown Error");
    }
  }

  Stream<UserState> _mapRequestOtpToState(OtpRequest otpRequest) async* {
    yield Loading();
    try {
      OtpItem otpItem = await repository.requestOtp(otpRequest.clientId,
          otpRequest.clientSecret, otpRequest.countryCode, otpRequest.phone);
      yield RequestOtpHasData(otpItem: otpItem);
    } on DioError catch (error) {
      var errorMessage = handleError(error);
      print(errorMessage);
      yield Error(errorMessage);
    } on Error catch (error) {
      print("Error ${error.loginItem.message}");
      yield Error("Unknown Error");
    }
  }
}
