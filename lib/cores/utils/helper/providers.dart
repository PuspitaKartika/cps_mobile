import 'package:cps_mobile/features/home/presentation/bloc/add_user/add_user_bloc.dart';
import 'package:cps_mobile/features/home/presentation/bloc/city_list/city_list_bloc.dart';
import 'package:cps_mobile/features/home/presentation/bloc/user_list/user_list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injector_container.dart';

List<BlocProvider> providers = [
  BlocProvider<UserListBloc>(create: (_) => sl<UserListBloc>()),
  BlocProvider<CityListBloc>(create: (_) => sl<CityListBloc>()),
  BlocProvider<AddUserBloc>(create: (_) => sl<AddUserBloc>())
];
