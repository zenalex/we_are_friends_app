import 'package:flutter/material.dart';
import 'package:nsg_controls/nsg_controls.dart';
import 'package:nsg_controls/nsg_text.dart';
import 'package:nsg_controls/nsg_view.dart';
import 'package:nsg_data/nsg_data.dart';

import '../../model/data_controller_model.dart';
import 'payment_controller.dart';
import 'payment_image_controller.dart';

class PaymentPage extends NsgView<PaymentController> {
  PaymentPage({super.key});

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
                              fieldName: PaymentGenerated.nameDate,
                              label: 'Дата платежа',
                            ),
                            NsgInput(
                              dataItem: controller.currentItem,
                              fieldName: PaymentGenerated.nameEventId,
                              label: 'Мероприятие',
                              updateController: controller,
                            ),
                            NsgInput(
                              dataItem: controller.currentItem,
                              fieldName: PaymentGenerated.nameFriendId,
                              label: 'Друг (плательщик)',
                              updateController: controller,
                            ),
                            NsgText(
                                'Текущая задолженность ${controller.currentItem.friend.getCredit(controller.currentItem.event)}'),
                            NsgButton(
                                text: 'Установить',
                                onPressed: () {
                                  controller.currentItem.sum = controller
                                      .currentItem.friend
                                      .getCredit(controller.currentItem.event);
                                  controller.sendNotify();
                                }),
                            NsgInput(
                              dataItem: controller.currentItem,
                              fieldName: PaymentGenerated.nameSum,
                              label: 'Сумма платежа',
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
      objectsList: NsgGet.find<PaymentImageController>().images,
      allowedFileFormats: const [],
    );
  }
}
