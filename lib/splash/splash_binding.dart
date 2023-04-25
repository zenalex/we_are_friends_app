import 'package:get/get.dart';
import 'package:nsg_data/nsg_data.dart';

import '../model/data_controller.dart';

class SplashBinding extends NsgBinding {
  @override
  void dependencies() {
    Get.put<DataController>(DataController(), permanent: true);
  }
}
