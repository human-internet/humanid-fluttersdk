import 'package:dio/dio.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/response/login_item.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/response/otp_item.dart';
import 'package:humanid_flutter_sdk/data/user/remote/user_api_client.dart';

import 'user_repository.dart';

class UserDataStore extends UserRepository {
  Dio _dio = Dio();
  UserApiClient _apiClient;

  UserDataStore() {
    _dio = Dio();
    _apiClient = UserApiClient(_dio);
  }

  @override
  Future<LoginItem> login(
      String clientId,
      String clientSecret,
      String countryCode,
      String phone,
      String deviceTypeId,
      String deviceId,
      String verificationCode,
      String notifId) {
    return _apiClient.login(clientId, clientSecret, countryCode, phone,
        deviceTypeId, deviceId, verificationCode, notifId);
  }

  @override
  Future<OtpItem> requestOtp(
      String clientId, String clientSecret, String countryCode, String phone) {
    return _apiClient.requestOtp(clientId, clientSecret, countryCode, phone);
  }
}
