// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _UserApiClient implements UserApiClient {
  _UserApiClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://core.human-id.org/v0.0.3/mobile/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<OtpItem> requestOtp(clientId, clientSecret, countryCode, phone) async {
    ArgumentError.checkNotNull(clientId, 'clientId');
    ArgumentError.checkNotNull(clientSecret, 'clientSecret');
    ArgumentError.checkNotNull(countryCode, 'countryCode');
    ArgumentError.checkNotNull(phone, 'phone');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'countryCode': countryCode, 'phone': phone};
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>(
        'users/login/request-otp',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{
              r'client-id': clientId,
              r'client-secret': clientSecret
            },
            extra: _extra,
            contentType: 'application/x-www-form-urlencoded',
            baseUrl: baseUrl),
        data: _data);
    final value = OtpItem.fromJson(_result.data);
    return value;
  }

  @override
  Future<LoginItem> login(clientId, clientSecret, countryCode, phone,
      deviceTypeId, deviceId, verificationCode, notifId) async {
    ArgumentError.checkNotNull(clientId, 'clientId');
    ArgumentError.checkNotNull(clientSecret, 'clientSecret');
    ArgumentError.checkNotNull(countryCode, 'countryCode');
    ArgumentError.checkNotNull(phone, 'phone');
    ArgumentError.checkNotNull(deviceTypeId, 'deviceTypeId');
    ArgumentError.checkNotNull(deviceId, 'deviceId');
    ArgumentError.checkNotNull(verificationCode, 'verificationCode');
    ArgumentError.checkNotNull(notifId, 'notifId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'countryCode': countryCode,
      'phone': phone,
      'deviceTypeId': deviceTypeId,
      'deviceId': deviceId,
      'verificationCode': verificationCode,
      'notifId': notifId
    };
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request<Map<String, dynamic>>('users/login',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{
              r'client-id': clientId,
              r'client-secret': clientSecret
            },
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = LoginItem.fromJson(_result.data);
    return value;
  }
}
