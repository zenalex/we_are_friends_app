import 'package:get/instance_manager.dart';

import 'events_controller.dart';


class EventsBinding extends Bindings{
  

  @override
  void dependencies() {
   Get.put(EventsController());
   Get.put(EventsFriendTableController());
  }
}