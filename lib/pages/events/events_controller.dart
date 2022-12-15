import 'package:get/get.dart';
import 'package:nsg_data/nsg_data.dart';
import 'package:we_are_friends_app/model/data_controller_model.dart';

import 'events_image_controller.dart';

class EventsController extends NsgDataController<Event> {
  EventsController() : super();

  @override
  Future<Event> doCreateNewItem() async {
    var el = await super.doCreateNewItem() as Event;
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
            tableFieldName: EventGenerated.nameFriendTable);
}

class EventsBudgetTableController
    extends NsgDataTableController<EventBudgetTable> {
  EventsBudgetTableController()
      : super(
          masterController: Get.find<EventsController>(),
          tableFieldName: EventGenerated.nameBudgetTable,
        );
}
