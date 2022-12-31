import 'package:nsg_data/nsg_data.dart';
import 'package:we_are_friends_app/model/event.dart';

import 'generated/event_budget_table.g.dart';

class EventBudgetTable extends EventBudgetTableGenerated {
  @override
  bool isFieldRequired(String fieldName) {
    return [
      EventBudgetTableGenerated.nameOwnerId,
      EventBudgetTableGenerated.nameCostItemId,
      EventBudgetTableGenerated.nameSumNeeded
    ].contains(fieldName);
  }

  @override
  NsgValidateResult validateFieldValues() {
    var result = super.validateFieldValues();
    return result;
  }
}
