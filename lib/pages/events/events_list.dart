import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsg_controls/nsg_controls.dart';

import '../../app_pages.dart';
import '../../model/generated/event.g.dart';
import 'events_controller.dart';

class EventsListPage extends GetView<EventsController> {
  const EventsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NsgListPage(
      type: NsgListPageMode.table,
      controller: controller,
      title: 'Список мероприятий',
      textNoItems: 'Добавьте мероприятие',
      elementEditPage: Routes.eventsPage,
      columns: [
        NsgTableColumn(
            name: EventGenerated.nameDate,
            presentation: 'Дата',
            width: 200),
        NsgTableColumn(
            name: EventGenerated.nameSumNeeded,
            presentation: 'Требуемая сумма',
            width: 200,
            totalSum: true),
        NsgTableColumn(
            name: EventGenerated.nameSumRaised,
            presentation: 'Собранная сумма',
            width: 200,
            totalSum: true),
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
