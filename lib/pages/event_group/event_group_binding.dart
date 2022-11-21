import 'package:get/instance_manager.dart';

import 'event_group_controller.dart';

class EventGroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EventGroupController());
  }
}
