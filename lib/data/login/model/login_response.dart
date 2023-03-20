import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends Equatable {
  @JsonKey(name: 'code')
  final String? code;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'success')
  final bool? success;
  @JsonKey(name: 'data')
  final LoginData data;

  const LoginResponse({
    required this.code,
    required this.message,
    required this.success,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  @override
  List<Object?> get props => [code, message, success, data];
}

@JsonSerializable()
class LoginData extends Equatable {
  @JsonKey(name: 'webLoginUrl')
  final String? webLoginUrl;

  const LoginData({
    required this.webLoginUrl,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);

  @override
  List<Object?> get props => [webLoginUrl];
}
