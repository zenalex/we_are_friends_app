import 'package:get/instance_manager.dart';
import 'package:nsg_data/nsg_data.dart';

import 'friends_controller.dart';

// ignore: deprecated_member_use
class FriendsBinding extends NsgBinding {
  @override
  void dependencies() {
    Get.put(FriendsController());
  }
}
