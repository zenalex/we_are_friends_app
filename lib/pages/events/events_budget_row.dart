import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsg_controls/nsg_controls.dart';
import 'package:we_are_friends_app/pages/friends/friends_controller.dart';

import '../../app_pages.dart';
import '../../model/data_controller_model.dart';
import '../cost/cost_controller.dart';
import 'events_controller.dart';

class EventsBudgetRowPage extends GetView<EventsBudgetTableController> {
  EventsBudgetRowPage({Key? key}) : super(key: key);

  final _textTitle = 'Редактирование строки'.toUpperCase();
  final _textTitleNew = 'Добавление строки'.toUpperCase();

  @override
  Widget build(BuildContext context) {
    return BodyWrap(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: controller.obx(
          (state) => Container(
            //key: GlobalKey(),
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
                    //child: SingleChildScrollView(
                    child: Column(
                      children: [
                        NsgInput(
                          dataItem: controller.currentItem,
                          fieldName: EventBudgetTableGenerated.nameCostItemId,
                          selectionController: Get.find<CostController>(),
                          selectionForm: Routes.costList,
                          label: 'Статья затрат',
                        ),
                        NsgInput(
                          dataItem: controller.currentItem,
                          fieldName: EventBudgetTableGenerated.nameSumNeeded,
                          label: 'Необходимая сумма',
                        ),
                        NsgInput(
                          dataItem: controller.currentItem,
                          fieldName: EventBudgetTableGenerated.nameSumActual,
                          label: 'Фактически потраченная сумма',
                        ),
                      ],
                    ),
                    //)
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
