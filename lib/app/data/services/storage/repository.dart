import 'package:task_app/app/data/models/providers/task/provider.dart';

import '../../models/task.dart';

class TaskRepository {
  TaskProvider taskProvider;
  TaskRepository({
    required this.taskProvider,
  });

  List<Task> readTask() {
    return taskProvider.readTask();
  }

  void writeTasks(List<Task> tasks) {
    return taskProvider.writeTask(tasks);
  }
}
