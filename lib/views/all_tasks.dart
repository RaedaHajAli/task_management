import 'package:flutter/material.dart';

import 'package:taskmanagement/controller/task_controller.dart';
import 'package:taskmanagement/views/add_task.dart';

import 'package:get/get.dart';

import '../colors/app_colors.dart';

import '../helper/init_controller.dart';

import '../widgets/dismissble_task.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({super.key});

  @override
  Widget build(BuildContext context) {
  
    controller.getDataFromDatabase(controller.database!);

    
  

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              //UI page
              Container(
                width: double.maxFinite,
                height: MediaQuery.of(context).size.height / 3.5,
                padding: const EdgeInsets.only(left: 20, top: 60),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/header.jpg'),
                      fit: BoxFit.cover),
                ),
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColors.secondaryColor,
                    )),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(children: [
                  Icon(
                    Icons.home,
                    color: AppColors.secondaryColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  //Add Task icon container
                  InkWell(
                    onTap: () {
                      Get.to(() => const AddTask(),
                          transition: Transition.upToDown,
                          duration: const Duration(milliseconds: 1500 ));
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12.5)),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Icon(
                    Icons.calendar_month,
                    color: AppColors.secondaryColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  // Number of Tasks Items
                  GetBuilder<TaskController>(
                    builder: (_) {
                      return Text(
                        '${controller.allTasks.length}',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      );
                    },
                  )
                ]),
              ),

              //************** */
              //List of Tasks
              GetBuilder<TaskController>(
                builder: (_) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      //Dismissble
                      return DismissibleTask(
                          index: index,
                          
                          );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: controller.allTasks.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  );
                },
              )
            ],
          ),
        ));
  }
}
