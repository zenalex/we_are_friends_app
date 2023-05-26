import 'package:flutter/material.dart';
import 'package:nsg_controls/nsg_controls.dart';
import 'package:nsg_controls/nsg_text.dart';
import 'package:nsg_controls/nsg_view.dart';
import 'package:nsg_data/nsg_data.dart';
import 'package:we_are_friends_app/app_pages.dart';

import '../../model/data_controller_model.dart';
import '../event_group/event_group_controller.dart';
import '../user_settings_controller.dart';
import 'events_controller.dart';
import 'events_image_controller.dart';

class EventsPage extends NsgView<EventsController> {
  EventsPage({Key? key}) : super(key: key);

  final _textTitle = 'Редактирование сотрудника'.toUpperCase();
  final _textTitleNew = 'Добавление сотрудника'.toUpperCase();

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
                mainAxisSize: MainAxisSize.min,
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
                  Flexible(
                    flex: 1,
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            NsgDatePicker(
                                initialTime: controller.currentItem.date,
                                onClose: (d) {
                                  controller.currentItem.date = d;
                                }),
                            NsgInput(
                              dataItem: controller.currentItem,
                              fieldName: EventGenerated.nameName,
                              label: 'Название мероприятия',
                            ),
                            NsgInput(
                              dataItem: controller.currentItem,
                              fieldName: EventGenerated.nameEventGroupId,
                              selectionController:
                                  NsgGet.find<EventGroupController>(),
                              selectionForm: Routes.eventGroupList,
                              label: 'Группа мероприятий',
                            ),
                            NsgInput(
                              dataItem: controller.currentItem,
                              fieldName: EventGenerated.nameComment,
                              label: 'Описание',
                              minLines: 3,
                              maxLines: 6,
                            ),
                            NsgInput(
                              dataItem: controller.currentItem,
                              fieldName: EventGenerated.nameIsFinished,
                              label: 'Мероприятие завершено ',
                            ),
                            Row(
                              children: [
                                const NsgText('Необходимая сумма '),
                                NsgText(controller.currentItem.sumNeeded
                                    .toStringAsFixed(2))
                              ],
                            ),
                            Row(
                              children: [
                                const NsgText('Фактическая сумма затрат'),
                                NsgText(controller.currentItem.sumActual
                                    .toStringAsFixed(2))
                              ],
                            ),
                            Row(
                              children: [
                                const NsgText('Собранная сумма'),
                                NsgText(controller.currentItem.sumRaised
                                    .toStringAsFixed(2))
                              ],
                            ),
                            NsgButton(
                                text: 'Обновить',
                                onPressed: () {
                                  controller.currentItem.sumNeeded = 0;
                                  controller.currentItem.sumActual = 0;
                                  controller.currentItem.sumRaised = 0;
                                  for (var row in NsgGet.find<
                                          EventsBudgetTableController>()
                                      .items) {
                                    controller.currentItem.sumNeeded +=
                                        row.sumNeeded;
                                    controller.currentItem.sumActual +=
                                        row.sumActual;
                                  }

                                  int i = 0;

                                  for (var row in NsgGet.find<
                                          EventsFriendTableController>()
                                      .items) {
                                    controller.currentItem.sumRaised +=
                                        row.sumAcquired;
                                    i++;
                                  }

                                  for (var row in NsgGet.find<
                                          EventsFriendTableController>()
                                      .items) {
                                    row.sumNeeded =
                                        controller.currentItem.sumNeeded / i;
                                  }

                                  controller.sendNotify();
                                }),
                            _tabs(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  Widget _tabs() {
    return SizedBox(
      //width: 300,
      height: 500,
      child: DefaultTabController(
        length: 3,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TabBar(
                        indicatorColor: ControlOptions.instance.colorMain,
                        unselectedLabelColor:
                            ControlOptions.instance.colorText.withOpacity(0.5),
                        labelColor: ControlOptions.instance.colorText,
                        labelPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        tabs: [
                          Tab(
                              child: Text(
                            "Бюджет".toUpperCase(),
                            textAlign: TextAlign.center,
                          )),
                          Tab(
                              child: Text(
                            "Участники".toUpperCase(),
                            textAlign: TextAlign.center,
                          )),
                          Tab(
                              child: Text("Документы".toUpperCase(),
                                  textAlign: TextAlign.center)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TabBarView(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Align(
                          alignment: Alignment.topLeft, child: _budgetTable()),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Align(
                          alignment: Alignment.topLeft, child: _friendsTable()),
                    ),
                    imageGallery()
                  ]),
                ),
              )
            ]),
      ),
    );
  }

  Widget imageGallery() {
    return NsgFilePicker(
      showAsWidget: true,
      callback: (value) {},
      objectsList: NsgGet.find<EventImageController>().images,
      allowedFileFormats: const [],
    );
  }

  Widget _budgetTable() {
    return NsgTable(
      userSettingsId: 'budget_table',
      controller: NsgGet.find<EventsBudgetTableController>(),
      userSettingsController: NsgGet.find<UserSettingsController>(),
      elementEditPageName: Routes.eventsBudgetRow,
      columns: [
        NsgTableColumn(
            name: EventBudgetTableGenerated.nameCostItemId,
            expanded: true,
            width: 100,
            presentation: 'Затрата'),
        NsgTableColumn(
            name: EventBudgetTableGenerated.nameSumNeeded,
            width: 100,
            presentation: 'Требуется'),
        NsgTableColumn(
            name: EventBudgetTableGenerated.nameSumActual,
            width: 100,
            presentation: 'Фактически потрачено')
      ],
    );
  }

  Widget _friendsTable() {
    return NsgTable(
      userSettingsId: 'friends_table',
      controller: NsgGet.find<EventsFriendTableController>(),
      userSettingsController: NsgGet.find<UserSettingsController>(),
      elementEditPageName: Routes.eventsPageRow,
      columns: [
        NsgTableColumn(
            name: EventFriendTableGenerated.nameFriendId,
            expanded: true,
            width: 100,
            presentation: 'Друг'),
        NsgTableColumn(
            name: EventFriendTableGenerated.nameSumNeeded,
            width: 100,
            presentation: 'Требуется'),
        NsgTableColumn(
            name: EventFriendTableGenerated.nameSumAcquired,
            width: 100,
            presentation: 'Сдано')
      ],
    );
  }
}
