import 'package:get/get.dart';
import 'package:we_are_friends_app/pages/cost/cost_list.dart';
import 'package:we_are_friends_app/pages/event_group/event_group_page.dart';
import 'package:we_are_friends_app/pages/events/events_list.dart';
import 'package:we_are_friends_app/pages/friends/friends_binding.dart';
import 'package:we_are_friends_app/pages/payment/payment_page.dart';

import 'pages/cost/cost_binding.dart';
import 'pages/cost/cost_page.dart';
import 'pages/event_group/event_group_binding.dart';
import 'pages/event_group/event_group_list.dart';
import 'pages/events/events_binding.dart';
import 'pages/events/events_budget_row.dart';
import 'pages/events/events_page.dart';
import 'pages/events/events_page_row.dart';
import 'pages/friends/friends_list.dart';
import 'pages/friends/friends_page.dart';
import 'pages/payment/payment_binding.dart';
import 'pages/payment/payment_list.dart';
import 'splash/splash_binding.dart';
import 'splash/splash_page.dart';
import 'start_page.dart';

class AppPages {
  static const initial = Routes.splashPage;

  static final List<GetPage> routes = [
    GetPage(
      name: Routes.splashPage,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.mainPage,
      page: () => const StartPage(),
      //binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.friendsList,
      page: () => const FriendsListPage(),
      binding: FriendsBinding(),
    ),
    GetPage(
      name: Routes.friendsPage,
      page: () => FriendPage(),
      binding: FriendsBinding(),
    ),
    GetPage(
      name: Routes.eventsList,
      page: () => const EventsListPage(),
      binding: EventsBinding(),
    ),
    GetPage(
      name: Routes.eventsPage,
      page: () => EventsPage(),
      binding: EventsBinding(),
    ),
    GetPage(
      name: Routes.eventsPageRow,
      page: () => EventsPageRow(),
      binding: EventsBinding(),
    ),
    GetPage(
      name: Routes.eventGroupList,
      page: () => const EventGroupListPage(),
      binding: EventGroupBinding(),
    ),
    GetPage(
      name: Routes.eventGroupPage,
      page: () => EventGroupPage(),
      binding: EventGroupBinding(),
    ),
    GetPage(
      name: Routes.costList,
      page: () => const CostListPage(),
      binding: CostBinding(),
    ),
    GetPage(
      name: Routes.costPage,
      page: () => CostPage(),
      binding: CostBinding(),
    ),
    GetPage(
      name: Routes.eventsBudgetRow,
      page: () => EventsBudgetRowPage(),
      binding: EventsBinding(),
    ),
    GetPage(
      name: Routes.paymentList,
      page: () => const PaymentListPage(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: Routes.paymentPage,
      page: () => PaymentPage(),
      binding: PaymentBinding(),
    ),
  ];
}

abstract class Routes {
  static const splashPage = '/';
  static const mainPage = '/main';
  static const friendsList = '/friends_list';
  static const friendsPage = '/friends_page';
  static const eventsList = '/events_list';
  static const eventsPage = '/events_page';
  static const eventGroupList = '/event_group_list';
  static const eventGroupPage = '/event_group_page';
  static const eventsPageRow = '/events_page_row';
  static const eventsBudgetRow = '/events_budget_row';
  static const costList = '/cost_list';
  static const costPage = '/cost_page';
  static const paymentPage = '/payment_page';
  static const paymentList = '/payment_list';
}
