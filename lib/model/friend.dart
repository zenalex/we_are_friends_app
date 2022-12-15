import 'dart:math';

import 'package:we_are_friends_app/model/data_controller_model.dart';

class Friend extends FriendGenerated {
  @override
  String toString() {
    return '$lastName $firstName';
  }

  double getCredit(Event event) {
    var row = event.friendTable.rows
        .firstWhere((e) => e.friend == this, orElse: () => EventFriendTable());

    return max(row.sumNeeded - row.sumAcquired, 0);
  }
}
