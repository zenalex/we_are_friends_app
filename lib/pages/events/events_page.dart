import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsg_controls/nsg_controls.dart';
import 'package:nsg_controls/nsg_text.dart';
import 'package:we_are_friends_app/app_pages.dart';

import '../../model/data_controller_model.dart';
import '../event_group/event_group_controller.dart';
import 'events_controller.dart';
import 'events_image_controller.dart';

class EventsPage extends GetView<EventsController> {
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
                      controller.itemPageCancel();
                    },
                    icon2: Icons.check,
                    onPressed2: () {
                      controller.itemPagePost();
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
                                  Get.find<EventGroupController>(),
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
                                const NsgText('Необходимая сумма'),
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
    return Container(
      //width: 300,
      height: 500,
      child: DefaultTabController(
        length: 2,
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
      objectsList: Get.find<EventImageController>().images,
      allowedFileFormats: const [],
    );
  }

  Widget _friendsTable() {
    return NsgTable(
      controller: Get.find<EventsFriendTableController>(),
      elementEditPageName: Routes.eventsPageRow,
      columns: [
        NsgTableColumn(
            name: EventFriendTableGenerated.nameFriendId,
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
