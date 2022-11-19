import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsg_controls/nsg_controls.dart';

import '../../app_pages.dart';
import '../../model/generated/friend.g.dart';
import 'friends_controller.dart';

class FriendsListPage extends GetView<FriendsController> {
  const FriendsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NsgListPage(
      type: NsgListPageMode.table,
      controller: controller,
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
      availableButtons: NsgTableMenuButtonType.allExceptSelected(
          [NsgTableMenuButtonType.filterPeriod,
           NsgTableMenuButtonType.columnsSelect,
           NsgTableMenuButtonType.columnsSize,
           NsgTableMenuButtonType.favorites,
           NsgTableMenuButtonType.recent]),
    );
  }
}
