import 'package:keeper/domain/entities/user.dart';
import 'package:keeper/utils/data/services/local_storage_service.dart';

class UserLocalStorage extends LocalStorageService<User> {
  @override
  final fromJson = User.fromJson;
}
