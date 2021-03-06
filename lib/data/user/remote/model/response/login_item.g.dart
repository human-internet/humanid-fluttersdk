// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginItem _$LoginItemFromJson(Map<String, dynamic> json) {
  return LoginItem(
    json['success'] as bool,
    json['code'] as String,
    json['message'] as String,
    json['data'] == null
        ? null
        : ExchangeTokenItem.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoginItemToJson(LoginItem instance) => <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'message': instance.message,
      'data': instance.exchangeToken,
    };
