import 'package:bloc/bloc.dart';
import 'package:cps_mobile/features/home/data/models/user_model.dart';
import 'package:cps_mobile/features/home/domain/usecase/home_usecase.dart';
import 'package:equatable/equatable.dart';

part 'add_user_event.dart';
part 'add_user_state.dart';

class AddUserBloc extends Bloc<AddUserEvent, AddUserState> {
  final AddUser _addUser;
  AddUserBloc({required AddUser addUser})
      : _addUser = addUser,
        super(AddUserInitial()) {
    on<DoAddUser>(_onDoAddUser);
  }

  Future _onDoAddUser(
    DoAddUser event,
    Emitter<AddUserState> emit,
  ) async {
    try {
      emit(AddUserLoading());
      final result = await _addUser(event.payload);
      result.when((data) async {
        emit(const AddUserLoaded(message: "Berhasil menambahkan data"));
      }, (failure) async {
        emit(AddUserError(error: failure.message));
      });
    } catch (e) {
      emit(AddUserError(error: e.toString()));
    }
  }
}
