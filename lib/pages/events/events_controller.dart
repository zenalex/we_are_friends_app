import 'package:get/get.dart';
import 'package:nsg_data/nsg_data.dart';

import '../../model/event.dart';
import '../../model/event_friend_table.dart';
import '../../model/generated/event.g.dart';
import 'events_image_controller.dart';

class EventsController extends NsgDataController<Event> {
  EventsController()
      : super(
            controllerMode: const NsgDataControllerMode(
                storageType: NsgDataStorageType.local));

  @override
  Future<Event> doCreateNewItem() async {
    var el = await super.doCreateNewItem();
    el.date = DateTime.now().add(const Duration(days: 1));
    return el;
  }

  @override
  Future<List<NsgDataItem>> doRequestItems() async {
    return await super.doRequestItems();
  }

  @override
  Future<bool> itemPagePost(
      {bool goBack = true, bool useValidation = true}) async {
    await Get.find<EventImageController>().saveImages();
    var b =
        await super.itemPagePost(goBack: goBack, useValidation: useValidation);
    return b;
  }
}

class EventsFriendTableController
    extends NsgDataTableController<EventFriendTable> {
  EventsFriendTableController()
      : super(
            masterController: Get.find<EventsController>(),
            tableFieldName: EventGenerated.nameFriendTable,
            controllerMode: const NsgDataControllerMode(
                storageType: NsgDataStorageType.local));
}
