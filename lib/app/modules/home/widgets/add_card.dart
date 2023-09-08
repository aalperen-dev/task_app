import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:task_app/app/core/utils/extentions.dart';
import 'package:task_app/app/core/values/colors.dart';
import 'package:task_app/app/data/models/task.dart';
import 'package:task_app/app/modules/home/controller.dart';
import 'package:task_app/app/widgets/icons.dart';

class AddCard extends StatelessWidget {
  final homeCntrl = Get.find<HomeController>();
  AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    var squareWidth = Get.width - 1.0.wp;
    return Container(
      width: squareWidth / 3.5,
      height: squareWidth / 3.5,
      margin: EdgeInsets.all(2.0.wp),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
            titlePadding: EdgeInsets.symmetric(
              vertical: 3.0.wp,
            ),
            radius: 5,
            title: 'Task Type',
            content: Form(
              key: homeCntrl.formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: TextFormField(
                      controller: homeCntrl.editCtrl,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Title',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your task title';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Wrap(
                      spacing: 2.0.wp,
                      children: icons
                          .map(
                            (e) => Obx(
                              () {
                                final index = icons.indexOf(e);
                                return ChoiceChip(
                                  selectedColor: Colors.grey,
                                  pressElevation: 0,
                                  backgroundColor: Colors.white,
                                  label: e,
                                  selected: homeCntrl.chipIndex.value == index,
                                  onSelected: (bool selected) {
                                    homeCntrl.chipIndex.value =
                                        selected ? index : 0;
                                  },
                                );
                              },
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(140, 30),
                      backgroundColor: blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (homeCntrl.formKey.currentState!.validate()) {
                        // print(icons[homeCntrl.chipIndex.value].icon!.codePoint);
                        int icon =
                            icons[homeCntrl.chipIndex.value].icon!.codePoint;
                        String color =
                            icons[homeCntrl.chipIndex.value].color!.toHex();

                        var task = Task(
                          title: homeCntrl.editCtrl.text,
                          icon: icon,
                          color: color,
                        );
                        Get.back();
                        homeCntrl.addTask(task)
                            ? EasyLoading.showSuccess('Create Success')
                            : EasyLoading.showError('Duplicated Task');
                      }
                    },
                    child: const Text(
                      "Confirm",
                    ),
                  ),
                ],
              ),
            ),
          );
          homeCntrl.editCtrl.clear();
          homeCntrl.changeChipIndex(0);
        },
        child: DottedBorder(
          color: Colors.grey,
          dashPattern: const [8, 4],
          child: Center(
            child: Icon(
              Icons.add_outlined,
              size: 10.0.wp,
            ),
          ),
        ),
      ),
    );
  }
}
