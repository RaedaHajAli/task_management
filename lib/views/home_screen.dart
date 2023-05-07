import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:taskmanagement/views/add_task.dart';
import 'package:taskmanagement/views/all_tasks.dart';
import 'package:taskmanagement/widgets/custom_button.dart';
import 'package:get/get.dart';

import '../colors/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/welcome.jpg'), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
                text: TextSpan(
                    text: 'Hello',
                    style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                    children: [
                  TextSpan(
                    text: '\nStart your beautiful day',
                    style: TextStyle(
                      color: AppColors.smallTextColor,
                      fontSize: 14,
                    ),
                  )
                ])),
            SizedBox(height: MediaQuery.of(context).size.height / 2.5),
            CustomButton(
              text: 'Add Task',
              backgroundcolor: AppColors.mainColor,
              textColor: Colors.white,
              onTap: () {
                Get.to(() =>const AddTask(),
                    transition: Transition.zoom,
                    duration:const Duration(seconds: 1));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              text: 'View All',
              backgroundcolor: Colors.white,
              textColor: AppColors.mainColor,
              onTap: () {
                Get.to(() =>const AllTasks(),
                    transition: Transition.fade,
                    duration:const Duration(seconds: 1));
              },
            )
          ],
        ),
      ),
    );
  }
}
