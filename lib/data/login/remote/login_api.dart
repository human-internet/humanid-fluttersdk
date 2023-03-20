import 'package:humanid_flutter_sdk/data/login/model/login_response.dart';
import 'package:humanid_flutter_sdk/data/login/remote/login_api_client.dart';

class LoginApi implements LoginApiClient {
  final LoginApiClient _apiClient;

  LoginApi(this._apiClient);

  @override
  Future<LoginResponse> postWebLogin(
    String language,
    String priorityCountry,
    String clientId,
    String clientSecret,
  ) {
    return _apiClient.postWebLogin(
      language,
      priorityCountry,
      clientId,
      clientSecret,
    );
  }
}
