import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsg_controls/nsg_controls.dart';
import 'package:nsg_data/nsg_data.dart';
import 'package:we_are_friends_app/model/data_controller_model.dart';
import 'package:we_are_friends_app/pages/events/events_controller.dart';

class EventImageController extends NsgDataTableController<EventPhotoTable> {
  EventImageController()
    : super(
        masterController: Get.find<EventsController>(),
        tableFieldName: EventGenerated.namePhotoTable,
      );

  var images = <NsgFilePickerObject>[];

  @override
  NsgDataRequestParams get getRequestFilter {
    var filter = super.getRequestFilter;
    var cmp = filter.compare;
    var ids = <String>[];
    for (var e in items) {
      ids.add(e.photoItemId);
    }
    cmp.add(
      name: PhotoItemGenerated.nameId,
      value: ids,
      comparisonOperator: NsgComparisonOperator.inList,
    );
    return NsgDataRequestParams(compare: cmp);
  }

  Future saveImages() async {
    // var progress = NsgProgressDialog(textDialog: 'Сохранение фото');
    // progress.show();
    //try {
    for (var img in images) {
      if (img.image == null) continue;
      if (img.id == '') {
        var pic = PhotoItem();
        pic.storageType = NsgDataStorageType.local;
        pic.name = img.description;
        var eventController = Get.find<EventsController>();
        pic.ownerId = eventController.currentItem.id;
        if (kIsWeb) {
          File imagefile = File.fromUri(Uri(path: img.filePath));
          pic.photo = await imagefile.readAsBytes();
        } else {
          File imagefile = File(img.filePath);
          pic.photo = await imagefile.readAsBytes();
        }
        await pic.post();
        var row = EventPhotoTable();
        row.photoItemId = pic.id;
        eventController.currentItem.photoTable.addRow(row);
      }
    }
    //progress.hide();
    //Get.back();
    // } catch (ex) {
    //   progress.hide();
    //   Get.showSnackbar(GetSnackBar(
    //     title: 'ОШИБКА',
    //     message: ex.toString(),
    //   ));
    // }
  }

  @override
  Future refreshData({
    List<NsgUpdateKey>? keys,
    NsgDataRequestParams? filter,
  }) async {
    await super.refreshData(keys: keys);
    images.clear();
    for (var e in items) {
      if (e.photoItemId.isEmpty) {
        continue;
      }
      images.add(
        NsgFilePickerObject(
          image: Image.memory(Uint8List.fromList(e.photoItem.photo)),
          description: e.name,
          fileType: NsgFilePickerObjectType.image,
          id: e.id,
          isNew: false,
        ),
      );
    }
    return;
  }
}
