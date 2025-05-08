import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsg_controls/nsg_controls.dart';

import '../../model/data_controller_model.dart';
import 'event_group_controller.dart';

class EventGroupPage extends GetView<EventGroupController> {
  EventGroupPage({Key? key}) : super(key: key);

  final _textTitle = 'Редактирование группы'.toUpperCase();
  final _textTitleNew = 'Добавление группы'.toUpperCase();

  @override
  Widget build(BuildContext context) {
    return BodyWrap(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: controller.obx(
          (state) => Container(
            key: GlobalKey(),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                NsgAppBar(
                  text:
                      controller.currentItem.isEmpty
                          ? _textTitleNew
                          : _textTitle,
                  icon: Icons.arrow_back_ios_new,
                  colorsInverted: true,
                  bottomCircular: true,
                  onPressed: () {
                    controller.itemPageCancel(context: context);
                  },
                  icon2: Icons.check,
                  onPressed2: () {
                    controller.itemPagePost();
                  },
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          NsgInput(
                            dataItem: controller.currentItem,
                            fieldName: EventGroupGenerated.nameName,
                            label: 'Наименование',
                          ),
                        ],
                      ),
                    ),
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
