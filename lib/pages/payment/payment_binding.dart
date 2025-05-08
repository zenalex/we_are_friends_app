import 'package:get/instance_manager.dart';

import 'payment_controller.dart';
import 'payment_image_controller.dart';

// ignore: deprecated_member_use
class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PaymentController());
    Get.put(PaymentImageController());
  }
}
