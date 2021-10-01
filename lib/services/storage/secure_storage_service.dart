abstract class SecureStorageService {
  Future<void> saveAsync(String key, String value);

  Future<String?> readAsync(String key);

  Future<void> deleteAsync(String key);

  Future<void> clearAsync();
}
