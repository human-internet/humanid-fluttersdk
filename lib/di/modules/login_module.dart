import 'package:humanid_flutter_sdk/bloc/login/login_cubit.dart';
import 'package:humanid_flutter_sdk/data/login/login_data_store.dart';
import 'package:humanid_flutter_sdk/data/login/login_repository.dart';
import 'package:humanid_flutter_sdk/data/login/remote/login_api.dart';
import 'package:humanid_flutter_sdk/data/login/remote/login_api_client.dart';

import '../injector.dart';

void injectLoginModule() {
  locator.registerSingleton(LoginApiClient(locator.get()));
  locator.registerSingleton(LoginApi(locator.get()));
  locator.registerSingleton<LoginRepository>(LoginDataStore(locator.get()));
  locator.registerSingleton(LoginCubit(locator.get()));
}
