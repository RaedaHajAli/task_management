import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:taskmanagement/controller/task_controller.dart';

import 'package:taskmanagement/widgets/custom_text_field.dart';

import '../colors/app_colors.dart';

class ViewTaskScreen extends StatefulWidget {
  const ViewTaskScreen({
    Key? key,
    required this.taskItem,
  }) : super(key: key);
  final Map taskItem;

  @override
  State<ViewTaskScreen> createState() => _ViewTaskScreenState();
}

class _ViewTaskScreenState extends State<ViewTaskScreen> {
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
      // resizeToAvoidBottomInset: false,
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
                  return Column(
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
                    ],
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),
            ]),
      ),
    );
  }
}
