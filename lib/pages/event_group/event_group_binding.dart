import 'package:get/instance_manager.dart';

import '../../router/nsg_binding.dart';
import 'event_group_controller.dart';

// ignore: deprecated_member_use
class EventGroupBinding extends NsgBinding {
  @override
  void dependencies() {
    Get.put(EventGroupController());
  }
}
