import 'package:dio/dio.dart';
import 'package:humanid_flutter_sdk/data/login/model/login_response.dart';
import 'package:retrofit/retrofit.dart';

part 'login_api_client.g.dart';

@RestApi()
abstract class LoginApiClient {
  factory LoginApiClient(Dio dio, {String baseUrl}) = _LoginApiClient;

  @POST('mobile/users/web-login')
  Future<LoginResponse> postWebLogin(
    @Query('lang') String language,
    @Query('priority_country') String priorityCountry,
    @Header('client-id') String clientId,
    @Header('client-secret') String clientSecret,
  );
}
