import 'package:get/get.dart';
import 'package:we_are_friends_app/router/nsg_binding.dart';

import '../model/data_controller.dart';

class SplashBinding extends NsgBinding {
  @override
  void dependencies() {
    Get.put<DataController>(DataController(), permanent: true);
  }
}
