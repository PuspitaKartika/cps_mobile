import 'package:cps_mobile/cores/http/rest_client_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';

import 'cores/http/network_info.dart';
import 'cores/http/rest_client.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<RestClient>(
      () => RestClientImpl(dioClient: sl(), logger: sl()));

  //! External 3rd Party
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => Logger());
}
