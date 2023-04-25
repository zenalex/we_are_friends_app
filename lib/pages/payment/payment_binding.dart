import 'package:get/instance_manager.dart';
import 'package:nsg_data/nsg_data.dart';

import 'payment_controller.dart';
import 'payment_image_controller.dart';

// ignore: deprecated_member_use
class PaymentBinding extends NsgBinding {
  @override
  void dependencies() {
    Get.put(PaymentController());
    Get.put(PaymentImageController());
  }
}
