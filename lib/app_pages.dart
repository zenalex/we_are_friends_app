import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nsg_data/nsg_data.dart';
import 'package:we_are_friends_app/model/data_controller.dart';
import 'package:we_are_friends_app/pages/cost/cost_list.dart';
import 'package:we_are_friends_app/pages/event_group/event_group_page.dart';
import 'package:we_are_friends_app/pages/events/events_cost_list.dart';
import 'package:we_are_friends_app/pages/events/events_cost_page.dart';
import 'package:we_are_friends_app/pages/events/events_list.dart';
import 'package:we_are_friends_app/pages/friends/friends_binding.dart';
import 'package:we_are_friends_app/pages/payment/payment_page.dart';

import 'pages/cost/cost_binding.dart';
import 'pages/cost/cost_page.dart';
import 'pages/event_group/event_group_binding.dart';
import 'pages/event_group/event_group_list.dart';
import 'pages/events/events_binding.dart';
import 'pages/events/events_budget_payment.dart';
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
  static bool isInitialized = false;
  static final router = NsgRouter(
    initialLocation: Routes.splashPage,
    routes: [
      NsgRoute(
          path: Routes.splashPage,
          page: (context, state) => const SplashPage(),
          binding: SplashBinding()),
      NsgRoute(
        path: Routes.mainPage,
        page: (context, state) => const StartPage(),
        //binding: SplashBinding(),
      ),
      NsgRoute(
        path: Routes.friendsList,
        page: (context, state) => FriendsListPage(),
        binding: FriendsBinding(),
      ),
      NsgRoute(
        path: Routes.friendsPage,
        page: (context, state) => FriendPage(),
        binding: FriendsBinding(),
      ),
      NsgRoute(
        path: Routes.eventsList,
        page: (context, state) => EventsListPage(),
        binding: EventsBinding(),
      ),
      NsgRoute(
        path: Routes.eventsPage,
        page: (context, state) => EventsPage(),
        binding: EventsBinding(),
      ),
      NsgRoute(
        path: Routes.eventsPageRow,
        page: (context, state) => EventsPageRow(),
        binding: EventsBinding(),
      ),
      NsgRoute(
        path: Routes.eventGroupList,
        page: (context, state) => EventGroupListPage(),
        binding: EventGroupBinding(),
      ),
      NsgRoute(
        path: Routes.eventGroupPage,
        page: (context, state) => EventGroupPage(),
        binding: EventGroupBinding(),
      ),
      NsgRoute(
        path: Routes.costList,
        page: (context, state) => CostListPage(),
        binding: CostBinding(),
      ),
      NsgRoute(
        path: Routes.costPage,
        page: (context, state) => CostPage(),
        binding: CostBinding(),
      ),
      NsgRoute(
        path: Routes.eventsBudgetRow,
        page: (context, state) => EventsBudgetRowPage(),
        binding: EventsBinding(),
      ),
      NsgRoute(
        path: Routes.paymentList,
        page: (context, state) => PaymentListPage(),
        binding: PaymentBinding(),
      ),
      NsgRoute(
        path: Routes.paymentPage,
        page: (context, state) => PaymentPage(),
        binding: PaymentBinding(),
      ),
      NsgRoute(
        path: Routes.eventsBudgetPayment,
        page: (context, state) => EventsBudgetPayment(),
        binding: EventsBinding(),
      ),
      NsgRoute(
        path: Routes.eventsCostListPage,
        page: (context, state) => EventsCostListPage(),
        binding: EventsBinding(),
      ),
      NsgRoute(
        path: Routes.eventsCostPage,
        page: (context, state) => EventsCostPage(),
        binding: EventsBinding(),
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      if (state.location == Routes.splashPage) {
        isInitialized = true;
      } else if (state.location != Routes.splashPage && !isInitialized) {
        DataController.pageToGo = state.location;
        return Routes.splashPage;
      }
      return null;
    },
  );
}

abstract class Routes {
  static const splashPage = '/';
  static const mainPage = '/main';
  static const friendsList = '/friends_list?{id}';
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
  static const eventsBudgetPayment = '/events_budget_payment';
  static const eventsCostListPage = '/events_cost_list';
  static const eventsCostPage = '/events_cost_page';
}
