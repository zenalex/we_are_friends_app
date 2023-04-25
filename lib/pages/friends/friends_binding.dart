import 'package:get/instance_manager.dart';

import '../../router/nsg_binding.dart';
import 'friends_controller.dart';

// ignore: deprecated_member_use
class FriendsBinding extends NsgBinding {
  @override
  void dependencies() {
    Get.put(FriendsController());
  }
}
