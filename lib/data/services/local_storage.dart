import 'package:keeper/data/exceptions/exceptions.dart';
import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  AsyncResult<String> set(String key, String value) async {
    try {
      final shared = await SharedPreferences.getInstance();
      shared.setString(key, value);
      return Success(value);
    } catch (e, s) {
      return Failure(LocalStorageException(e.toString(), s));
    }
  }

  AsyncResult<String> remove(String key) async {
    try {
      final shared = await SharedPreferences.getInstance();
      final removed = await get(key);
      await shared.remove(key);
      return removed;
    } catch (e, s) {
      return Failure(LocalStorageException(e.toString(), s));
    }
  }

  AsyncResult<String> get(String key) async {
    try {
      final shared = await SharedPreferences.getInstance();
      final value = shared.getString(key);
      return value != null
          ? Success(value)
          : Failure(LocalStorageException('No data found'));
    } catch (e, s) {
      return Failure(LocalStorageException(e.toString(), s));
    }
  }
}
