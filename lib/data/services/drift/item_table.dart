part of 'local_db.dart';

class ItemTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get assetCode => text()();
  TextColumn get name => text()();
  TextColumn get description => text().withDefault(const Constant(''))();
  IntColumn get holderId => integer().nullable().references(UserTable, #id)();
}
  