import 'package:flutter_todo_app/db/db_helper.dart';
import 'package:flutter_todo_app/models/task.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  @override
  Future<void> onReady() async {
    super.onReady();
  }

  var taskList = <Task>[].obs;

  Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task!);
  }

  //get all data from table
  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.qyery();
    taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
  }
}
