import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsg_controls/nsg_controls.dart';
import 'package:we_are_friends_app/app_pages.dart';
import 'package:we_are_friends_app/model/generated/friend.g.dart';

import '../../model/data_controller_model.dart';
import '../../model/generated/event.g.dart';
import 'events_controller.dart';

class EventsPage extends GetView<EventsController> {
  EventsPage({Key? key}) : super(key: key);

  final _textTitle = 'Редактирование сотрудника'.toUpperCase();
  final _textTitleNew = 'Добавление сотрудника'.toUpperCase();

  @override
  Widget build(BuildContext context) {
    return BodyWrap(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: controller.obx(
          (state) => Container(
            //key: GlobalKey(),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                NsgAppBar(
                  text: controller.currentItem.isEmpty
                      ? _textTitleNew
                      : _textTitle,
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
                    //child: SingleChildScrollView(
                    child: Column(
                      children: [
                        NsgDatePicker(
                            initialTime: controller.currentItem.date,
                            onClose: (d) {
                              controller.currentItem.date = d;
                            }),
                        NsgInput(
                          dataItem: controller.currentItem,
                          fieldName: EventGenerated.nameSumNeeded,
                          label: 'Необходимая сумма',
                        ),
                        NsgInput(
                          dataItem: controller.currentItem,
                          fieldName: EventGenerated.nameSumRaised,
                          label: 'Собранная сумма',
                        ),
                        NsgTable(
                          controller: Get.find<EventsFriendTableController>(),
                          elementEditPageName: Routes.eventsPageRow,
                          columns: [
                            NsgTableColumn(
                                name: EventFriendTableGenerated.nameFriendId,
                                width: 100,
                                presentation: 'Друг'),
                            NsgTableColumn(
                                name: EventFriendTableGenerated.nameSumNeeded,
                                width: 100,
                                presentation: 'Требуется'),
                            NsgTableColumn(
                                name: EventFriendTableGenerated.nameSumAcquired,
                                width: 100,
                                presentation: 'Сдано')
                          ],
                        )
                      ],
                    ),
                    //)
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
