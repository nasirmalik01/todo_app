import 'package:hive/hive.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/res/strings.dart';

class MyHive {
  static const String _todoItems = 'TodoItems';
  static late Box _ins;
  Box get ins => _ins;
  List toDoList = MyHive.getTodoList();

  static init() async {
    Hive.registerAdapter(TodoAdapter());
    _ins = await Hive.openBox<List>(AppStrings.dbName);
  }

   setTodoList({
    required String id,
    required String todoText,
     bool? isDone}) {

    final toDo = Todo(
      id: id,
      todoText: todoText,
      isCompleted: isDone ?? false
    );

    toDoList.add(toDo);
    _ins.put(_todoItems, toDoList);
  }

  static getTodoList() {
    return _ins.get(_todoItems, defaultValue: []);
  }

  static updateList(List todos) async {
    _ins.put(_todoItems, todos.toList());
  }

}
