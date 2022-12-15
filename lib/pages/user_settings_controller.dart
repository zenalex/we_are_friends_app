import 'package:nsg_data/nsg_data.dart';

import '../model/data_controller_model.dart';

class UserSettingsController extends NsgUserSettingsController<UserSettings> {
  UserSettingsController()
      : super(requestOnInit: false, autoRepeate: true, autoRepeateCount: 30);
}
