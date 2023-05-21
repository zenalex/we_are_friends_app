import 'package:get_it/get_it.dart';
import 'package:nsg_data/nsg_data.dart';

import 'friends_controller.dart';

// ignore: deprecated_member_use
class FriendsBinding extends NsgBinding {
  @override
  void dependencies() {
    GetIt.I.registerLazySingleton<FriendsController>(() => FriendsController());
  }
}
