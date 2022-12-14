import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsg_controls/nsg_controls.dart';

import '../../app_pages.dart';
import '../../model/data_controller_model.dart';
import '../user_settings_controller.dart';
import 'payment_controller.dart';

class PaymentListPage extends GetView<PaymentController> {
  const PaymentListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NsgListPage(
      type: NsgListPageMode.table,
      controller: controller,
      userSettingsId: 'payyment_list',
      userSettingsController: Get.find<UserSettingsController>(),
      title: 'Оплата',
      textNoItems: 'Новая оплата',
      elementEditPage: Routes.paymentPage,
      columns: [
        NsgTableColumn(
            name: PaymentGenerated.nameDate, presentation: 'Дата', width: 100),
        NsgTableColumn(
            name: PaymentGenerated.nameEventId,
            presentation: 'Событие',
            expanded: true,
            width: 200),
        NsgTableColumn(
            name: PaymentGenerated.nameFriendId,
            presentation: 'Друг',
            width: 200),
        NsgTableColumn(
            name: PaymentGenerated.nameSum, presentation: 'Сумма', width: 100),
      ],
      availableButtons: NsgTableMenuButtonType.allExceptSelected(
          [NsgTableMenuButtonType.favorites, NsgTableMenuButtonType.recent]),
    );
  }
}
