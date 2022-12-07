import 'package:get/get.dart';

import '../model/data_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DataController>(DataController(), permanent: true);
  }
}
