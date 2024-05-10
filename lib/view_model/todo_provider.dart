import 'package:flutter/material.dart';
import 'package:todo_app/data/local/my_hive.dart';
import 'package:todo_app/models/todo.dart';

class ToDoProvider with ChangeNotifier {
  final TextEditingController todoController = TextEditingController();
  final TextEditingController updatedTodoController = TextEditingController();
  final MyHive _myHive = MyHive();
  List todosList = MyHive.getTodoList();
  List<dynamic> tempList = [];


  ///CRUD Operations using HIVE (Local database)
  /// Adding ToDo task
  void addToDoItem(String toDo) {
    todoController.clear();
    _myHive.setTodoList(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      todoText: toDo,
    );

    /// Getting ToDo task
    MyHive.getTodoList();
    todosList = MyHive.getTodoList();
    notifyListeners();
  }

  /// Deleting ToDo task
  void deleteToDoItem(String id) {
    todosList.removeWhere((item) => item.id == id);
    MyHive.updateList(todosList);
    notifyListeners();
  }

  /// Updating toDo task
  updateToDoItem(String id, String updatedTodo) {
    final todoTask = todosList.firstWhere((task) => task.id == id);
    todoTask.todoText = updatedTodo;
    MyHive.updateList(todosList);
    notifyListeners();
  }

  /// Handling mark as completed/uncompleted ToDo task
  void markAsCompleted(Todo todo, String id) {
    todo.isCompleted = !todo.isCompleted;
    final todoTask = todosList.firstWhere((task) => task.id == id);
    todoTask.isCompleted = todo.isCompleted;
    MyHive.updateList(todosList);
    notifyListeners();
  }
}