import 'package:flutter/material.dart';
import 'package:nsg_controls/nsg_controls.dart';
import 'package:nsg_controls/nsg_view.dart';
import 'package:nsg_data/nsg_data.dart';

import '../../app_pages.dart';
import '../../model/generated/event.g.dart';
import '../user_settings_controller.dart';
import 'events_controller.dart';

class EventsListPage extends NsgView<EventsController> {
  EventsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NsgListPage(
      type: NsgListPageMode.table,
      controller: controller,
      userSettingsId: 'events_table',
      userSettingsController: NsgGet.find<UserSettingsController>(),
      title: 'Список мероприятий',
      textNoItems: 'Добавьте мероприятие',
      elementEditPage: Routes.eventsPage,
      columns: [
        NsgTableColumn(
            name: EventGenerated.nameDate, presentation: 'Дата', width: 100),
        NsgTableColumn(
            name: EventGenerated.nameEventGroupId,
            presentation: 'Группа',
            width: 100),
        NsgTableColumn(
            name: EventGenerated.nameName,
            presentation: 'Мероприятие',
            width: 200),
        NsgTableColumn(
            name: EventGenerated.nameSumNeeded,
            presentation: 'Требуемая сумма',
            width: 100,
            totalSum: true),
        NsgTableColumn(
            name: EventGenerated.nameSumRaised,
            presentation: 'Собранная сумма',
            width: 100,
            totalSum: true),
      ],
      availableButtons: NsgTableMenuButtonType.allExceptSelected([
        NsgTableMenuButtonType.filterPeriod,
        NsgTableMenuButtonType.columnsSelect,
        NsgTableMenuButtonType.columnsSize,
        NsgTableMenuButtonType.favorites,
        NsgTableMenuButtonType.recent
      ]),
    );
  }
}
