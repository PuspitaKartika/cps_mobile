import 'package:cps_mobile/cores/http/rest_client.dart';
import 'package:cps_mobile/cores/utils/constant/api.dart';
import 'package:cps_mobile/cores/utils/helper/rest_helper.dart';
import 'package:cps_mobile/features/home/data/models/user_model.dart';
import 'package:dio/dio.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUserList();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final RestClient client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<List<UserModel>> getUserList() async {
    try {
      final result = await client.get(path: user);
      return List<UserModel>.from(
          (result.data as Iterable).map((e) => UserModel.fromJson(e)));
    } on DioException catch (error) {
      throw RestHelper.catchFailure(error: error);
    } catch (e, stack) {
      throw RestHelper.throwLocalError(error: e, stack: stack);
    }
  }
}
