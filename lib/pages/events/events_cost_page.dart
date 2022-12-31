import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsg_controls/nsg_controls.dart';
import 'package:nsg_controls/nsg_text.dart';
import 'package:we_are_friends_app/pages/events/events_controller.dart';

import '../../app_pages.dart';
import '../../model/data_controller_model.dart';
import '../user_settings_controller.dart';
import 'events_controller.dart';
import 'events_image_controller.dart';

class EventsCostPage extends GetView<EventsBudgetTableController> {
  EventsCostPage({Key? key}) : super(key: key);

  final _textTitle = 'Редактирование'.toUpperCase();
  final _textTitleNew = 'Добавление'.toUpperCase();

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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            NsgInput(
                              dataItem: controller.currentItem,
                              fieldName:
                                  EventBudgetTableGenerated.nameCostItemId,
                              label: 'Затрата',
                              updateController: controller,
                            ),
                            NsgInput(
                              dataItem: controller.currentItem,
                              fieldName: EventBudgetTableGenerated.nameOwnerId,
                              label: 'Мероприятие',
                              updateController: controller,
                            ),
                            Row(
                              children: [
                                const NsgText('Требуемая сумма'),
                                NsgText(controller.currentItem.sumNeeded
                                    .toStringAsFixed(2))
                              ],
                            ),
                            NsgInput(
                              dataItem: controller.currentItem,
                              fieldName: EventGenerated.nameSumNeeded,
                              label: 'Необходимая сумма',
                            ),
                            imageGallery(),
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

  Widget imageGallery() {
    return NsgFilePicker(
      showAsWidget: true,
      callback: (value) {},
      objectsList: Get.find<EventImageController>().images,
      allowedFileFormats: const [],
    );
  }
}
