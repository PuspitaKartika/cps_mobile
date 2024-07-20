import 'package:cps_mobile/features/home/data/datasources/home_remote_datasource.dart';
import 'package:cps_mobile/features/home/data/repositories/home_repository_impl.dart';
import 'package:cps_mobile/features/home/domain/repositories/home_repository.dart';
import 'package:cps_mobile/features/home/domain/usecase/user_usecase.dart';
import 'package:cps_mobile/features/home/presentation/bloc/user_list/user_list_bloc.dart';

import '../../../injector_container.dart';

void initHome() {
  //BLOC
  sl.registerFactory(() => UserListBloc(getListUser: sl()));

  //Usecase
  sl.registerLazySingleton(() => GetListUser(sl()));

  // ! Global Repository
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));

  //! Global data source
  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: sl()));
}
