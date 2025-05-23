import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsg_data/nsg_data.dart';
import 'package:we_are_friends_app/model/options/server_options.dart';
import 'package:we_are_friends_app/pages/user_settings_controller.dart';

import '../app_pages.dart';
import 'generated/data_controller.g.dart';

class DataController extends DataControllerGenerated {
  //NsgPushNotificationService? nsgFirebase;

  DataController() : super() {
    requestOnInit = false;
    autoRepeate = true;
    autoRepeateCount = 1000;
  }

  @override
  Future onInit() async {
    provider ??= NsgDataProvider(
      applicationName: 'we_are_friends',
      firebaseToken: '',
      applicationVersion: '',
      allowConnect: false,
      availableServers: NsgServerOptions.availableServers,
    );

    await super.onInit();
  }

  @override
  Future loadProviderData() async {
    await super.loadProviderData();
    Get.put(UserSettingsController(), permanent: true);
    await Get.find<UserSettingsController>().requestItems();
    _gotoMainPage();
  }

  bool _animationFinished = false;
  BuildContext? splashContext;

  void splashAnimationFinished() {
    _animationFinished = true;
    _gotoMainPage();
  }

  bool gotoDone = false;
  static String pageToGo = Routes.eventsList;

  void _gotoMainPage() {
    if (_animationFinished &&
        status.isSuccess &&
        !gotoDone &&
        splashContext != null) {
      gotoDone = true;
      NsgNavigator.go(pageToGo);
      //Get.offAndToNamed(Routes.eventsList);
    }
  }
}
