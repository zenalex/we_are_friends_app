import 'package:get/instance_manager.dart';

import 'friends_controller.dart';

// ignore: deprecated_member_use
class FriendsBinding extends Bindings{
  

  @override
  void dependencies() {
   Get.put(FriendsController());
  }
}