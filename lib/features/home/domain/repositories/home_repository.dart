import 'package:cps_mobile/features/home/data/models/city_model.dart';
import 'package:cps_mobile/features/home/data/models/user_model.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../cores/error/failure.dart';

abstract class HomeRepository {
  Future<Result<List<UserModel>, Failure>> getUserList();
  Future<Result<List<CityModel>, Failure>> getCityList();
  Future<Result<UserModel, Failure>> addUser(UserModel payload);
}
