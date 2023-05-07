// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';


import 'package:taskmanagement/colors/app_colors.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    Key? key,
    required this.taskText,
  }) : super(key: key);
  final String taskText;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 14,
      decoration: BoxDecoration(
          color: AppColors.textHolder, borderRadius: BorderRadius.circular(0)),
      alignment: Alignment.center,
      child: Text(
        taskText,
        style:const TextStyle(
          color:Colors.blueGrey ,
          fontSize: 20,
        ),
      ),
    );
  }
}
