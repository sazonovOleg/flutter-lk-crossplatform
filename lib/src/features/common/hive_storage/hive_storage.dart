import 'package:hive_flutter/hive_flutter.dart';

class HiveStorage {
  Future<void> saveValue(
    String boxName,
    dynamic value,
  ) async {
    final box = await Hive.openBox(boxName);
    await box.put(boxName, value);
  }

  Future<dynamic> getValue(String boxName) async {
    final box = await Hive.openBox(boxName);

    return box.get(boxName);
  }

  Future<void> clear(String boxName) async {
    final box = await Hive.openBox(boxName);
    await box.clear();
  }
}
