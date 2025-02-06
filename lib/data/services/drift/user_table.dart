part of 'local_db.dart';

class UserTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get type => textEnum<UserType>()();
}
