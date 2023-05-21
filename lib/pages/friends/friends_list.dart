import 'package:flutter/material.dart';
import 'package:nsg_controls/nsg_controls.dart';
import 'package:nsg_controls/nsg_view.dart';

import '../../app_pages.dart';
import '../../model/generated/friend.g.dart';
import '../user_settings_controller.dart';
import 'friends_controller.dart';

class FriendsListPage extends NsgView<FriendsController> {
  FriendsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NsgListPage(
      type: NsgListPageMode.table,
      controller: controller,
      userSettingsId: 'friends_list',
      userSettingsController: get<UserSettingsController>(),
      title: 'Список друзей',
      textNoItems: 'Добавьте друзей',
      elementEditPage: Routes.friendsPage,
      columns: [
        NsgTableColumn(
            name: FriendGenerated.nameLastName,
            presentation: 'Фамилия',
            width: 200),
        NsgTableColumn(
            name: FriendGenerated.nameFirstName,
            presentation: 'Имя',
            width: 200),
        NsgTableColumn(
            name: FriendGenerated.namePhone,
            presentation: 'Телефон',
            width: 150),
      ],
      availableButtons: NsgTableMenuButtonType.allExceptSelected([
        NsgTableMenuButtonType.filterPeriod,
        NsgTableMenuButtonType.columnsSelect,
        NsgTableMenuButtonType.columnsSize,
        NsgTableMenuButtonType.favorites,
        NsgTableMenuButtonType.recent
      ]),
    );
  }
}
