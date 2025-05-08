import 'package:get/get.dart';

import '../model/data_controller.dart';

// ignore: deprecated_member_use
class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DataController>(DataController(), permanent: true);
  }
}
