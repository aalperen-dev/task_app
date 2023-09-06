import 'dart:convert';

import 'package:get/get.dart';
import 'package:task_app/app/core/utils/keys.dart';
import 'package:task_app/app/data/models/task.dart';
import 'package:task_app/app/data/services/storage/services.dart';

class TaskProvider {
  final StorageService _storageService = Get.find<StorageService>();

  List<Task> readTask() {
    var tasks = <Task>[];
    jsonDecode(_storageService.read(taskKey).toString())
        .forEach((e) => tasks.add(Task.fromJson(e)));

    return tasks;
  }

  void writeTask(List<Task> tasks) {
    _storageService.write(taskKey, jsonEncode(tasks));
  }
}
