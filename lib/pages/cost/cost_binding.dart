import 'package:get/instance_manager.dart';

import 'cost_controller.dart';

class CostBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CostController());
  }
}
