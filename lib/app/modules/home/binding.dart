import 'package:get/get.dart';
import 'package:task_app/app/data/models/providers/task/provider.dart';
import 'package:task_app/app/data/services/storage/repository.dart';
import 'package:task_app/app/modules/home/controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        taskRepository: TaskRepository(
          taskProvider: TaskProvider(),
        ),
      ),
    );
  }
}
