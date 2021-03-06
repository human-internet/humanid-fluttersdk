import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  @JsonKey(name: 'countryCode')
  String countryCode;

  @JsonKey(name: 'phone')
  String phone;

  @JsonKey(name: 'deviceTypeId')
  String deviceTypeId;

  @JsonKey(name: 'deviceId')
  String deviceId;

  @JsonKey(name: 'verificationCode')
  String verificationCode;

  @JsonKey(name: 'notifId')
  String notifId;

  String clientId;
  String clientSecret;

  LoginRequest(
      {this.countryCode,
      this.phone,
      this.deviceTypeId,
      this.deviceId,
      this.verificationCode,
      this.notifId,
      this.clientId,
      this.clientSecret});

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
