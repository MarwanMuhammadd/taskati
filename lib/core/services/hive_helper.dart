import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:taskati/core/model/task_model.dart';
import 'package:taskati/hive/hive_registrar.g.dart';

abstract class HiveHelper {
  static late Box userBox;
  static late Box<TaskModel> taskBox;

  static const String userBoxKey = "userBox";
  static const String taskBoxKey = "taskBox";

  static const String nameKey = "name";
  static const String imageKey = "image";
  static const String isUploadedKey = "isUploaded";
  static const String isDarkKey = "isDark";
  static Future<void> init() async {
    // Register generated adapters before opening typed boxes
    Hive.registerAdapters();

    userBox = await Hive.openBox(HiveHelper.userBoxKey);
    try {
      taskBox = await Hive.openBox<TaskModel>(HiveHelper.taskBoxKey);
    } catch (e) {
      // If there's a type mismatch error, delete the corrupted box and create a new one
      await Hive.deleteBoxFromDisk(HiveHelper.taskBoxKey);
      taskBox = await Hive.openBox<TaskModel>(HiveHelper.taskBoxKey);
    }
  }

  static Future<void> cashData(String key, dynamic value) async {
    await userBox.put(key, value);
  }

  static dynamic getData(String key) {
    return userBox.get(key);
  }

  static Future<void> cashTaskData(String key, TaskModel value) async {
    await taskBox.put(key, value);
  }

  static TaskModel? getTaskData(String key) {
    return taskBox.get(key);
  }

  static Future<void> setData(String name, String image) async {
    await cashData(nameKey, name);
    await cashData(imageKey, image);
  }
}
