import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nsg_data/nsg_data.dart';
import 'package:we_are_friends_app/model/data_controller_model.dart';

import '../events/events_controller.dart';
import 'payment_image_controller.dart';

class PaymentController extends NsgDataController<Payment> {
  PaymentController() : super();
  @override
  Future<bool> itemPagePost(BuildContext context,
      {bool goBack = true, bool useValidation = true}) async {
    await GetIt.instance<PaymentImageController>().saveImages();
    var b =
        // ignore: use_build_context_synchronously
        await super.itemPagePost(context,
            goBack: goBack, useValidation: useValidation);
    if (eventFriendTable != null &&
        eventFriendTable!.friend == currentFriend &&
        eventFriendTable!.owner == currentEvent) {
      var prevSum = 0.0;
      if (backupItem != null) {
        prevSum = (backupItem as Payment).sum;
      }
      eventFriendTable!.sumAcquired += currentItem.sum - prevSum;
      GetIt.instance<EventsFriendTableController>().sendNotify();
    }
    return b;
  }

  @override
  Future<Payment> doCreateNewItem() async {
    var el = await super.doCreateNewItem() as Payment;
    el.date = DateTime.now();
    if (currentEvent != null) {
      el.event = currentEvent!;
    }
    if (currentFriend != null) {
      el.friend = currentFriend!;
    }
    return el;
  }

  @override
  NsgDataRequestParams get getRequestFilter {
    var filter = super.getRequestFilter;
    if (currentEvent != null) {
      filter.compare
          .add(name: PaymentGenerated.nameEventId, value: currentEvent);
    }
    if (currentFriend != null) {
      filter.compare
          .add(name: PaymentGenerated.nameFriendId, value: currentFriend);
    }
    return filter;
  }

  /// Текущее событие по которому просматриваем список платежей или создаем новый
  Event? currentEvent;

  /// Текущий друг по которому просматриваем список платежей или создаем новый
  Friend? currentFriend;

  ///Строка в таблице друзей
  EventFriendTable? eventFriendTable;
}
