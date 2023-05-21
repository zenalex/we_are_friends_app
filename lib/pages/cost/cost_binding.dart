import 'package:get_it/get_it.dart';
import 'package:nsg_data/nsg_data.dart';

import 'cost_controller.dart';

// ignore: deprecated_member_use
class CostBinding extends NsgBinding {
  @override
  void dependencies() {
    GetIt.instance
        .registerLazySingleton<CostController>(() => CostController());
  }
}
