import 'package:flutter/material.dart';
import 'package:taskmanagement/controller/task_controller.dart';

import 'package:taskmanagement/widgets/custom_button.dart';
import 'package:taskmanagement/widgets/custom_text_field.dart';
import 'package:get/get.dart';

import '../colors/app_colors.dart';

import '../helper/init_controller.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController textController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //UI page
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/addtask1.jpg'), fit: BoxFit.cover),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColors.secondaryColor,
                      )),
                ],
              ),
              //********* */
              GetBuilder<TaskController>(
                builder: (_) {
                  return Form(
                    key: formKey,
                    autovalidateMode: autovalidateMode,
                    child: Column(
                      children: [
                        bildCustomTextField(
                            controller: textController,
                            keyboardType: TextInputType.text,
                            hint: 'Task Name'),
                        const SizedBox(
                          height: 15,
                        ),
                        bildCustomTextField(
                            controller: detailController,
                            keyboardType: TextInputType.text,
                            hint: 'Task Detail',
                            maxLines: 3,
                            borderRadius: 15),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          text: 'Add',
                          backgroundcolor: AppColors.mainColor,
                          textColor: Colors.white,
                          onTap: onTapAdd,
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 50,
              ),
            ]),
      ),
    );
  }

  void onTapAdd() {
    if (formKey.currentState!.validate()) {
      controller
          .insertToDatabase(
              name: textController.text,
              detail: detailController.text,
              time: DateTime.now().toString())
          .then((value) {
        textController.clear();
        detailController.clear();

        autovalidateMode = AutovalidateMode.disabled;

        Get.snackbar('Add Task', 'Your task is added successfully');
      });
    } else {
      autovalidateMode = AutovalidateMode.always;
    }
  }
}
