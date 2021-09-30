abstract class HiveService {
  bool isExists(String boxName);

  Future<void> addBoxes<T>(List<T> items, String boxName);

  Future<List<T>> getBoxes<T>(String boxName);
}
