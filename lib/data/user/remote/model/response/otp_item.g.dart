// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpItem _$OtpItemFromJson(Map<String, dynamic> json) {
  return OtpItem(
    json['success'] as bool,
    json['code'] as String,
    json['message'] as String,
  );
}

Map<String, dynamic> _$OtpItemToJson(OtpItem instance) => <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'message': instance.message,
    };
