import 'package:get_storage/get_storage.dart';

class AppLocalStorage{
  static final AppLocalStorage _instance = AppLocalStorage._internal();
  factory AppLocalStorage() {
    return _instance;
  }
  AppLocalStorage._internal();

  final _storage = GetStorage();

  Future<void> saveData<App>(String key, App value) async {
    await _storage.write(key, value);
  }

  App? readData<App>(String key) {
    return _storage.read(key);
  }
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  Future<void> clearAll() async {
    await _storage.erase();
  }
}