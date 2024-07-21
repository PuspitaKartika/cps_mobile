import 'package:bloc/bloc.dart';
import 'package:cps_mobile/cores/usecase/usecase.dart';
import 'package:cps_mobile/features/home/data/models/user_model.dart';
import 'package:cps_mobile/features/home/domain/usecase/home_usecase.dart';
import 'package:equatable/equatable.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final GetListUser _getListUser;
  List<UserModel> originalUserList = [];
  UserListBloc({required GetListUser getListUser})
      : _getListUser = getListUser,
        super(UserListInitial()) {
    on<LoadUserList>(_onLoadUserList);
    on<SortAndFilterUserList>(_onSortAndFilterUserList);
    on<FilterUserListByCity>(_onFilterByCity);
  }

  Future _onLoadUserList(
    LoadUserList event,
    Emitter<UserListState> emit,
  ) async {
    try {
      emit(UserListLoading());
      final result = await _getListUser(NoParams());
      result.when((data) async {
        originalUserList = data;
        emit(UserListLoaded(data));
      }, (error) async {
        emit(UserListError(error.message));
      });
    } catch (e) {
      emit(UserListError(e.toString()));
    }
  }

  void _onSortAndFilterUserList(
    SortAndFilterUserList event,
    Emitter<UserListState> emit,
  ) {
    List<UserModel> filteredList = originalUserList;

    if (event.sortOrder != null) {
      filteredList.sort((a, b) {
        int comparison = a.name.toLowerCase().compareTo(b.name.toLowerCase());
        return event.sortOrder == SortOrder.AZ ? comparison : -comparison;
      });
    }

    emit(UserListLoaded(filteredList));
  }

  void _onFilterByCity(
    FilterUserListByCity event,
    Emitter<UserListState> emit,
  ) {
    List<UserModel> filteredList = originalUserList;

    final filteredUsers = filteredList
        .where((user) => user.city.toLowerCase() == event.city.toLowerCase())
        .toList();
    emit(UserFilterByCity(filteredUsers));
  }
}
