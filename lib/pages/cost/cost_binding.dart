import 'package:get/instance_manager.dart';

import 'cost_controller.dart';

// ignore: deprecated_member_use
class CostBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CostController());
  }
}
