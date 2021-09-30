import 'package:flutter_boilerplate/services/hive/hive_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveServiceImpl extends HiveService {
  @override
  bool isExists(String boxName) {
    return Hive.isBoxOpen(boxName);
  }

  @override
  Future<void> addBoxes<T>(List<T> items, String boxName) async {
    final openBox = await Hive.openBox<T>(boxName);

    for (var item in items) {
      openBox.add(item);
    }
  }

  @override
  Future<List<T>> getBoxes<T>(String boxName) async {
    final openBox = await Hive.openBox<T>(boxName);

    return openBox.values.toList();
  }
}
