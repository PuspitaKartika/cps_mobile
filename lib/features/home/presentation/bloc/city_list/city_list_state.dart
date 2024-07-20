part of 'city_list_bloc.dart';

sealed class CityListState extends Equatable {
  const CityListState();

  @override
  List<Object> get props => [];
}

final class CityListInitial extends CityListState {}

final class CityListLoading extends CityListState {}

final class CityListLoaded extends CityListState {
  final List<CityModel> item;

  const CityListLoaded({required this.item});
}

final class CityListError extends CityListState {
  final String message;

  const CityListError({required this.message});
}
