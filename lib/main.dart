import 'package:cps_mobile/cores/bloc/ser_morpheus_obverser.dart';
import 'package:cps_mobile/cores/utils/constant/colors.dart';
import 'package:cps_mobile/cores/utils/helper/providers.dart';
import 'package:cps_mobile/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'injector_container.dart' as di;

void main() {
  di.init();
  Bloc.observer = SerMorpheusObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
            useMaterial3: true,
          ),
          home: const HomeScreen()),
    );
  }
}
