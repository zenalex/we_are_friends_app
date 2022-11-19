import 'package:get/instance_manager.dart';
import 'package:we_are_friends_app/pages/friends/friends_controller.dart';

import 'events_controller.dart';

class EventsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EventsController());
    Get.put(EventsFriendTableController());
    Get.put(FriendsController());
  }
}
