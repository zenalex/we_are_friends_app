import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsg_controls/nsg_controls.dart';

import '../../app_pages.dart';
import '../../model/data_controller_model.dart';
import '../user_settings_controller.dart';
import 'events_controller.dart';

class EventsCostListPage extends GetView<EventsBudgetTableController> {
  const EventsCostListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NsgListPage(
      type: NsgListPageMode.table,
      controller: controller,
      userSettingsId: 'events_list',
      userSettingsController: Get.find<UserSettingsController>(),
      title: 'Оплата',
      textNoItems: 'Новая оплата',
      elementEditPage: Routes.paymentPage,
      columns: [
        NsgTableColumn(
            name: EventBudgetTableGenerated.nameOwnerId,
            presentation: 'Событие',
            expanded: true,
            width: 200),
        NsgTableColumn(
            name: EventBudgetTableGenerated.nameCostItemId,
            presentation: 'Затрата',
            width: 200),
        NsgTableColumn(
            name: EventBudgetTableGenerated.nameSumNeeded,
            presentation: 'Сумма',
            width: 100),
      ],
      availableButtons: NsgTableMenuButtonType.allExceptSelected(
          [NsgTableMenuButtonType.favorites, NsgTableMenuButtonType.recent]),
    );
  }
}
