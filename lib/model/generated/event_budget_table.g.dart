//This is autogenerated file. All changes will be lost after code generation.
import 'package:nsg_data/nsg_data.dart';
// ignore: unused_import
import 'dart:typed_data';
import '../data_controller_model.dart';
class EventBudgetTableGenerated extends NsgDataItem {
  static const nameId = 'id';
  static const nameOwnerId = 'ownerId';
  static const nameCostItemId = 'costItemId';
  static const nameSumNeeded = 'sumNeeded';
  static const nameSumActual = 'sumActual';

  static final Map<String, String> fieldNameDict = {
   nameCostItemId: 'Статья затрат',
   nameSumNeeded: 'Необходимая сумма',
   nameSumActual: 'Фактическая сумма',
 };

  @override
  String get typeName => 'EventBudgetTable';

  @override
  void initialize() {
    addField(NsgDataStringField(nameId), primaryKey: true);
    addField(NsgDataReferenceField<Event>(nameOwnerId), primaryKey: false);
    addField(NsgDataReferenceField<CostItem>(nameCostItemId), primaryKey: false);
    addField(NsgDataDoubleField(nameSumNeeded), primaryKey: false);
    addField(NsgDataDoubleField(nameSumActual), primaryKey: false);
    fieldList.fields[nameCostItemId]?.presentation = 'Статья затрат';
    fieldList.fields[nameSumNeeded]?.presentation = 'Необходимая сумма';
    fieldList.fields[nameSumActual]?.presentation = 'Фактическая сумма';
  }

  @override
  NsgDataItem getNewObject() => EventBudgetTable();

  /// Идентификатор
  @override
  String get id => getFieldValue(nameId).toString();

  @override
  set id(String value) => setFieldValue(nameId, value);

  /// Владелец
  @override
  String get ownerId => getFieldValue(nameOwnerId).toString();
  Event get owner => getReferent<Event>(nameOwnerId);
  Future<Event> ownerAsync() async {
   return await getReferentAsync<Event>(nameOwnerId);
  }

  @override
  set ownerId(String value) => setFieldValue(nameOwnerId, value);
  set owner(Event value) =>
    setFieldValue(nameOwnerId, value.id);

  String get costItemId => getFieldValue(nameCostItemId).toString();
  CostItem get costItem => getReferent<CostItem>(nameCostItemId);
  Future<CostItem> costItemAsync() async {
   return await getReferentAsync<CostItem>(nameCostItemId);
  }

  set costItemId(String value) => setFieldValue(nameCostItemId, value);
  set costItem(CostItem value) =>
    setFieldValue(nameCostItemId, value.id);

  /// НеобходимаяСумма
  double get sumNeeded => getFieldValue(nameSumNeeded) as double;

  set sumNeeded(double value) => setFieldValue(nameSumNeeded, value);

  double get sumActual => getFieldValue(nameSumActual) as double;

  set sumActual(double value) => setFieldValue(nameSumActual, value);

  @override
  String get apiRequestItems {
    return '/Api/EventBudgetTable';
  }
}
