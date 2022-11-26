import 'package:get/instance_manager.dart';
import 'package:we_are_friends_app/pages/events/events_image_controller.dart';
import 'package:we_are_friends_app/pages/friends/friends_controller.dart';

import '../cost/cost_controller.dart';
import '../event_group/event_group_controller.dart';
import 'events_controller.dart';

class EventsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EventsController());
    Get.put(EventsFriendTableController());
    Get.put(FriendsController());
    Get.put(EventImageController());
    Get.put(EventGroupController());
    Get.put(EventsBudgetTableController());
    Get.put(CostController());
  }
}
