import 'package:cps_mobile/cores/error/failure.dart';
import 'package:cps_mobile/features/home/data/datasources/home_remote_datasource.dart';
import 'package:cps_mobile/features/home/data/models/city_model.dart';
import 'package:cps_mobile/features/home/data/models/user_model.dart';
import 'package:cps_mobile/features/home/domain/repositories/home_repository.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../cores/http/network_info.dart';

class HomeRepositoryImpl implements HomeRepository {
  final NetworkInfo networkInfo;
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(
      {required this.networkInfo, required this.remoteDataSource});

  @override
  Future<Result<List<UserModel>, Failure>> getUserList() async {
    if (await networkInfo.isConnected) {
      try {
        final data = await remoteDataSource.getUserList();
        return Success(data);
      } on Failure catch (failure) {
        return Error(failure);
      }
    } else {
      return const Error(NoConnection());
    }
  }

  @override
  Future<Result<List<CityModel>, Failure>> getCityList() async {
    if (await networkInfo.isConnected) {
      try {
        final data = await remoteDataSource.getCityList();
        return Success(data);
      } on Failure catch (failure) {
        return Error(failure);
      }
    } else {
      return const Error(NoConnection());
    }
  }
}
