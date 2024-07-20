import 'package:cps_mobile/cores/error/failure.dart';
import 'package:cps_mobile/cores/usecase/usecase.dart';
import 'package:cps_mobile/features/home/data/models/user_model.dart';
import 'package:cps_mobile/features/home/domain/repositories/home_repository.dart';
import 'package:multiple_result/multiple_result.dart';

class GetListUser implements UseCase<List<UserModel>, NoParams> {
  final HomeRepository repository;
  GetListUser(this.repository);

  @override
  Future<Result<List<UserModel>, Failure>> call(NoParams params) async {
    return await repository.getUserList();
  }
}
