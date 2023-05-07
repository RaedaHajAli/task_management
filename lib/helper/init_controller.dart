import 'package:get/get.dart';

import '../controller/task_controller.dart';


Future<void> init() async {
  Get.lazyPut(() => TaskController());

}
TaskController controller = Get.find();
