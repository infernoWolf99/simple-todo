import 'package:flutter/cupertino.dart';

import '../models/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String title) {
    _tasks.add(Task(title));
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
  }
}