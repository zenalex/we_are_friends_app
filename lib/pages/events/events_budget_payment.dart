import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nsg_controls/nsg_controls.dart';
import 'package:nsg_controls/nsg_text.dart';
import 'package:nsg_controls/nsg_view.dart';
import 'package:we_are_friends_app/pages/events/events_controller.dart';

import '../../model/data_controller_model.dart';
import 'events_image_controller.dart';

class EventsBudgetPayment extends NsgView<EventsBudgetTableController> {
  EventsBudgetPayment({Key? key}) : super(key: key);

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
                    controller.itemPageCancel(context);
                  },
                  icon2: Icons.check,
                  onPressed2: () {
                    controller.itemPagePost(context);
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
                            NsgInput(
                              dataItem: controller.currentItem,
                              fieldName: EventBudgetTableGenerated.nameComment,
                              label: 'Описание',
                              minLines: 3,
                              maxLines: 6,
                            ),
                            Row(
                              children: [
                                const NsgText('Требуемая сумма'),
                                NsgText(controller.currentItem.sumNeeded
                                    .toStringAsFixed(2))
                              ],
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
      objectsList: GetIt.instance<EventImageController>().images,
      allowedFileFormats: const [],
    );
  }
}
