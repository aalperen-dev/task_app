import 'package:flutter/material.dart';
import 'package:task_app/app/data/services/storage/services.dart';
import 'package:task_app/app/modules/home/view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  // get storage için async yapıldı ve storage init edildi.
  await GetStorage.init();
  //
  await Get.putAsync(
    () => StorageService().init(),
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Task App with GetX',
      home: HomePage(),
    );
  }
}
