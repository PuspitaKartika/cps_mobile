import 'package:bloc/bloc.dart';
import 'package:cps_mobile/cores/usecase/usecase.dart';
import 'package:cps_mobile/features/home/data/models/user_model.dart';
import 'package:cps_mobile/features/home/domain/usecase/home_usecase.dart';
import 'package:equatable/equatable.dart';

part 'user_list_event.dart';
part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final GetListUser _getListUser;
  UserListBloc({required GetListUser getListUser})
      : _getListUser = getListUser,
        super(UserListInitial()) {
    on<LoadUserList>(_onLoadUserList);
    on<SortUserListByAZ>(_onSortUserListByAZ);
    on<SortUserListByZA>(_onSortUserListByZA);
  }

  Future _onLoadUserList(
    LoadUserList event,
    Emitter<UserListState> emit,
  ) async {
    try {
      emit(UserListLoading());
      final result = await _getListUser(NoParams());
      result.when((data) async {
        emit(UserListLoaded(data));
      }, (error) async {
        emit(UserListError(error.message));
      });
    } catch (e) {
      emit(UserListError(e.toString()));
    }
  }

  void _onSortUserListByAZ(
    SortUserListByAZ event,
    Emitter<UserListState> emit,
  ) {
    if (state is UserListLoaded) {
      final users = List<UserModel>.from((state as UserListLoaded).user);
      users
          .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
      emit(UserListSortAZ(users));
    }
  }

  void _onSortUserListByZA(
    SortUserListByZA event,
    Emitter<UserListState> emit,
  ) {
    if (state is UserListSortAZ) {
      final users = List<UserModel>.from((state as UserListSortAZ).user);
      users
          .sort((a, b) => b.name.toLowerCase().compareTo(a.name.toLowerCase()));
      emit(UserListSortZA(users));
    }
  }
}
