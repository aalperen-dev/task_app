import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:task_app/app/data/services/storage/repository.dart';

import '../../data/models/task.dart';

class HomeController extends GetxController {
  TaskRepository taskRepository;
  final formKey = GlobalKey<FormState>();
  final editCtrl = TextEditingController();
  final chipIndex = 0.obs;
  HomeController({
    required this.taskRepository,
  });

  final tasks = <Task>[].obs;

  @override
  void onInit() {
    super.onInit();
    tasks.assignAll(taskRepository.readTask());
    ever(tasks, (_) => taskRepository.writeTasks(tasks));
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeChipIndex(
    int value,
  ) {
    chipIndex.value = value;
  }

  bool addTask(Task task) {
    if (tasks.contains(task)) {
      return false;
    }
    tasks.add(task);
    return true;
  }
}
