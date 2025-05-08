import 'package:nsg_data/nsg_data.dart';

class NsgServerOptions {
  // Рабочий сервер
  static String get serverUriDataController => availableServers.currentServer;

  static NsgServerParams availableServers = NsgServerParams({
    'https://localhost': 'main',
    // ignore: equal_keys_in_map
    'https://localhost': 'test',
  }, 'https://localhost');
}

class NsgMetricaOptions {
  static String yandexMetricaId = "";
}
