import 'package:flutter/material.dart';


import '../colors/app_colors.dart';


 

final leftEditIcon = Container(
      decoration: BoxDecoration(
        color: AppColors.smallTextColor.withOpacity(0.5),
      ),
      alignment: Alignment.centerLeft,
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
    );
      final rightDeleteIcon = Container(
      decoration: const BoxDecoration(
        color: Colors.redAccent,
      ),
      alignment: Alignment.centerRight,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );