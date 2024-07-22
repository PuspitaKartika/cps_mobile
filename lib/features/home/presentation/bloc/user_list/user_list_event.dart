part of 'user_list_bloc.dart';

// ignore: constant_identifier_names
enum SortOrder { AZ, ZA }

sealed class UserListEvent extends Equatable {
  const UserListEvent();

  @override
  List<Object> get props => [];
}

class LoadUserList extends UserListEvent {}

class SortAndFilterUserList extends UserListEvent {
  final SortOrder? sortOrder;

  const SortAndFilterUserList({this.sortOrder});
}

class SearchUserList extends UserListEvent {
  final String query;
  const SearchUserList({required this.query});

  @override
  List<Object> get props => [query];
}
