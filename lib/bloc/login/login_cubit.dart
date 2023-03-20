import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:humanid_flutter_sdk/base/error/exceptions/api_exception.dart';
import 'package:humanid_flutter_sdk/data/login/login_repository.dart';
import 'package:humanid_flutter_sdk/data/login/model/login_response.dart';

part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _repository;

  LoginCubit(this._repository) : super(const _LoginInitialState());

  void postWebLogin(
    String language,
    String priorityCountry,
    String clientId,
    String clientSecret,
  ) async {
    emit(const _LoginInitialState());
    try {
      LoginData? loginData = await _repository.postWebLogin(
        language,
        priorityCountry,
        clientId,
        clientSecret,
      );

      emit(_LoginSuccessState(loginData));
    } on ApiException catch (error) {
      emit(_LoginErrorState(error.message));
    } catch (error) {
      emit(_LoginErrorState(error.toString()));
    }
  }
}

@freezed
class LoginState with _$LoginState {
  const factory LoginState.loginInitialState() = _LoginInitialState;

  const factory LoginState.loginSuccessState(LoginData loginData) =
      _LoginSuccessState;

  const factory LoginState.loginErrorState(String message) = _LoginErrorState;
}
