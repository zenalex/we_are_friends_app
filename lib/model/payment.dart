import 'package:nsg_data/nsg_data.dart';

import 'generated/payment.g.dart';

class Payment extends PaymentGenerated {
  @override
  bool isFieldRequired(String fieldName) {
    return [
      PaymentGenerated.nameEventId,
      PaymentGenerated.nameFriendId,
      PaymentGenerated.nameSum,
    ].contains(fieldName);
  }

  @override
  NsgValidateResult validateFieldValues({NsgBaseController? controller}) {
    var result = super.validateFieldValues();
    return result;
  }
}
