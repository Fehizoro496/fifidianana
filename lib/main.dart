import 'package:fifidianana/app/services/hive_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final hiveService = await Get.putAsync(() => HiveService().init());

  runApp(
    GetMaterialApp(
      theme: ThemeData(useMaterial3: true, primaryColor: Colors.blue),
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
