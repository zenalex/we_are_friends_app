import 'package:get/instance_manager.dart';

import 'event_group_controller.dart';

// ignore: deprecated_member_use
class EventGroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EventGroupController());
  }
}
