import 'package:nsg_data/nsg_data.dart';
import 'package:we_are_friends_app/model/cost_item.dart';

class CostController extends NsgDataController<CostItem> {
  CostController()
      : super(
            controllerMode: const NsgDataControllerMode(
                storageType: NsgDataStorageType.local));
}
