import 'package:get_it/get_it.dart';
import 'package:keeper/data/repositories/item/drift_item_repository.dart';
import 'package:keeper/data/repositories/item/item_repository.dart';
import 'package:keeper/data/repositories/project/drift_project_repository.dart';
import 'package:keeper/data/repositories/project/project_repository.dart';
import 'package:keeper/data/repositories/user/drift_user_repository.dart';
import 'package:keeper/data/repositories/user/user_repository.dart';
import 'package:keeper/data/services/drift/local_db.dart';
import 'package:keeper/data/services/item/drift_item_service.dart';
import 'package:keeper/data/services/project/drift_project_service.dart';
import 'package:keeper/data/services/user/drift_user_service.dart';

Future<void> setupGetIt() async {
  final getIt = GetIt.instance;

  final db = getIt.registerSingleton(LocalDb());

  final userService = getIt.registerSingleton(DriftUserService(db));
  getIt.registerSingleton<UserRepository>(DriftUserRepository(userService));

  final itemService = getIt.registerSingleton(DriftItemService(db));
  getIt.registerSingleton<ItemRepository>(DriftItemRepository(itemService));

  final projectService = getIt.registerSingleton(DriftProjectService(db));
  getIt.registerSingleton<ProjectRepository>(
      DriftProjectRepository(projectService));
}
