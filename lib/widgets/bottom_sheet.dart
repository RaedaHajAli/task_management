import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colors/app_colors.dart';
import '../controller/task_controller.dart';
import '../views/edit_task.dart';
import '../views/view_task_screen.dart';
import 'custom_button.dart';

Future<dynamic> buildBottomSheet(TaskController controller, int index) {
    return Get.bottomSheet(
                              Container(
                                  height: 500,
                                  decoration: BoxDecoration(
                                      color: AppColors.smallTextColor
                                          .withOpacity(0.4),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      )),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomButton(
                                          text: 'View',
                                          backgroundcolor:
                                              AppColors.mainColor,
                                          textColor: Colors.white,
                                          onTap: () {
                                            if (Get.isBottomSheetOpen ??
                                                false) {
                                              Get.back();
                                            }
                                            Get.to(
                                                () => ViewTaskScreen(
                                                      taskItem: controller
                                                          .allTasks[index],
                                                    ),
                                                transition: Transition.rightToLeftWithFade,
                                                duration:
                                                  const  Duration(seconds: 1));
                                          },
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        CustomButton(
                                          text: 'Edit',
                                          backgroundcolor:
                                              AppColors.mainColor,
                                          textColor: AppColors.secondaryColor,
                                          onTap: () {
                                            if (Get.isBottomSheetOpen ??
                                                false) {
                                              Get.back();
                                            }
                                            Get.to(
                                                () => EditTaskScreen(
                                                      taskItem: controller
                                                          .allTasks[index],
                                                    ),
                                                transition: Transition.downToUp,
                                                duration:
                                                const    Duration(milliseconds: 1500));
                                          },
                                        ),
                                      ],
                                    ),
                                  )),
                              barrierColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                            );
  }

