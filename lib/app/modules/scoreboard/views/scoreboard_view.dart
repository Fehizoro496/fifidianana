import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/scoreboard_controller.dart';

class ScoreboardView extends GetView<ScoreboardController> {
  const ScoreboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScoreboardView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          '${controller.election.poste}',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
