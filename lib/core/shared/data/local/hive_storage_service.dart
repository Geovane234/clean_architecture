
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:clean_architecture/core/shared/data/local/storage_service.dart';

// /// [StorageService] interface implementation using the Hive package
// ///
// /// See: https://pub.dev/packages/hive_flutter
// class HiveStorageService implements StorageService {
//   /// A Hive Box
//   late Box<dynamic> hiveBox;

//    @override
//   void init() {
//   }

//   /// Opens a Hive box by its name
//   Future<void> openBox([String boxName = 'key_name']) async {
//     hiveBox = await Hive.openBox<dynamic>(boxName);
//   }

//   @override
//   Future<void> initHive() async {
//     await openBox();
//   }

//   @override
//   Future<void> removeHive(String key) async {
//     await hiveBox.delete(key);
//   }

//   @override
//   dynamic getHive(String key) {
//     return hiveBox.get(key);
//   }

//   @override
//   dynamic getAll() {
//     return hiveBox.values.toList();
//   }

//   @override
//   bool hasHive(String key) {
//     return hiveBox.containsKey(key);
//   }

//   @override
//   Future<void> setHive(String? key, dynamic data) async {
//     await hiveBox.put(key, data);
//   }

//   @override
//   Future<void> clearHive() async {
//     await hiveBox.clear();
//   }

//   @override
//   Future<void> close() async {
//     await hiveBox.close();
//   }
// }
