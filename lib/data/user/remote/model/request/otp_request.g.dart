// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpRequest _$OtpRequestFromJson(Map<String, dynamic> json) {
  return OtpRequest(
    countryCode: json['countryCode'] as String,
    phone: json['phone'] as String,
    clientId: json['clientId'] as String,
    clientSecret: json['clientSecret'] as String,
  );
}

Map<String, dynamic> _$OtpRequestToJson(OtpRequest instance) =>
    <String, dynamic>{
      'countryCode': instance.countryCode,
      'phone': instance.phone,
      'clientId': instance.clientId,
      'clientSecret': instance.clientSecret,
    };
