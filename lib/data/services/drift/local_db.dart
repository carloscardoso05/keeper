import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:keeper/domain/entities/project.dart';
import 'package:keeper/domain/entities/user.dart';
import 'package:keeper/main.dart';
import 'package:keeper/utils/data/services/json_converter.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

part 'item_table.dart';
part 'local_db.g.dart';
part 'project_table.dart';
part 'user_table.dart';

@DriftDatabase(tables: [UserTable, ItemTable, ProjectTable])
class LocalDb extends _$LocalDb {
  LocalDb() : super(_openConnection());

  @override
  final schemaVersion = 2;

  static QueryExecutor _openConnection() {
    getApplicationSupportDirectory().then(
      (directory) => getIt
          .get<Logger>()
          .d('Trying to open database connection on $directory'),
    );
    final db = driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
    getApplicationSupportDirectory().then(
      (directory) =>
          getIt.get<Logger>().d('Database connection opened on $directory'),
    );
    return db;
  }
}
