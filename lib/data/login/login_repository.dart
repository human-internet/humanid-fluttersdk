import 'package:humanid_flutter_sdk/data/login/model/login_response.dart';

abstract class LoginRepository {
  Future<LoginData> postWebLogin(
    String language,
    String priorityCountry,
    String clientId,
    String clientSecret,
  );
}
