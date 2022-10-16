import 'package:get/get.dart';
import 'package:we_are_friends_app/pages/events/events_list.dart';
import 'package:we_are_friends_app/pages/friends/friends_binding.dart';

import 'pages/events/events_binding.dart';
import 'pages/events/events_page.dart';
import 'pages/events/events_page_row.dart';
import 'pages/friends/friends_list.dart';
import 'pages/friends/friends_page.dart';
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
  ];
}

abstract class Routes {
  static const splashPage = '/';
  static const mainPage = '/main';
  static const friendsList = '/friends_list';
  static const friendsPage = '/friends_page';
  static const eventsList = '/events_list';
  static const eventsPage = '/events_page';
  static const eventsPageRow = '/events_page_row';
}
