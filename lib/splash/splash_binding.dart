import 'package:get_it/get_it.dart';
import 'package:nsg_data/nsg_data.dart';

import '../model/data_controller.dart';

class SplashBinding extends NsgBinding {
  @override
  void dependencies() {
    GetIt.instance
        .registerLazySingleton<DataController>(() => DataController());
  }
}
