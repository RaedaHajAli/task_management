import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanagement/widgets/bottom_sheet.dart';
import 'package:taskmanagement/widgets/task_widget.dart';

import '../helper/left_right_container.dart';
import '../helper/init_controller.dart';

class DismissibleTask extends StatelessWidget {
  const DismissibleTask({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        background: leftEditIcon,
        secondaryBackground: rightDeleteIcon,
        key: UniqueKey(),
        onDismissed: (direction) {
          //
          controller
              .deleteFromDatabase(id: controller.allTasks[index]['id'])
              .then((value) {
            Get.snackbar(
                'Delete Task', 'Your task has been deleted successfully');
          });
        },
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.startToEnd) {
            //Go to bottom sheet if direction is start to end
            buildBottomSheet(controller, index);
            return false;
          } else {
            //Delelte task if direction is end to start with delay
            return Future.delayed(const Duration(seconds: 1),
                () => direction == DismissDirection.endToStart);
          }
        },
        child: TaskWidget(taskText: controller.allTasks[index]['name']));
  }
}
