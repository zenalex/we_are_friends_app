import 'package:nsg_data/nsg_data.dart';

import 'generated/event_budget_table.g.dart';

class EventBudgetTable extends EventBudgetTableGenerated {
  @override
  bool isFieldRequired(String fieldName) {
    return [
      EventBudgetTableGenerated.nameOwnerId,
      EventBudgetTableGenerated.nameCostItemId,
      EventBudgetTableGenerated.nameSumNeeded,
    ].contains(fieldName);
  }

  @override
  NsgValidateResult validateFieldValues({NsgBaseController? controller}) {
    var result = super.validateFieldValues();
    return result;
  }
}
