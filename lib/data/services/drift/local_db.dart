import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:keeper/domain/entities/project.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:keeper/utils/data/services/json_converter.dart';
import 'package:path_provider/path_provider.dart';

part 'local_db.g.dart';
part 'item_table.dart';
part 'project_table.dart';
part 'user_table.dart';

@DriftDatabase(tables: [UserTable, ItemTable, ProjectTable])
class LocalDb extends _$LocalDb {
  LocalDb() : super(_openConnection());

  @override
  final schemaVersion = 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
