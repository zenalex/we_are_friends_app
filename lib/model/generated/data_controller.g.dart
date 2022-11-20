import 'package:get/get.dart';
import 'package:nsg_data/nsg_data.dart';
// ignore: depend_on_referenced_packages
import 'package:package_info_plus/package_info_plus.dart';
import '../_nsg_server_options.dart';
import '../data_controller_model.dart';

class DataControllerGenerated extends NsgBaseController {
  NsgDataProvider? provider;
  @override
  Future onInit() async {
    final info = await PackageInfo.fromPlatform();
    provider ??= NsgDataProvider(
        applicationName: 'we_are_friends',
        applicationVersion: info.version,
        firebaseToken: '');
    provider!.serverUri = NsgServerOptions.serverUriDataController;

    NsgDataClient.client.registerDataItem(Friend(), remoteProvider: provider);
    NsgDataClient.client.registerDataItem(Event(), remoteProvider: provider);
    NsgDataClient.client
        .registerDataItem(EventFriendTable(), remoteProvider: provider);
    NsgDataClient.client
        .registerDataItem(EventGroup(), remoteProvider: provider);
    NsgDataClient.client
        .registerDataItem(PhotoItem(), remoteProvider: provider);
    provider!.useNsgAuthorization = true;
    var db = NsgLocalDb.instance;
    await db.init('we_are_friends');
    await provider!.connect(this);

    super.onInit();
  }

  @override
  Future loadProviderData() async {
    currentStatus = RxStatus.success();
    sendNotify();
  }
}
