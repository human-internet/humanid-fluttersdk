import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:humanid_flutter_sdk/base/network/header_interceptor.dart';
import 'package:humanid_flutter_sdk/di/modules/login_module.dart';
import 'package:humanid_flutter_sdk/values/constants.dart';
import 'package:logger/logger.dart';

GetIt locator = GetIt.instance;

void initHumanIdSdk() async {

  BaseOptions options = BaseOptions(
      connectTimeout: 60000, receiveTimeout: 60000, followRedirects: false);

  Dio dio = Dio(options);
  dio.options.baseUrl = baseUrl;

  Logger logger = Logger(printer: PrettyPrinter(colors: true));

  dio.interceptors.add(HeaderInterceptor(logger));

  locator.registerSingleton(dio);

  injectLoginModule();
}
