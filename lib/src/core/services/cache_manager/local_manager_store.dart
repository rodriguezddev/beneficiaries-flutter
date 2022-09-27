import 'package:localstorage/localstorage.dart';

import 'storage_manager.dart';

class LocalStorageManager extends StorageManager {
  factory LocalStorageManager() {
    return _instance;
  }

  LocalStorageManager.internal() {
    _localStorage = LocalStorage("bamba.json");
  }

  late final LocalStorage _localStorage;
  static final LocalStorageManager _instance = LocalStorageManager.internal();

  @override
  Future<void> clean() async {
    await _localStorage.clear();
  }

  @override
  Future<dynamic> getData(String key) async {
    await _localStorage.ready;
    final item = await _localStorage.getItem(key);
    return item;
  }

  @override
  Future<void> removeData(String key) async {
    await _localStorage.deleteItem(key);
  }

  @override
  Future<void> writeData(String key, dynamic data) async {
    await _localStorage.ready;
    await _localStorage.setItem(key, data);
  }
}
