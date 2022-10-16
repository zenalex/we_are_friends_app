import 'package:get/get.dart';
import 'package:nsg_data/nsg_data.dart';

import '../../model/event.dart';
import '../../model/event_friend_table.dart';
import '../../model/generated/event.g.dart';

class EventsController extends NsgDataController<Event> {
  @override
  Future<Event> doCreateNewItem() async{
    var el = await super.doCreateNewItem();
     el.date = DateTime.now().add(const Duration(days: 1));
     return el;
  }

}

class EventsFriendTableController extends NsgDataTableController<EventFriendTable>{

  EventsFriendTableController() : super(masterController: Get.find<EventsController>(), 
  tableFieldName: EventGenerated.nameFriendTable);
  
}
