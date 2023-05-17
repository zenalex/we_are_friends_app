import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsg_data/nsg_data.dart';
import 'package:we_are_friends_app/model/data_controller_model.dart';

import 'events_image_controller.dart';

class EventsController extends NsgDataController<Event> {
  EventsController() : super();

  @override
  Future<List<NsgDataItem>> doRequestItems() async {
    return await super.doRequestItems();
  }

  @override
  Future<Event> doCreateNewItem() async {
    var el = await super.doCreateNewItem() as Event;
    el.date = DateTime.now();
    return el;
  }

  @override
  Future<bool> itemPagePost(BuildContext context,
      {bool goBack = true, bool useValidation = true}) async {
    await Get.find<EventImageController>().saveImages();
    var b =
        // ignore: use_build_context_synchronously
        await super.itemPagePost(context,
            goBack: goBack, useValidation: useValidation);
    if (eventBudgetTable != null &&
        eventBudgetTable!.costItem == currentCostItem &&
        eventBudgetTable!.owner == currentEvent) {
      var prevSum = 0.0;
      if (backupItem != null) {
        prevSum = (backupItem as Payment).sum;
      }
      eventBudgetTable!.sumNeeded += eventBudgetTable!.sumNeeded - prevSum;
      Get.find<EventsBudgetTableController>().sendNotify();
    }
    return b;
  }

  @override
  NsgDataRequestParams get getRequestFilter {
    var filter = super.getRequestFilter;
    if (currentEvent != null) {
      filter.compare
          .add(name: PaymentGenerated.nameEventId, value: currentEvent);
    }
    if (currentCostItem != null) {
      filter.compare.add(
          name: EventBudgetTableGenerated.nameCostItemId,
          value: currentCostItem);
    }
    return filter;
  }

  EventBudgetTable? eventBudgetTable;

  Event? currentEvent;

  CostItem? currentCostItem;

  EventFriendTable? currentFriend;
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

  @override
  Future<EventBudgetTable> doCreateNewItem() async {
    var el = await super.doCreateNewItem();
    if (currentEvent != null) {
      el.owner = currentEvent!;
    }
    if (currentCostItem != null) {
      el.costItem = currentCostItem!;
    }
    return el;
  }

  EventBudgetTable? eventBudgetTable;

  Event? currentEvent;

  CostItem? currentCostItem;
}
