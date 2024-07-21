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
  List<UserModel> searchUserList = [];
  UserListBloc({required GetListUser getListUser})
      : _getListUser = getListUser,
        super(UserListInitial()) {
    on<LoadUserList>(_onLoadUserList);
    on<SortAndFilterUserList>(_onSortAndFilterUserList);
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
        searchUserList = originalUserList
            .where((element) =>
                (element.name
                    .toLowerCase()
                    .contains(event.query?.toLowerCase() ?? "")) ||
                (element.city
                    .toLowerCase()
                    .contains(event.query?.toLowerCase() ?? "")))
            .toList();
        emit(UserListSearch(searchUserList));
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
}
