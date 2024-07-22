import 'package:cps_mobile/features/home/presentation/pages/add_user.dart';
import 'package:cps_mobile/features/home/presentation/pages/home_screen.dart';
import 'package:get/route_manager.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;
  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeScreen(),
    ),
    GetPage(name: _Paths.ADD_USER, page: () => const AddUserScreen())
  ];
}
