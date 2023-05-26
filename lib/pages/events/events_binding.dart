import 'package:nsg_data/nsg_data.dart';
import 'package:we_are_friends_app/pages/events/events_image_controller.dart';
import 'package:we_are_friends_app/pages/friends/friends_controller.dart';
import 'package:we_are_friends_app/pages/payment/payment_controller.dart';

import '../cost/cost_controller.dart';
import '../event_group/event_group_controller.dart';
import 'events_controller.dart';

// ignore: deprecated_member_use
class EventsBinding extends NsgBinding {
  @override
  void dependencies() {
    NsgGet.put<EventsController>(() => EventsController());
    NsgGet.put<EventsFriendTableController>(
        () => EventsFriendTableController());
    NsgGet.put<FriendsController>(() => FriendsController());
    NsgGet.put<EventImageController>(() => EventImageController());
    NsgGet.put<EventGroupController>(() => EventGroupController());
    NsgGet.put<EventsBudgetTableController>(
        () => EventsBudgetTableController());
    NsgGet.put<CostController>(() => CostController());
    NsgGet.put<PaymentController>(() => PaymentController());
  }
}
