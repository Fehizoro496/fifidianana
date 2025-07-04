// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
// import '../modules/home/views/home_view.dart';
import '../modules/home/views/home_view copy.dart';
import '../modules/scoreboard/bindings/scoreboard_binding.dart';
import '../modules/scoreboard/views/scoreboard_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SCOREBOARD,
      page: () => const ScoreboardView(),
      binding: ScoreboardBinding(),
      // children: [
      //   GetPage(
      //     name: _Paths.SCOREBOARD,
      //     page: () => ScoreboardView(),
      //     binding: ScoreboardBinding(),
      //   ),
      // ],
    ),
  ];
}
