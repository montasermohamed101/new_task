import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../core/network/api_consumer.dart';
import 'home_service_loactor.dart';

final serviceLocator = GetIt.instance;

class DI {
  static Future<void> init() async {
    serviceLocator.registerLazySingleton(() => Dio());
    serviceLocator.registerLazySingleton<ApiConsumer>(() => ApiConsumer());
    HomeServiceLocator.execute(sl: serviceLocator);
  }
}
