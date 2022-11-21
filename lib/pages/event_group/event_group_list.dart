import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsg_controls/nsg_controls.dart';

import '../../app_pages.dart';
import '../../model/data_controller_model.dart';
import 'event_group_controller.dart';

class EventGroupListPage extends GetView<EventGroupController> {
  const EventGroupListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NsgListPage(
      type: NsgListPageMode.table,
      controller: controller,
      title: 'Группы мероприятий',
      textNoItems: 'Добавьте группу',
      elementEditPage: Routes.eventGroupPage,
      columns: [
        NsgTableColumn(
            name: EventGroupGenerated.nameName,
            presentation: 'Наименование',
            width: 200),
      ],
      availableButtons: NsgTableMenuButtonType.allExceptSelected([
        NsgTableMenuButtonType.columnsSelect,
        NsgTableMenuButtonType.columnsSize,
        NsgTableMenuButtonType.favorites,
        NsgTableMenuButtonType.recent
      ]),
    );
  }
}
