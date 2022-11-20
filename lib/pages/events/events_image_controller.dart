import 'package:nsg_controls/file_picker/nsg_file_picker_object.dart';
import 'package:nsg_data/nsg_data.dart';
import '../../model/photo_item.dart';

class EventImageController extends NsgDataController<PhotoItem> {
  EventImageController()
      : super(requestOnInit: false, autoRepeate: true, autoRepeateCount: 3);

  var images = <NsgFilePickerObject>[];

  @override
  NsgDataRequestParams get getRequestFilter {
    var cmp = NsgCompare();
    // var dataController = Get.find<DataController>();
    return NsgDataRequestParams(compare: cmp);
  }
/*
  Future saveImages() async {
    var progress = NsgProgressDialog(textDialog: 'Сохранение фото');
    progress.show();
    try {
      for (var img in images) {
        if (img.image == null) continue;
        if (img.id == '') {
          var pic = Picture();
          pic.name = img.description;
          var dataController = Get.find<DataController>();
          if (dataController.currentPage == NsgPage.naOtgruzku) {
            pic.ownerId = Get.find<ZayavkaNaOtgruzkuController>().currentItem.id;
          } else if (dataController.currentPage == NsgPage.naPriemku) {
            pic.ownerId = Get.find<ZayavkaNaPriemkuController>().currentItem.id;
          } else {
            throw Exception('ОШИБКА IC-47');
          }
          if (kIsWeb) {
            File imagefile = File.fromUri(Uri(path: img.filePath));
            pic.image = await imagefile.readAsBytes();
          } else {
            File imagefile = File(img.filePath);
            pic.image = await imagefile.readAsBytes();
          }
          await pic.post();
        }
      }
      progress.hide();
      Get.back();
    } catch (ex) {
      progress.hide();
      Get.showSnackbar(GetSnackBar(
        title: 'ОШИБКА',
        message: ex.toString(),
      ));
    }
  }

  @override
  Future refreshData({List<NsgUpdateKey>? keys}) async {
    await super.refreshData(keys: keys);
    images.clear();
    for (var element in items) {
      images.add(NsgFilePickerObject(image: Image.memory(Uint8List.fromList(element.image)), description: element.name, fileType: 'jpg', id: element.id));
    }
    return;
  }*/
}
