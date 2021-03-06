import 'package:dio/dio.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/response/login_item.dart';
import 'package:humanid_flutter_sdk/data/user/remote/model/response/otp_item.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api_client.g.dart';

@RestApi(baseUrl: "https://core.human-id.org/v0.0.3/mobile/")
abstract class UserApiClient {
  factory UserApiClient(Dio dio, {String baseUrl}) = _UserApiClient;

  @POST("users/login/request-otp")
  @FormUrlEncoded()
  Future<OtpItem> requestOtp(
      @Header('client-id') String clientId,
      @Header('client-secret') String clientSecret,
      @Field("countryCode") String countryCode, @Field("phone") String phone);

  @POST("users/login")
  Future<LoginItem> login(
      @Header('client-id') String clientId,
      @Header('client-secret') String clientSecret,
      @Field("countryCode") String countryCode, @Field("phone") String phone,
      @Field("deviceTypeId") String deviceTypeId, @Field("deviceId") String deviceId,
      @Field("verificationCode") String verificationCode, @Field("notifId") String notifId);
}
