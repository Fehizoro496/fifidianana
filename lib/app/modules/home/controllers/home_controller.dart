import 'package:fifidianana/app/models/election_model.dart';
import 'package:fifidianana/app/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HiveService _hiveService = Get.find<HiveService>();
  TextEditingController posteCtrl = TextEditingController();
  TextEditingController sampanaCtrl = TextEditingController();
  TextEditingController dateCtrl = TextEditingController();

  // @override
  // void onInit() async {
  //   super.onInit();
  // }

  Future<void> deleteAllElections() async {
    await _hiveService.deleteAllElections();
  }

  Future<List<Election>> getAllElections() {
    return _hiveService.getAllElections();
  }

  void resetInputValues() {
    dateCtrl.clear();
    posteCtrl.clear();
    sampanaCtrl.clear();
  }

  void addElection() {
    _hiveService
        .addElection(Election(
      poste: posteCtrl.text,
      sampana: sampanaCtrl.text,
      date: DateTime.parse(dateCtrl.text), // Parse the date string
    ))
        .then((value) async {
      posteCtrl.clear();
      sampanaCtrl.clear();
      dateCtrl.clear(); // Clear the date field after adding
      Get.back();
      update();
    }).catchError((onError) {});
  }
}
