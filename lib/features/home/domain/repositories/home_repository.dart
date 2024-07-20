import 'package:cps_mobile/features/home/data/models/user_model.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../cores/error/failure.dart';

abstract class HomeRepository {
  Future<Result<List<UserModel>, Failure>> getUserList();
}
