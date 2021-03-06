// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) {
  return LoginRequest(
    countryCode: json['countryCode'] as String,
    phone: json['phone'] as String,
    deviceTypeId: json['deviceTypeId'] as String,
    deviceId: json['deviceId'] as String,
    verificationCode: json['verificationCode'] as String,
    notifId: json['notifId'] as String,
    clientId: json['clientId'] as String,
    clientSecret: json['clientSecret'] as String,
  );
}

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'countryCode': instance.countryCode,
      'phone': instance.phone,
      'deviceTypeId': instance.deviceTypeId,
      'deviceId': instance.deviceId,
      'verificationCode': instance.verificationCode,
      'notifId': instance.notifId,
      'clientId': instance.clientId,
      'clientSecret': instance.clientSecret,
    };
