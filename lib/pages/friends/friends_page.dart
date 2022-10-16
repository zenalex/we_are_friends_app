import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsg_controls/nsg_controls.dart';
import 'package:we_are_friends_app/model/generated/friend.g.dart';

import 'friends_controller.dart';

class FriendPage extends GetView<FriendsController> {
  FriendPage({Key? key}) : super(key: key);

  final _textTitle = 'Редактирование сотрудника'.toUpperCase();
  final _textTitleNew = 'Добавление сотрудника'.toUpperCase();

  @override
  Widget build(BuildContext context) {
    return BodyWrap(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: controller.obx(
          (state) => Container(
            key: GlobalKey(),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                NsgAppBar(
                  text: controller.currentItem.isEmpty ? _textTitleNew : _textTitle,
                  icon: Icons.arrow_back_ios_new,
                  colorsInverted: true,
                  bottomCircular: true,
                  onPressed: () {
                    controller.itemPageCancel();
                  },
                  icon2: Icons.check,
                  onPressed2: () {
                    controller.itemPagePost();
                  },
                ),
                Expanded(
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            NsgInput(
                              dataItem: controller.currentItem,
                              fieldName: FriendGenerated.nameLastName,
                              label: 'Фамилия',
                            ),
                            NsgInput(
                              dataItem: controller.currentItem,
                              fieldName: FriendGenerated.nameFirstName,
                              label: 'Имя',
                            ),
                            NsgInput(
                              dataItem: controller.currentItem,
                              fieldName: FriendGenerated.namePhone,
                              maskType: NsgInputMaskType.phone,
                              label: 'Номер телефона',
                            ),
                            
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
