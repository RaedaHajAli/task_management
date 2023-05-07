// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:taskmanagement/controller/task_controller.dart';

import 'package:taskmanagement/widgets/custom_button.dart';
import 'package:taskmanagement/widgets/custom_text_field.dart';

import '../colors/app_colors.dart';
import '../helper/init_controller.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({
    Key? key,
    required this.taskItem,
  }) : super(key: key);
  final Map taskItem;

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController textController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textController.text = widget.taskItem['name'];
    detailController.text = widget.taskItem['detail'];
  }

  @override
  Widget build(BuildContext context) {
// UI page
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
              //************** */
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
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        bildCustomTextField(
                          controller: detailController,
                          keyboardType: TextInputType.text,
                          hint: 'Task Detail',
                          maxLines: 3,
                          borderRadius: 15,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomButton(
                          text: 'Edit',
                          backgroundcolor: AppColors.mainColor,
                          textColor: Colors.white,
                          onTap: onTapEdit,
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

  void onTapEdit() {
    if (formKey.currentState!.validate()) {
      controller
          .updateData(
              name: textController.text,
              detail: detailController.text,
              id: widget.taskItem['id'])
          .then((value) {
        Get.snackbar('Edit Task', 'Your task has been edited successfully');
        autovalidateMode = AutovalidateMode.disabled;
      });
    } else {
      autovalidateMode = AutovalidateMode.always;
    }
  }
}
