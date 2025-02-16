part of 'user_list_bloc.dart';

sealed class UserListState extends Equatable {
  const UserListState();

  @override
  List<Object> get props => [];
}

final class UserListInitial extends UserListState {}

final class UserListLoading extends UserListState {}

final class UserListLoaded extends UserListState {
  final List<UserModel> user;
  const UserListLoaded(this.user);
}

final class UserFilterByCity extends UserListState {
  final List<UserModel> user;
  const UserFilterByCity(this.user);
}

final class UserListError extends UserListState {
  final String error;
  const UserListError(this.error);
}

final class UserListSearch extends UserListState {
  final List<UserModel> user;
  const UserListSearch(this.user);
}
