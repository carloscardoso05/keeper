import 'package:keeper/data/repositories/local_storage_repository.dart';
import 'package:keeper/data/services/user/user_local_storage.dart';
import 'package:keeper/domain/entities/user.dart';

class LocalUserRepository with LocalStorageRepository<User> {
  @override
  final UserLocalStorage storage;

  LocalUserRepository(this.storage);
}
