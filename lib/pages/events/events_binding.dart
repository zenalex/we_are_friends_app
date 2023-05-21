import 'package:get_it/get_it.dart';
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
    GetIt.instance
        .registerLazySingleton<EventsController>(() => EventsController());
    GetIt.instance.registerLazySingleton<EventsFriendTableController>(
        () => EventsFriendTableController());
    GetIt.instance
        .registerLazySingleton<FriendsController>(() => FriendsController());
    GetIt.instance.registerLazySingleton<EventImageController>(
        () => EventImageController());
    GetIt.instance.registerLazySingleton<EventGroupController>(
        () => EventGroupController());
    GetIt.instance.registerLazySingleton<EventsBudgetTableController>(
        () => EventsBudgetTableController());
    GetIt.instance
        .registerLazySingleton<CostController>(() => CostController());
    GetIt.instance
        .registerLazySingleton<PaymentController>(() => PaymentController());
  }
}
