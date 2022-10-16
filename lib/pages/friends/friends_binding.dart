import 'package:get/instance_manager.dart';

import 'friends_controller.dart';

class FriendsBinding extends Bindings{
  

  @override
  void dependencies() {
   Get.put(FriendsController());
  }
}