import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:taskmanagement/helper/init_controller.dart' as di;

import '../helper/init_controller.dart';

import 'package:taskmanagement/views/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  controller.createDatabase();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
 
      home: HomeScreen(),
    );
  }
}
