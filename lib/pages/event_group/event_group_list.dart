import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nsg_controls/nsg_controls.dart';
import 'package:nsg_controls/nsg_view.dart';

import '../../app_pages.dart';
import '../../model/data_controller_model.dart';
import '../user_settings_controller.dart';
import 'event_group_controller.dart';

class EventGroupListPage extends NsgView<EventGroupController> {
  EventGroupListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NsgListPage(
      type: NsgListPageMode.table,
      controller: controller,
      userSettingsId: 'event_group_list',
      userSettingsController: GetIt.instance<UserSettingsController>(),
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
