import 'package:cps_mobile/cores/error/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class UseCase<Type, Params> {
  Future<Result<Type, Failure>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
