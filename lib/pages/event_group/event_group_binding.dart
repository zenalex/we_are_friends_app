import 'package:get_it/get_it.dart';
import 'package:nsg_data/nsg_data.dart';

import 'event_group_controller.dart';

// ignore: deprecated_member_use
class EventGroupBinding extends NsgBinding {
  @override
  void dependencies() {
    GetIt.instance.registerLazySingleton<EventGroupController>(
        () => EventGroupController());
  }
}
