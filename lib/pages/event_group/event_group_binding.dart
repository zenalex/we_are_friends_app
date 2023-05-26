import 'package:nsg_data/nsg_data.dart';

import 'event_group_controller.dart';

// ignore: deprecated_member_use
class EventGroupBinding extends NsgBinding {
  @override
  void dependencies() {
    NsgGet.put<EventGroupController>(() => EventGroupController());
  }
}
