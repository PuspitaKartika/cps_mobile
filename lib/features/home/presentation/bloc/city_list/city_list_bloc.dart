import 'package:bloc/bloc.dart';
import 'package:cps_mobile/cores/usecase/usecase.dart';
import 'package:cps_mobile/features/home/data/models/city_model.dart';
import 'package:cps_mobile/features/home/domain/usecase/home_usecase.dart';
import 'package:equatable/equatable.dart';

part 'city_list_event.dart';
part 'city_list_state.dart';

class CityListBloc extends Bloc<CityListEvent, CityListState> {
  final GetCityList _getCityList;
  CityListBloc({required GetCityList getCityList})
      : _getCityList = getCityList,
        super(CityListInitial()) {
    on<LoadCityList>(_onLoadCityList);
  }

  Future _onLoadCityList(
    LoadCityList event,
    Emitter<CityListState> emit,
  ) async {
    try {
      emit(CityListLoading());
      final result = await _getCityList(NoParams());
      result.when((data) async {
        emit(CityListLoaded(item: data));
      }, (error) async {
        emit(CityListError(message: error.message));
      });
    } catch (e) {
      emit(CityListError(message: e.toString()));
    }
  }
}
