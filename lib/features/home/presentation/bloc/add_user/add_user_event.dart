part of 'add_user_bloc.dart';

sealed class AddUserEvent extends Equatable {
  const AddUserEvent();

  @override
  List<Object> get props => [];
}

class DoAddUser extends AddUserEvent {
  final UserModel payload;

  const DoAddUser({required this.payload});
}
