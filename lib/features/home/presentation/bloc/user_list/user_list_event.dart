part of 'user_list_bloc.dart';

// ignore: constant_identifier_names
enum SortOrder { AZ, ZA }

sealed class UserListEvent extends Equatable {
  const UserListEvent();

  @override
  List<Object> get props => [];
}

class LoadUserList extends UserListEvent {}

class FilterUserListByCity extends UserListEvent {
  final String city;

  const FilterUserListByCity(this.city);

  @override
  List<Object> get props => [city];
}

class SortAndFilterUserList extends UserListEvent {
  final SortOrder? sortOrder;

  const SortAndFilterUserList({this.sortOrder});
}
