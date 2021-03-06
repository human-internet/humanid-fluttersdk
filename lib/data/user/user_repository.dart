import 'package:humanid_flutter_sdk/data/user/remote/model/response/login_item.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/response/otp_item.dart';

abstract class UserRepository {
  Future<LoginItem> login(
      String clientId,
      String clientSecret,
      String countryCode,
      String phone,
      String deviceTypeId,
      String deviceId,
      String verificationCode,
      String notifId);

  Future<OtpItem> requestOtp(
      String clientId, String clientSecret, String countryCode, String phone);
}
