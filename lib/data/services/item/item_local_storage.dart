import 'package:keeper/domain/entities/item.dart';
import 'package:keeper/utils/data/services/local_storage_service.dart';

class ItemLocalStorage extends LocalStorageService<Item> {
  @override
  final fromJson = Item.fromJson;
}
