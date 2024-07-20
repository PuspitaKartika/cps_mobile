import 'package:cps_mobile/cores/error/failure.dart';
import 'package:cps_mobile/features/home/data/datasources/user_remote_datasource.dart';
import 'package:cps_mobile/features/home/data/models/user_model.dart';
import 'package:cps_mobile/features/home/domain/repositories/user_repository.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../cores/http/network_info.dart';

class UserRepositoryImpl implements UserRepository {
  final NetworkInfo networkInfo;
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(
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
}
