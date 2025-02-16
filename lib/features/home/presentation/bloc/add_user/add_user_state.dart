part of 'add_user_bloc.dart';

sealed class AddUserState extends Equatable {
  const AddUserState();

  @override
  List<Object> get props => [];
}

final class AddUserInitial extends AddUserState {}

final class AddUserLoading extends AddUserState {}

final class AddUserLoaded extends AddUserState {
  final String message;

  const AddUserLoaded({required this.message});
}

final class AddUserError extends AddUserState {
  final String error;

  const AddUserError({required this.error});
}
