import 'package:nsg_data/nsg_data.dart';

import '../model/data_controller.dart';

class SplashBinding extends NsgBinding {
  @override
  void dependencies() {
    NsgGet.put<DataController>(() => DataController());
  }
}
