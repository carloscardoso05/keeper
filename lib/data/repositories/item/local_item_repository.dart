import 'package:keeper/data/repositories/local_storage_repository.dart';
import 'package:keeper/data/services/item/item_local_storage.dart';
import 'package:keeper/domain/entities/item.dart';

class LocalItemRepository with LocalStorageRepository<Item> {
  @override
  final ItemLocalStorage storage;

  LocalItemRepository(this.storage);
}
