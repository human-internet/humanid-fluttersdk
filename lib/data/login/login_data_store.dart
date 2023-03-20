import 'package:humanid_flutter_sdk/base/error/error_handler.dart';
import 'package:humanid_flutter_sdk/data/login/login_repository.dart';
import 'package:humanid_flutter_sdk/data/login/model/login_response.dart';
import 'package:humanid_flutter_sdk/data/login/remote/login_api.dart';

class LoginDataStore extends LoginRepository {
  final LoginApi _api;

  LoginDataStore(this._api);

  @override
  Future<LoginData> postWebLogin(
    String language,
    String priorityCountry,
    String clientId,
    String clientSecret,
  ) {
    return _api
        .postWebLogin(
          language,
          priorityCountry,
          clientId,
          clientSecret,
        )
        .then((response) => response.data)
        .catchError((error) {
      errorHandler(error);
    });
  }
}
