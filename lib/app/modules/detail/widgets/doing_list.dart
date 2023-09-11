import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_app/app/core/utils/extentions.dart';
import 'package:task_app/app/modules/home/controller.dart';

class DoingList extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  DoingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeCtrl.doingTodos.isEmpty && homeCtrl.doingTodos.isEmpty
          ? Column(
              children: [
                Image.asset(
                  "assets/images/completed-task.png",
                  fit: BoxFit.cover,
                  width: 65.0.wp,
                ),
                Text(
                  'Add Task',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0.sp,
                  ),
                ),
              ],
            )
          : const Text('Doing todos'),
    );
  }
}
