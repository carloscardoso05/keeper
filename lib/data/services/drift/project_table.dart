part of 'local_db.dart';

class ProjectTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get address => text()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  TextColumn get status => textEnum<ProjectStatus>()();
  IntColumn get responsibleId => integer().references(UserTable, #id)();
}
