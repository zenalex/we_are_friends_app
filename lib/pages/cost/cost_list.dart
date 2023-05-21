import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nsg_controls/nsg_controls.dart';
import 'package:nsg_controls/nsg_view.dart';

import '../../app_pages.dart';
import '../../model/data_controller_model.dart';
import '../user_settings_controller.dart';
import 'cost_controller.dart';

class CostListPage extends NsgView<CostController> {
  CostListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NsgListPage(
      type: NsgListPageMode.table,
      controller: controller,
      userSettingsId: 'costs_list',
      userSettingsController: GetIt.instance<UserSettingsController>(),
      title: 'Справочник затрат',
      textNoItems: 'Добавьте затрату',
      elementEditPage: Routes.costPage,
      columns: [
        NsgTableColumn(
            name: CostItemGenerated.nameName,
            presentation: 'Наиманование',
            width: 200),
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
