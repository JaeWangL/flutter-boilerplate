import 'package:flutter_boilerplate/services/storage/secure_storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageServiceImpl extends SecureStorageService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  Future<void> saveAsync(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  @override
  Future<String?> readAsync(String key) async {
    return await _secureStorage.read(key: key);
  }

  @override
  Future<void> deleteAsync(String key) async {
    await _secureStorage.delete(key: key);
  }

  @override
  Future<void> clearAsync() async {
    await _secureStorage.deleteAll();
  }
}
