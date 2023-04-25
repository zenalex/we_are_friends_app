import 'package:get/instance_manager.dart';

import '../../router/nsg_binding.dart';
import 'cost_controller.dart';

// ignore: deprecated_member_use
class CostBinding extends NsgBinding {
  @override
  void dependencies() {
    Get.put(CostController());
  }
}
