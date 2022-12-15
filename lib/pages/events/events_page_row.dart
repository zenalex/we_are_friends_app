import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsg_controls/nsg_controls.dart';
import 'package:we_are_friends_app/pages/friends/friends_controller.dart';

import '../../app_pages.dart';
import '../../model/data_controller_model.dart';
import '../payment/payment_controller.dart';
import 'events_controller.dart';

class EventsPageRow extends GetView<EventsFriendTableController> {
  EventsPageRow({Key? key}) : super(key: key);

  final _textTitle = 'Редактирование строки'.toUpperCase();
  final _textTitleNew = 'Добавление строки'.toUpperCase();

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
                        NsgInput(
                          dataItem: controller.currentItem,
                          fieldName: EventFriendTableGenerated.nameFriendId,
                          selectionController: Get.find<FriendsController>(),
                          selectionForm: Routes.friendsList,
                          label: 'Друг',
                        ),
                        NsgInput(
                          dataItem: controller.currentItem,
                          fieldName: EventFriendTableGenerated.nameSumNeeded,
                          label: 'Необходимая сумма',
                        ),
                        NsgInput(
                          dataItem: controller.currentItem,
                          fieldName: EventFriendTableGenerated.nameSumAcquired,
                          label: 'Сдано',
                        ),
                        NsgButton(
                          text: 'Добавить платеж',
                          onPressed: () {
                            var pc = Get.find<PaymentController>();
                            pc.currentEvent = controller.currentItem.owner;
                            pc.currentFriend = controller.currentItem.friend;
                            pc.newItemPageOpen(pageName: Routes.paymentPage);
                          },
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
