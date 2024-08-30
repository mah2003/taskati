import 'package:hive/hive.dart';
import 'package:taskati/core/model/task_model.dart';

class AppLocalStorage {
  static String KeyIsUpLoad = 'IsUploaded';
  static String keyUserImage = 'name';
  static String KeyUserName = 'image';
  static late Box userbox;
  static late Box<TaskModel> taskbox;
  static init() {
    userbox = Hive.box('userbox');
    taskbox = Hive.box('taskbox');
  }

  static cacheDeta(String key, value) {
    userbox.put(key, value);
  }

  static getCasheDeta(String key) {
    return userbox.get(key);
  }

  static cachetask(String key, TaskModel value) {
    taskbox.put(key, value);
  }

  static getCashetask(String key) {
    return taskbox.get(key);
  }
}
