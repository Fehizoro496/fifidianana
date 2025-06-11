import 'package:get/get.dart';

import '../controllers/scoreboard_controller.dart';

class ScoreboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScoreboardController>(
      () => ScoreboardController(),
    );
  }
}
