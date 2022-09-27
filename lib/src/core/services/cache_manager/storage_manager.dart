abstract class StorageManager {
  Future<void> writeData(String key, dynamic data);
  Future<dynamic> getData(String key);
  Future<void> removeData(String key);
  Future<void> clean();
}
